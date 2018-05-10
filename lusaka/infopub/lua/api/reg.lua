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
	{"reg":"REGDATA","timestamp":1497091791}
	REGDATA=RSA(user=base64(weoigjowejg)&pass=base64(woiejgoijwg)&nickname=base64(hhelelg))
	{"reg":"o7HVUFlyyUbK5dWr+Go9Pyvh/OKL+aMgh6MkmJU5rwFKe5jvz5wVkfuE8ImxyrHGaqvZIXJSL8QpR4gtnw07ES8XipTnChcqqZxS+Stghals7Sn6x+0O8MneoQLexV5HBNF4bMBGjf00QWFmJw4p8lgNoXDjCU4sAkyIfJfICZ0=","timestamp":1497091791}
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
    
    local reg_en = dt.reg
	---[[
	local priv, err = resty_rsa:new({ private_key = f_prikey })
    if not priv then
    	out.error("new rsa err: ", err)
    end
    local decrypted = priv:decrypt(ngx.decode_base64(reg_en))
    if not decrypted then
    	out.error('decode error')
    end
    
    local m = ngx.re.match(decrypted, [[user=(.*)&pass=(.*)&nickname=(.*)]])
	if not m then
		m = ngx.re.match(decrypted, [[user=(.*)&pass=(.*)]])
		if not m then
			out.error('data error 1')
		end
	end
	
	local user = ngx.decode_base64(m[1])
	local pass = ngx.decode_base64(m[2])
	local nickname = ''
	if #m >2 then
		nickname = ngx.decode_base64(m[3])
	end
	
    --]]
    
    if (not user) or (not pass) then
		out.error('data error 2')
	end
    
	if not ((#user == 10 and string.sub(user, 1,2) == "09")
		or (#user == 9 and string.sub(user, 1,1) == "9")) then
		out.error('Please enter the correct phone number')
	end
	
	ngx.log(ngx.INFO, 'user='..user.."&pass="..pass)
	if user and string.len(user)>1 and pass and string.len(pass) then
		--ngx.say('phone->'..phone.."   pass->"..pass)
		local sql = "select phone from info_gg_users where phone="..ngx.quote_sql_str(user)
		local res, err = mysql.query(sql)
		if res then
			if table.maxn(res) > 0 then
				out.error('This cellphone number has already registered.Please use another one to register.')
			end
		end
		sql = "insert into info_gg_users(`nickname`,`phone`,`username`,`pass`,`reg`,`last`,`salt`) VALUES("..ngx.quote_sql_str(nickname)..","..ngx.quote_sql_str(user)..","..ngx.quote_sql_str(user)..","..ngx.quote_sql_str(pass)..",now(),0,"..ngx.quote_sql_str(str.to_hex(ran_str.bytes(3)))..")"
		--ngx.say(sql)
		local res, err = mysql.query(sql)
		if res then
			out.done('registration success')
		else
			--验证是否插入成功
			sql = "select phone from info_gg_users where phone="..ngx.quote_sql_str(phone)
			res, err = mysql.query(sql)
			if res then
				if table.maxn(res) > 0 then
					out.done('registration success')
				else
					out.done('registration failed')
				end
			else
				--数据库异常
				out.done('Unable to connect to the database')
			end
		end
	else
		out.done('Parameter exception')
	end
end

return _M