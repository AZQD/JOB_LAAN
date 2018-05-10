local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local dic = require("infopub_dic")
local funs = require("infopub_funs")

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_addcomment = infopub_themples:get("f_addcomment")

local ref = ngx.var.http_referer

if g.debug then
    f_addcomment=nil
end
if f_addcomment==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_addcomment.html","r"))
	f_addcomment = f:read("*a")
	f:close()
	infopub_themples:set("f_addcomment",f_addcomment)
end

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

if ngx.var.request_method == 'GET' then
	local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
	local session_info = session.gettable(token)
	if session_info then
		if #session_info.nickname>0 then
			hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.nickname..'</a>'
		else
			hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.phone..'</a>'
		end
	else
		ngx.say([[Please log in!! <br>After three seconds to jump to the login page
		<script>window.setTimeout("window.location='/login'",3000);</script>
		]])
		ngx.exit(200)
	end
	out_str = out_str..f_addcomment
	out_str = ngx.re.sub(out_str, "#POST_ADDR#", ngx.var.document_uri.."?d="..ngx.var.arg_d)
	out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
end

if ngx.var.request_method == 'POST' then
	local content = ''
	ngx.req.read_body()
	local arg = ngx.req.get_post_args()
	for k,v in pairs(arg) do
    	if k == 'content' then
			content = v
		end
    end
	
	if #content > 10 then
		local pubcomment_api = g.api_host.."/apigateway/"..dic.API_PUTCOMMENT
		local pbody = {}
		pbody['token'] = token
		pbody['goodid'] = tostring(ngx.var.arg_d)
		pbody['tocomment'] = ''
		pbody['content'] = content
		pbody['timestamp'] = tostring(ngx.now())
		
		local res, err = funs._post_data(pubcomment_api, nil, nil, cjson.encode(pbody))
		local body_t = funs.json_decode(res.body)
		if not body_t then
			out_str = "Faild"..[[<script>window.setTimeout("window.location='/d/]].. ngx.var.arg_d ..[['",3000);</script>]]
		elseif body_t.status == 200 then
			out_str = "Successfully posted"..[[<script>window.setTimeout("window.location='/d/]].. ngx.var.arg_d ..[['",3000);</script>]]
		end
	else
		out_str = "Content must be greater than 10 characters"
		out_str = out_str..[[<script>window.setTimeout("window.location=']].. ngx.var.http_referer ..[['",3000);</script>]]
	end
end

out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)

