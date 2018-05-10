local cjson = require "cjson"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")

local pubstr = ngx.re.sub(ngx.var.uri, "/pub/","")
local n = ngx.re.match(pubstr, [[^([0-9]+)]],"")
local action = '1'

if n ~= nil then
	action = n[0]
	if action ~= '1' and action ~= '2' then
		action = '1'
	end
end

local issell = 1
--sell
if action == '1' then
	--sell
	issell = 1
else
	--need
	issell = 0
end

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

local login_tip = [[    
    <tr style="background-color: #ff0000;height: 30px;line-height: 30px;">
        <td width="80%" style="font-size: 13px;color: #ffffff;padding-left: 10px;">
            Message will be deleted 7 days later.
        </td>
        <td width="20%" align="right">
            <a href="/login" style="font-weight: 700;font-style: normal;font-size: 18px;color: #ffffff;padding-right: 5px;">Login</a>
        </td>
    </tr>
]]

local logined_tip = [[
	<tr>
	    <td style="padding-top: 10px;letter-spacing: 0; padding-left:10px;padding-right:10px">
	        <font style="font-size: 18px;font-weight: 700;">#SELLORNEED#</b>
	    </td>
	    <td style="padding-top: 10px; letter-spacing: 0; padding-right:10px" align="right">
			<a href="/s"><img src="/static/img/search.png" style="width:18px;height: 18px;vertical-align: -3px;"/></a><a href="/ulist" style="font-size: 14px;color: #333333;"> Hi,#NICKNAME#</a>
	    </td>
	</tr>
]]

local tip2 = [[<tr style="height: 30px;line-height: 30px;">
                                <td style="font-size: 13px;letter-spacing: 0;color: #999999;">
                                    Message will be hidden 3 months later.
                                </td>
                            </tr>]]

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_pub = infopub_themples:get("f_pub")

if g.debug then
    f_pub=nil
end
if f_pub==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_pub.html","r"))
	f_pub = f:read("*a")
	f:close()
	infopub_themples:set("f_pub",f_pub)
end

--get
if ngx.var.request_method == 'GET' then
	if issell == 1 then
		f_pub = ngx.re.sub(f_pub, "#PLACETIP#", "Please enter your goods key info and your address.")
	else
		f_pub = ngx.re.sub(f_pub, "#PLACETIP#", "Please enter your detail request and your address.")
	end
    if uid ==0 then
		f_pub = ngx.re.sub(f_pub, "#LOGIN_TIP#", login_tip)
		f_pub = ngx.re.sub(f_pub, "#TIP2#", "")
	else
		if #session_info.nickname>0 then
			logined_tip = ngx.re.sub(logined_tip, "#NICKNAME#", session_info.nickname)
		else
			logined_tip = ngx.re.sub(logined_tip, "#NICKNAME#", session_info.phone)
		end
		if issell == 1 then
			logined_tip = ngx.re.sub(logined_tip, "#SELLORNEED#", 'Sell Something')
		else
			logined_tip = ngx.re.sub(logined_tip, "#SELLORNEED#", 'Need Something')
		end
		f_pub = ngx.re.sub(f_pub, "#LOGIN_TIP#", logined_tip)
		f_pub = ngx.re.sub(f_pub, "#TIP2#", tip2)
	end
	f_pub = ngx.re.sub(f_pub, "#POST_ADDR#", ngx.var.document_uri)
	f_pub = ngx.re.sub(f_pub, "#PHONE_NUMBER#", phone)
	out_str = out_str..f_pub
end

--post
if ngx.var.request_method == 'POST' then
	local details = nil
	local phone = nil
	ngx.req.read_body()
	local arg = ngx.req.get_post_args()
	for k,v in pairs(arg) do
		if k == 'details' then
			details = v
		end
		
		if k == 'phone' then
			phone = v
		end
	end
	
	if #details > 10 then
		local sql = "insert into info_gg_publist(`uid`,`details`,`phone`,`cid`,`issell`,`pubtime`) VALUES("
		sql = sql .. uid .. ","
		sql = sql .. ngx.quote_sql_str(details) .. ","
		sql = sql .. ngx.quote_sql_str(phone) .. ","
		sql = sql .. "1" .. ","
		sql = sql .. issell ..","
		sql = sql .. "now())"
		--ngx.say(sql)
		local res, err = mysql.query(sql)
		if res then
			out_str = out_str..'Successfully posted'
			out_str = out_str .. [[<script>window.setTimeout("window.location='/d/]].. res.insert_id ..[['",3000);</script>]]
		end
	else
		out_str = "Content must be greater than 10 characters"
		out_str = out_str..[[<script>window.setTimeout("window.location=']].. ngx.var.http_referer ..[['",3000);</script>]]
	end
	--ngx.redirect('/list',302)
end

out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)
