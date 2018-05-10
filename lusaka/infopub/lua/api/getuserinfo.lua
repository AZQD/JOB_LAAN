local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

--[[
	/apigateway/getuserinfo
	method:post
	{"token":"token","timestamp":1497091791}
	{"token":"8930cfe8eb43d2f45a1df84915987a1e","timestamp":1497091791}
--]]
function _M.main()
	ngx.req.read_body()
    local data = ngx.req.get_body_data()
    if not data then
    	out.error('no body')
    end
    
    local dt = cjson.decode(data)
    if not dt then
    	out.error('data error')
    end
    
    local token = dt.token
    
    if not token then
    	out.error('token is null')
    end
    
	local session_info = session.gettable(token)
	
	if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	end	

	if session_info then
		session_info.salt=nil
		session_info.pass=nil
		session_info.uid = session_info.id
		session_info.id=nil
		out.done(cjson.encode(session_info))
	end
	
	out.error('failed')
end

return _M
