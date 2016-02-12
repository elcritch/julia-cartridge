using Merly

ur= ENV["OPENSHIFT_REPO_DIR"] 
host = getaddrinfo(ENV["OPENSHIFT_JULIA_IP"])
port = parse(Int,ENV["OPENSHIFT_JULIA_PORT"])


server = Merly.app(ur,"jl")
@page "/" File("welcome.html", res)
server.notfound("""
<!DOCTYPE html>
<html>
	<head>
		<title>Not found</title>
	</head>
	<body>
	<h1>404, Not found</h1></body>
</html>
""")

server.start("$host", port)
