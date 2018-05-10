local str = require "resty.string"
local g = require("infopub_config")
local mysql = require "infopub_mysql"
local out = require "infopub_output"
local session = require("infopub_session")
local ran_str = require("resty.random")

local _M = {
    _VERSION = '0.01',
}

--[[
	/apigateway/updatepubstatus
	?token=&status=&goodid=
--]]
function _M.main()
	local token = ngx.var.arg_token
	local status = ngx.var.arg_status
	local goodid = ngx.var.arg_goodid
	
	if not token then
    	out.error('token is null')
    end
    
	local session_info = session.gettable(token)
	
	if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	end
	
	if not status then
		out.error("status is null")
	end
	
	status = tonumber(status)
	if not status then
		out.error("status is error")
	end
	
	if not goodid then
		out.error("goodid is null")
	end
	
	goodid = tonumber(goodid)
	if not goodid then
		out.error("goodid is error")
	end
	
	local uid = session_info.id
	local sql = "update `info_gg_publist` set `status`="..status.." where uid="..uid.." and id="..goodid
	local res, err = mysql.query(sql)
	if res and res.affected_rows == 1 then
		out.done("success")
	else
		out.error("failed")
	end
end

return _M