local cjson = require "cjson"
local str = require "resty.string"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local ran_str = require("resty.random")

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_reg = infopub_themples:get("f_reg")

if g.debug then
    f_reg = nil
end
if f_reg==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_reg.html","r"))
	f_reg = f:read("*a")
	f:close()
	infopub_themples:set("f_reg",f_reg)
end

--get
if ngx.var.request_method == 'GET' then
	f_reg = ngx.re.sub(f_reg, "#POST_ADDR#", ngx.var.document_uri)
	out_str = out_str..f_reg
end

--post
if ngx.var.request_method == 'POST' then
	local phone = nil
	local pass = nil
	local nickname = ''
	ngx.req.read_body()
	local arg = ngx.req.get_post_args()
	for k,v in pairs(arg) do
		if k == 'phone' then
			phone = v
		end
		
		if k == 'password' then
			pass = v
		end
		
		if k == 'nickname' then
			nickname = v
		end
		nickname = string.gsub(nickname,"%%","")
	end
	
	if #phone ~= 10 or string.sub(phone, 1,2) ~= "09" then
		ngx.say('Please enter the correct phone number')
		return 200
	end
    
	if #phone ~= 9 or string.sub(phone, 1,1) ~= "9" then
		ngx.say('Please enter the correct phone number')
		return 200
	end
	
	if phone and string.len(phone)>1 and pass and string.len(pass) then
		--ngx.say('phone->'..phone.."   pass->"..pass)
		local sql = "select phone from info_gg_users where phone="..ngx.quote_sql_str(phone)
		local res, err = mysql.query(sql)
		if res then
			if table.maxn(res) > 0 then
				out_str = out_str..'The cellphone number was already registered.'
				out_str = out_str .. [[
					<script>window.setTimeout("window.location=']].. ngx.var.document_uri ..[['",3000);</script>
					]]
				ngx.header['content-length'] = #out_str
				ngx.say(out_str)
				return 200
			end
		end
		sql = "insert into info_gg_users(`nickname`,`phone`,`username`,`pass`,`reg`,`last`,`salt`) VALUES("..ngx.quote_sql_str(nickname)..","..ngx.quote_sql_str(phone)..","..ngx.quote_sql_str(phone)..","..ngx.quote_sql_str(pass)..",now(),0,"..ngx.quote_sql_str(str.to_hex(ran_str.bytes(3)))..")"
		--ngx.say(sql)
		local res, err = mysql.query(sql)
		if res then
			out_str = out_str..'Registration success'
			out_str = out_str .. [[	<script>window.setTimeout("window.location='/login'",3000);</script>
				]]
		else
			--验证是否插入成功
			sql = "select phone from info_gg_users where phone="..ngx.quote_sql_str(phone)
			res, err = mysql.query(sql)
			if res then
				if table.maxn(res) > 0 then
					out_str = out_str..'Registration success'
					out_str = out_str .. [[	<script>window.setTimeout("window.location='/login'",3000);</script>
					]]
				else
					out_str = out_str..'注册失败---请重试'
					out_str = out_str .. [[
						<script>window.setTimeout("window.location=']].. ngx.var.document_uri ..[['",3000);</script>
						]]
				end
			else
				--数据库异常
				out_str = out_str..'数据库异常---请重试'
				out_str = out_str .. [[
						<script>window.setTimeout("window.location=']].. ngx.var.document_uri ..[['",3000);</script>
						]]
			end
		end
	else
		out_str = out_str..'args error'
		out_str = out_str .. [[
						<script>window.setTimeout("window.location=']].. ngx.var.document_uri ..[['",3000);</script>
						]]
	end
end
--ngx.header['content-length'] = #out_str
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)
