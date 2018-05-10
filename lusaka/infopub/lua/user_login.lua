local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_login = infopub_themples:get("f_login")

local ref = ngx.var.http_referer

if g.debug then
    f_login=nil
end
if f_login==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_login.html","r"))
	f_login = f:read("*a")
	f:close()
	infopub_themples:set("f_login",f_login)
end

--get
if ngx.var.request_method == 'GET' then
	local posturl = ngx.var.document_uri
	if ref then
		posturl = posturl.."?r="..ref
	end
	f_login = ngx.re.sub(f_login, "#POST_ADDR#", posturl)
	out_str = out_str..f_login
end

--post
if ngx.var.request_method == 'POST' then
	local phone = nil
	local pass = nil
	local lref = ngx.var.arg_r
	ngx.req.read_body()
	local arg = ngx.req.get_post_args()
	for k,v in pairs(arg) do
		if k == 'phone' then
			phone = v
		end
		
		if k == 'password' then
			pass = v
		end
	end
	
	if phone and string.len(phone)>1 and pass and string.len(pass) then
		local sql = "select * from info_gg_users where phone="..ngx.quote_sql_str(phone).." and pass="..ngx.quote_sql_str(pass)
		local res, err = mysql.query(sql)
		if res then
			if table.maxn(res) > 0 then
				local token = ngx.md5(res[1].id..res[1].salt..ngx.now())
				--设置cookie
				session.setcookie('token', token)
				--如果不支持cookie则使用url token
				--保存登录信息
				session.set(token, cjson.encode(res[1]),3600)
				--ngx.say('登录成功')
				if lref then
					if not string.find(lref, "/reg") and not string.find(lref, "/login") then
						ngx.redirect(lref, 302)
					else
						ngx.redirect('/', 302)
					end
				else
					ngx.redirect('/', 302)
				end
			else
				--登录失败
				out_str = out_str..'Cellphone number or password is wrong.'
			end
		else
			--登录失败
			out_str = out_str..'Cellphone number or password is wrong.'
		end
	end

	out_str = out_str .. [[
		<script>window.setTimeout("window.location=']].. ngx.var.document_uri ..[['",3000);</script>
		]]
end

--ngx.header['content-length'] = #out_str
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)

