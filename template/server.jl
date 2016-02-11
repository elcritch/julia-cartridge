
using HttpServer
using Mux
using Mux.App
using Mux.http_handler

import Mux.serve

@app test = (
  Mux.defaults,
  page(respond("<h1>Hello World!</h1>")),
  page("/about",
       probabilty(0.1, respond("<h1>Boo!</h1>")),
       respond("<h1>About Me</h1>")),
  page("/user/:user", req -> "<h1>Hello, $(req[:params][:user])!</h1>"),
  Mux.notfound(),
)


serve(h::App; host = default_host, port = default_port) =
         serve(Server(http_handler(h)), host=host, port=port)

host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = parse(Int,ENV["OPENSHIFT_JULIA_PORT"])

serve(test, host=host, port=port)


