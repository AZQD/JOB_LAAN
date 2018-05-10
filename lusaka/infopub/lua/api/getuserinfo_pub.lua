local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

--[[

--]]
function _M.main()
	local uid = ngx.var.arg_uid
	local token = session.getcookie('token')
	if token == nil then
		token = session.getfromurl('token')
	end
	
	local session_info = session.gettable(token)

	if not uid then
		out.error('uid is null')
	else
		uid = tonumber(uid)
		if not uid then
			out.error('uid is null')
		end
	end
	
	local sql = "select * from info_gg_users where id="..uid
	local res, err = mysql.query(sql)
	if res and #res == 1 then
		local ret_t = res[1]
		ret_t.pass = nil
		ret_t.salt = nil
		ret_t.username = nil
		if not session_info then
			--未登录
			local tmpphone = string.sub(ret_t.phone, 1,4)
			tmpphone = tmpphone.."*****"
			ret_t.phone = tmpphone
		end
		
		ret_t.last = nil
		out.done(ret_t)
	end
	
	out.error('The user does not exist.')
end

return _M
