local resty_rsa = require "rsa"
local g = require("infopub_config")
local mysql = require "infopub_mysql"
local out = require "infopub_output"
local session = require("infopub_session")

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
	/apigateway/login
	method:post
	{"auth":"AUTH","timestamp":1497091791}
	AUTH=RSA(user=base64(weoigjowejg)&pass=base64(woiejgoijwg))
	{"auth":"o7HVUFlyyUbK5dWr+Go9Pyvh/OKL+aMgh6MkmJU5rwFKe5jvz5wVkfuE8ImxyrHGaqvZIXJSL8QpR4gtnw07ES8XipTnChcqqZxS+Stghals7Sn6x+0O8MneoQLexV5HBNF4bMBGjf00QWFmJw4p8lgNoXDjCU4sAkyIfJfICZ0=","timestamp":1497091791}
--]]
	
function _M.main()
	ngx.req.read_body()
    local data = ngx.req.get_body_data()
    ngx.log(ngx.INFO, data)
    if not data then
    	out.error('no body')
    end
    
    local dt = cjson.decode(data)
    if not dt then
    	out.error('data error')
    end
    
    local auth_en = dt.auth
	---[[
	local priv, err = resty_rsa:new({ private_key = f_prikey })
    if not priv then
    	out.error("new rsa err: ", err)
    end
    local decrypted = priv:decrypt(ngx.decode_base64(auth_en))
    if not decrypted then
    	out.error('decode error')
    end
	
	ngx.log(ngx.INFO, decrypted)
	local m = ngx.re.match(decrypted, [[user=(.*)&pass=(.*)]])
	if not m then
		out.error('data error 1')
	end
	
	local user = ngx.decode_base64(m[1])
	local pass = ngx.decode_base64(m[2])
	--]]
	
	if (not user) or (not pass) then
		out.error('data error 2')
	end
    
    ngx.log(ngx.INFO, 'user='..user.."&pass="..pass)
    local sql = "select * from info_gg_users where phone="..ngx.quote_sql_str(user).." and pass="..ngx.quote_sql_str(pass)
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			local token = ngx.md5(res[1].id..res[1].salt..ngx.now())
			--设置cookie
			session.setcookie('token', token)
			--如果不支持cookie则使用url token
			--保存登录信息
			session.set(token, cjson.encode(res[1]),3600)
			out.done('{"token":"'..token..'"}')
		end
	end
	
	out.error('failed')
end



return _M