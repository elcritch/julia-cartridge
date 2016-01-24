using Merly

ur= ENV["OPENSHIFT_REPO_DIR"] 
host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = parse(Int,ENV["OPENSHIFT_JULIA_PORT"])


  server = Merly.app(ur,"jl")
  @page "/" File("welcome.html", res)

  server.start("$host", port)