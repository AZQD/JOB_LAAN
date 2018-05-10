local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local dic = require("infopub_dic")
local funs = require("infopub_funs")

local function checkwish(token, goodid)
	local pbody = {}
	local pubwish_api = g.api_host.."/apigateway/"..dic.API_CHECKWISH
	pbody['token'] = token
	pbody['goodid'] = tostring(goodid)
	pbody['timestamp'] = tostring(ngx.now())
	local res, err = funs._post_data(pubwish_api, nil, nil, cjson.encode(pbody))
	
	if res then
		return tonumber(cjson.decode(res.body).data)
	end
	
	return 0
end

local function getcomnums(goodid)
	local pbody = {}
	local getcomnums_api = g.api_host.."/apigateway/"..dic.API_GETCOMNUMS
	pbody['token'] = ""
	pbody['goodid'] = tostring(goodid)
	pbody['action'] = "good"
	pbody['timestamp'] = tostring(ngx.now())
	local res, err = funs._post_data(getcomnums_api, nil, nil, cjson.encode(pbody))
	
	if res then
		return cjson.decode(res.body).data
	end
	
	return 0
end

local function getimgnumbers(imgs_str)
	local ret_n = 0
	if #imgs_str > 10 then
		ret_n = 1
	end
	for w in string.gmatch(imgs_str, ",") do
    	ret_n = ret_n +1
	end
	
	return ret_n
end

local function getnextdid(did)
	local ref = ngx.var.http_referer
	--搜索、list、收藏
	--/s?p=1&key=eg
	--/list/3?p=1
	--/ulist?p=1
	local ldid = tonumber(did)-1
	local sql = "SELECT id FROM `info_gg_publist` WHERE status=0 and id = "..ldid
	local res, err = mysql.query(sql)
	if res and #res >0 then
		return ldid
	end
	return did
end

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

local uid = 0
local phone='anonymous'
local session_info = session.gettable(token)
if session_info then
	uid = session_info.id
	phone = session_info.phone
end

local dstr = ngx.re.sub(ngx.var.uri, "/d/","")
local n = ngx.re.match(dstr, [[^([0-9]+)]],"")
local did=0
if n ~= nil then
    did=tonumber(n[0])
    if did<0 then
		did = 0
	end
end


local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_details = infopub_themples:get("f_details")

if g.debug then
	f_details = nil
end
if f_details==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_details.html","r"))
	f_details = f:read("*a")
	f:close()
	infopub_themples:set("f_details",f_details)
end

local imgs = ''
local wish_str = [[
<img style="width:14px;height: 15px;vertical-align: -3px;" src="#IMG#" border="0" />
<a href="#URL#" style="font-weight: bold;font-size: 14px;color: #1E1E1E;">#CONTENT#</a>
]]

out_str = out_str..f_details
local sql = "SELECT info_gg_users.nickname,info_gg_users.phone as uphone,info_gg_publist.details, info_gg_publist.imgs, info_gg_publist.phone,info_gg_publist.cid,info_gg_publist.pubtime FROM `info_gg_publist`, `info_gg_users` WHERE info_gg_publist.uid=info_gg_users.id and info_gg_publist.id = "..did
local res, err = mysql.query(sql)
if res and #res >0 then
	for k, v in ipairs(res) do
		--ngx.say(v.details)
		if #v.nickname>0 then
			out_str = ngx.re.sub(out_str, "#USERNAME#", v.nickname)
		else
			out_str = ngx.re.sub(out_str, "#USERNAME#", v.uphone)
		end
		
		out_str = ngx.re.sub(out_str, "#DETAILS#", v.details)
		out_str = ngx.re.sub(out_str, "#PUBTIME#", v.pubtime)
		imgs = v.imgs
		
		local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
		if session_info then
			--登录状态
			out_str = ngx.re.sub(out_str, "#PHONENUMBER#", v.phone)
			if #session_info.nickname>0 then
				hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.nickname..'</a>'
				
			else
				hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.phone..'</a>'
			end
			
			--增加收藏
			--判断是否已经收藏
			if checkwish(token, did) == 0 then
				wish_str = ngx.re.sub(wish_str, "#IMG#", "/static/img/u238.png")
				wish_str = ngx.re.sub(wish_str, "#URL#", "/asmywish?d="..did)
				wish_str = ngx.re.sub(wish_str, "#CONTENT#", "As my wish")
			else--删除收藏
				wish_str = ngx.re.sub(wish_str, "#IMG#", "/static/img/u243.png")
				wish_str = ngx.re.sub(wish_str, "#URL#", "/removewish?d="..did)
				wish_str = ngx.re.sub(wish_str, "#CONTENT#", "Remove")
			end
			out_str = ngx.re.sub(out_str, "#WISH#", wish_str)
			out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
		else
			--未登录
			wish_str = ngx.re.sub(wish_str, "#IMG#", "/static/img/u238.png")
			wish_str = ngx.re.sub(wish_str, "#URL#", "/asmywish?d="..did)
			wish_str = ngx.re.sub(wish_str, "#CONTENT#", "As my wish")
			out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
			out_str = ngx.re.sub(out_str, "#WISH#", wish_str)
			local tmpphone = string.sub(v.phone, 1,4)
			tmpphone = tmpphone.."****"..' <font color="red">(View more details after login)</font>'
			out_str = ngx.re.sub(out_str, "#PHONENUMBER#", tmpphone)
		end
	end
	
	local commentnums_t = getcomnums(did)
	local commentnums_t2 = funs.json_decode(commentnums_t)
	local commentnums = 0
	if commentnums_t2 then
		commentnums = commentnums_t2.num
	end
	out_str = ngx.re.sub(out_str, "#CNUMS#", commentnums)
	
	local imgnums = 0
	if type(imgs) == 'string' then
		imgnums = getimgnumbers(imgs)
	end
	out_str = ngx.re.sub(out_str, "#IMGNUMS#", imgnums)
	out_str = ngx.re.sub(out_str, "#GOODID#", did)
	
	local nextid = getnextdid(did)
	out_str = ngx.re.sub(out_str, "#NEXTURL#", "/d/"..tostring(nextid))
else
	out_str = "not found"..[[<script>window.setTimeout("window.location='/'",3000);</script>]]
end

sql = "update `info_gg_publist` set  `views` =  `views` +1 where id ="..tostring(did)
mysql.query(sql)

out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)

