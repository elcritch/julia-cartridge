using HttpServer
using HttpCommon
using Merly

#= function error_msg(status)
  msg = STATUS_CODES[status]
  return "
<!DOCTYPE html>
<html>
<head><title>$msg</title></head>
<body><h1>$status - $msg</h1></body>
</html>
"
end =#

ur= ENV["OPENSHIFT_REPO_DIR"] # Example: "/static/js/bootstrap.min.js" becomes "../../static/js/bootstrap.min.js"
host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = parse(Int,ENV["OPENSHIFT_JULIA_PORT"])


  server = Merly.app(ur,"jl")
  @page "/" File("welcome.html", res)

  server.start("$host", port)