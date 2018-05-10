local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

local uid = 0
local phone=''
local session_info = session.gettable(token)
if session_info then
	uid = session_info.id
	phone = session_info.phone
end
--

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_spub = infopub_themples:get("f_spub")

if g.debug then
    f_spub=nil
end
if f_spub==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_spub.html","r"))
	f_spub = f:read("*a")
	f:close()
	infopub_themples:set("f_spub",f_spub)
end

--get
if ngx.var.request_method == 'GET' then
	out_str = out_str..f_spub
end

out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)
