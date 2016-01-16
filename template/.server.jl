using HttpServer
using Mux
using HttpCommon
#using WebSockets
import JSON
using Mongo, LibBSON


client = MongoClient("mongodb://$OPENSHIFT_MONGODB_DB_HOST:$OPENSHIFT_MONGODB_DB_PORT/")

function error_msg(status)
  msg = STATUS_CODES[status]
  return "
<!DOCTYPE html>
<html>
<head><title>$msg</title></head>
<body><h1>$status - $msg</h1></body>
</html>
"
end

function serve_file(req, res)
    # Serve file as is.
    # Permission to access the file is determined by middleware.
    ur= ENV["OPENSHIFT_REPO_DIR"]
    filename    = string(ur, req.resource)    # Example: "/static/js/bootstrap.min.js" becomes "../../static/js/bootstrap.min.js"
    res2        = FileResponse(filename)           # A Response object containing the file in its data field
    res.status  = res2.status
    res.headers = res2.headers
    res.data    = res2.data
end


@app test = (
         Mux.defaults,
         page(respond("<h1>Hello World!</h1>")),
         page("/about",
              probabilty(0.1, respond("<h1>Boo!</h1>")),
              respond("<h1>About Me</h1>")),
         page("/user/:user", req -> "<h1>Hello, $(req[:params][:user])!</h1>"),
        Mux.notfound())


host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = int(ENV["OPENSHIFT_JULIA_PORT"])

#serve(test,8080)

run(Server(Mux.http_handler(app)), port)