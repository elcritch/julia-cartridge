# julia-cartridge


Julia Openshift Cartridge



Provide the next URL for cartridge definition when create a new application:
https://raw.githubusercontent.com/elcritch/julia-cartridge/master/metadata/manifest.yml

##Example
The most convenient way for use this cartridge it's using Red-Hat Client (Installation, configuration and further info can be found in https://developers.openshift.com/en/managing-client-tools.html), we'll do next things:
* Create your application
* Login and using julia
* Optionally start the web server and test

#### Create your application
Open your terminal and type:
<pre><code>~ $ rhc app create my_project_name https://raw.githubusercontent.com/elcritch/julia-cartridge/master/metadata/manifest.yml
Your application 'my_project_name' is now available.
  URL:        http://my_project_name-your_user.rhcloud.com/
  SSH to:     55a5cdf...@my_project_name-your_user.rhcloud.com
  Git remote: ssh://55a5cdf...@my_project_name-your_user.rhcloud.com/~/git/my_project_name
.git/
  Cloned to:  ~/my_project_name
</code></pre>
Here "my_project_name" is the project's name that you choose, "your_user" is the username registered at openshift


#### Login and using julia
<pre><code>~ $ rhc ssh my_project_name
Connecting to 55a5cdf...@my_project_name-your_user.rhcloud.com ...
[my_project_name-your_user.rhcloud.com 55a5cdf...]\> julia  # now type julia!
               _
   _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
   _ _   _| |_  __ _   |  Type "help()" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.4.3 (2016-01-12 21:37 UTC)
 _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
|__/                   |  x86_64-unknown-linux-gnu

julia></code></pre>

#### Start web server
If not already started, you can start web server with:

Using Red-Hat client:
<pre><code>~ $ rhc app start -a my_project_name</code></pre>

Or from ssh connection, inside openshift terminal:
<pre><code>[my_project_name-your_user.rhcloud.com 55a5cdf...]\> gear start</code></pre>

Now you can test the next urls in your browser:
<pre><code>http://my_project_name-your_user.rhcloud.com
http://my_project_name-your_user.rhcloud.com/welcome.html
http://my_project_name-your_user.rhcloud.com/static/test.html
</code></pre>

By default, all files that have no extension will be displayed .jl:
<pre><code>http://my_project_name-your_user.rhcloud.com/server.jl   # 404: Not Found</code></pre>



You must edit <strong>server.jl</strong> for adding your own content! You can see the original code at https://github.com/elcritch/julia-cartridge/blob/master/template/server.jl, it was created using Merly
https://github.com/elcritch/Merly.jl


##TODO:
* Make tools for easy deploy for parallel processing in openshift
