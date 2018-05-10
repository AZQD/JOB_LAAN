local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")

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

local function strsplit(str, delimiter)
	if str==nil or str=='' or delimiter==nil then
		return nil
	end
	
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end


local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_goodimages = infopub_themples:get("f_goodimages")

local ref = ngx.var.http_referer

if g.debug then
    f_goodimages=nil
end
if f_goodimages==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_goodimages.html","r"))
	f_goodimages = f:read("*a")
	f:close()
	infopub_themples:set("f_goodimages",f_goodimages)
end

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

local goodid = ngx.var.arg_id
local n = ngx.var.arg_n
if not n or #n==0 then
	n = 1
end
n = tonumber(n)

--#NEXTIMG#  #IMGSRC#

local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
local session_info = session.gettable(token)
if session_info then
	if #session_info.nickname>0 then
		hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.nickname..'</a>'
	else
		hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.phone..'</a>'
	end
end

out_str = out_str..f_goodimages
out_str = ngx.re.sub(out_str, "#HITIP#", hitip)

local img_n = 0
local imgs_t = {}
local imgs = ''
if goodid then
	goodid = tonumber(goodid)
	local sql = 'select imgs from info_gg_publist where id = '..goodid
	local res, err = mysql.query(sql)
	if res and #res >0 then
		imgs = res[1].imgs
	end
	if imgs then
		img_n = getimgnumbers(imgs)
		imgs_t = strsplit(imgs,",")
	end
	out_str = ngx.re.sub(out_str, "#IMGNUMS#", img_n)
else
	out_str = ngx.re.sub(out_str, "#IMGNUMS#", 0)
end

--
if img_n>1 and n<img_n then
	out_str = ngx.re.sub(out_str, "#NEXTIMG#", ngx.var.document_uri.."?id="..goodid.."&n="..n+1)
elseif img_n>0 then
	out_str = ngx.re.sub(out_str, "#NEXTIMG#", ngx.var.document_uri.."?id="..goodid.."&n="..n)
else
	out_str = ngx.re.sub(out_str, "#NEXTIMG#", "#")
end

if n>img_n then
	n = img_n
end
	
if img_n == 0 then
	out_str = ngx.re.sub(out_str, "#IMGSRC#", "")
else
	--图片地址
	if img_n == 1 then
		out_str = ngx.re.sub(out_str, "#IMGSRC#", g.img_host_interface.."/"..imgs.."/200")
	elseif img_n>1 then
		out_str = ngx.re.sub(out_str, "#IMGSRC#", g.img_host_interface.."/"..imgs_t[n].."/200")
	end
end

out_str = ngx.re.sub(out_str, "#IMGCUR#", n)
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)

