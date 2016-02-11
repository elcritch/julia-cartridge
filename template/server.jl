
using Mux

@app test = (
  Mux.defaults,
  page(respond("<h1>Hello World!</h1>")),
  page("/about",
       probabilty(0.1, respond("<h1>Boo!</h1>")),
       respond("<h1>About Me</h1>")),
  page("/user/:user", req -> "<h1>Hello, $(req[:params][:user])!</h1>"),
  Mux.notfound(),
)

host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = int(ENV["OPENSHIFT_JULIA_PORT"])
serve(Server(http, ws), host=host, port=port)


