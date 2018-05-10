local resty_rsa = require "rsa"
local str = require "resty.string"
local g = require("infopub_config")
local mysql = require "infopub_mysql"
local out = require "infopub_output"
local session = require("infopub_session")
local ran_str = require("resty.random")

local _M = {
    _VERSION = '0.01',
}

local infopub_themples = ngx.shared.infopub_themples
local f_prikey = infopub_themples:get("f_prikey")

if g.debug then
    f_prikey=nil
end
if f_prikey==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."lua/common/private.pem","r"))
	f_prikey = f:read("*a")
	f:close()
	infopub_themples:set("f_prikey",f_prikey)
end


--[[
	/apigateway/reg
	method:post
	{"token":"","data":"DATA","timestamp":ngx.now()}
	DATA=RSA(oldpass=base64(weoigjowejg)&newpass=base64(woiejgoijwg))
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
    
    local change_data = dt.data
	---[[
	local priv, err = resty_rsa:new({ private_key = f_prikey })
    if not priv then
    	out.error("new rsa err: ", err)
    end
    local decrypted = priv:decrypt(ngx.decode_base64(change_data))
    if not decrypted then
    	out.error('decode error')
    end
    
    local m = ngx.re.match(decrypted, [[oldpass=(.*)&newpass=(.*)]])
	if not m then
		out.error('data error 1')
	end
	
	local oldpass = ngx.decode_base64(m[1])
	local newpass = ngx.decode_base64(m[2])
	
    --]]
    
    if (not oldpass) or (not newpass) then
		out.error('data error 2')
	end
    
	ngx.log(ngx.INFO, 'oldpass='..oldpass.."&newpass="..newpass)
	if oldpass and string.len(oldpass)>1 and newpass and string.len(newpass) then
		if oldpass == session_info.pass then
			--可以更新密码了
			local sql = [[update `info_gg_users` SET `pass`=]]..ngx.quote_sql_str(newpass)..[[ WHERE id=]]..session_info.id
			local res, err = mysql.query(sql)
			if res and res.affected_rows == 1 then
				session_info.pass = newpass
				session.update(token, cjson.encode(session_info),3600)
				out.done("Your password is changed sucessfully.")
			else
				out.error("failed")
			end
		else
			out.error('Sorry, failed to change your password. Please try it later.')
		end
	else
		out.error('Parameter exception')
	end
end

return _M