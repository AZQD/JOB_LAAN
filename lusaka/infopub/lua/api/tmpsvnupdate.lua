local g = require("infopub_config")

local svnupdate = "/root/lusakaupdate.sh"

ngx.say(os.execute(svnupdate))
ngx.say(os.execute("ls -alh"))

ngx.say("OK")
