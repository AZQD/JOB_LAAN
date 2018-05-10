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
{
	"token":"",
	"nickname":"nickname",
	"sex":"1/2",
	"logo":"img_id",
	"timestamp":1497091791
	}
	
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
    
    local sex = dt.sex
    local logo = dt.logo
    local nickname = dt.nickname
    
    if sex then
    	sex = tonumber(sex)
    	if not sex then
    		sex = 0
    	end
    else
    	sex = 0
    end
    
    if logo and #logo>10 then
    	logo = logo
    else
    	logo = session_info.logo
    end
    
    if nickname and #nickname>0 then
    	nickname = nickname
    else
    	nickname = session_info.nickname
    end
    
    local sql = [[update `info_gg_users` set `sex` = ]]..sex..[[,`nickname` = ]]..ngx.quote_sql_str(nickname)..[[,`logo` = ]]..ngx.quote_sql_str(logo).." where id="..session_info.id
    local res, err = mysql.query(sql)
	if res and res.affected_rows == 1 then
		session_info.sex = sex
		session_info.logo = logo
		session_info.nickname = nickname
		session.update(token, cjson.encode(session_info),3600)
		out.done("success")
	else
		out.error("faild")
	end
end

return _M
