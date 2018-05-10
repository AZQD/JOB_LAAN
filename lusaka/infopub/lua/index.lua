local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local funs = require("infopub_funs")

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

local uid = 0
local phone=''
local session_info = session.gettable(token)
if session_info then
	uid = session_info.id
	phone = session_info.phone
end
--

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_index = infopub_themples:get("f_index")

if g.debug then
    f_index=nil
end
if f_index==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_index.html","r"))
	f_index = f:read("*a")
	f:close()
	infopub_themples:set("f_index",f_index)
end

--get
if ngx.var.request_method == 'GET' then
	local cate_str = ''
	local sql = "SELECT * FROM `info_gg_category` WHERE main=1 and name <> 'Students'"
	local res, err = mysql.query(sql)
	if res then
		local inu=1
		for k, v in ipairs(res) do
			if v.id ~= 1 then
				if math.fmod(inu, 4)==0 then
					cate_str = cate_str .. '<br>'
				end
				if v.id == 2 then
					cate_str = cate_str .. '<a href="/list/'..v.id..'" style="font-size: 18px;font-weight: 700; color: #000000; padding-right: 10px;">'..v.name..'</a> '
				else
					cate_str = cate_str .. '<a href="/list/'..v.id..'" style="font-size: 18px;font-weight: 700; color: #666666; padding-right: 10px;">'..v.name..'</a> '
				end
				
				inu = inu +1
			end
		end
	end
	
	cate_str = cate_str .. '<a href="/list/1" style="font-size: 18px;font-weight: 700; color: #000000;">Others</a> '
	f_index = ngx.re.sub(f_index, "#CATE#", cate_str)
	local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
	if session_info then
		if #session_info.nickname>0 then
			hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.nickname..'</a>'
		else
			hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.phone..'</a>'
			
		end
	end
	f_index = ngx.re.sub(f_index, "#HITIP#", hitip)
	f_index = ngx.re.sub(f_index, "#CATE#", cate_str)
	out_str = out_str..f_index
end

local toptip = funs.gettoptipinfo()
out_str = ngx.re.sub(out_str, "#TOPTIP#", toptip)
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)

