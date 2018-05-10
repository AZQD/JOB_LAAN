local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local dic = require("infopub_dic")
local funs = require("infopub_funs")

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_comments = infopub_themples:get("f_comments")

local ref = ngx.var.http_referer
local m = ngx.re.match(ref, [[/d/([0-9]+)]],"")
local goodid = m[1]

if g.debug then
    f_comments=nil
end
if f_comments==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_comments.html","r"))
	f_comments = f:read("*a")
	f:close()
	infopub_themples:set("f_comments",f_comments)
end

local token = session.getcookie('token')
if token == nil then
	token = session.getfromurl('token')
end

local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
local session_info = session.gettable(token)
if session_info then
	if #session_info.nickname>0 then
		hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.nickname..'</a>'
	else
		hitip = '<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,'..session_info.phone..'</a>'
	end
end

out_str = out_str..f_comments
out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
out_str = ngx.re.sub(out_str, "#GOODID#", goodid)

local c_item_t = [[
	<tr>
		<td colspan="2" style=" color: #333333; font-size: 13px;letter-spacing: 0;padding-top: 6px;padding-bottom: 6px;border-bottom: 1px solid #F4DDD5;padding-left: 5px;padding-right: 5px;">
			<span style="font-weight: 700;font-size: 14px;padding-right: 4px;">[#NAME#]</span>&nbsp;#CONTENT#
		</td>
	</tr>
]]


local item_end = [[<tr style="height: 0px; line-height: 0px; background-color: #ffffff;border-top: 1px solid #ff0000;"><td colspan="2" style="background-color: #f2f2f2"></td></tr>]]
local outcomments = [[
	<tr>
		<td colspan="2">
		No Comments.
		</td>
	</tr>
]]


--[[
	{
		"token":"",			//登录凭证，当action="user" 时必须指定
		"goodid":"",		//商品ID, 当action="good" 时必须指定
		"action":"",		//good or user
		"start":"",			//从第几条开始
		"num":""			//获得几条,最多20条
	}
--]]
local getcomment_api = g.api_host.."/apigateway/"..dic.API_GETCOMMENT
local pbody = {}
pbody['token'] = token
pbody['goodid'] = tostring(goodid)
pbody['action'] = 'good'
pbody['start'] = '1'
pbody['num'] = '10'

local res, err = funs._post_data(getcomment_api, nil, nil, cjson.encode(pbody))
if res then
	local rest = cjson.decode(res.body)
	if rest.status == 200 then
		local comments = cjson.decode(rest.data)
		outcomments = ""
		for k, v in ipairs(comments) do
			local tnick = v.nick_name
			tnick = string.sub(tnick, 1,4)
			tnick = tnick.."*****"
			local tmpstr = ngx.re.sub(c_item_t, "#NAME#", tnick)
			tmpstr = ngx.re.sub(tmpstr, "#CONTENT#", v.content)
			if k ~= #comments then
				tmpstr = tmpstr..item_end
			end
			outcomments = outcomments..tmpstr
		end
	end
end

out_str = ngx.re.sub(out_str, "#COMMENTS#", outcomments)
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)
