local cjson = require "cjson"
local str = require "resty.string"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local ran_str = require("resty.random")
local session = require("infopub_session")
local dic = require("infopub_dic")
local funs = require("infopub_funs")

local function getwishsbytoken(token, start)
	local pbody = {}
	pbody['token'] = token
	pbody['goodid'] = ""
	pbody['action'] = "user"
	pbody['start'] = tostring(start)
	if pbody['start'] == '0' then
		pbody['start'] = '1'
	end
	pbody['num'] = tostring(g.page_items)
	local pubwish_api = g.api_host.."/apigateway/"..dic.API_GETWISH
	local res, err = funs._post_data(pubwish_api, nil, nil, cjson.encode(pbody))
	if not res then
		return nil
	end
	
	local rest = cjson.decode(res.body)
	if not rest then
		return nil
	end
	
	if rest.status ~= 200 then
		return nil
	end
	
	local retstr = "("
	local datalist = cjson.decode(rest.data)
	for k, v in ipairs(datalist) do
		retstr = retstr..v.goodid..","
	end
	
	retstr = string.sub(retstr, 1, -2)
	retstr = retstr .. ")"
	return retstr
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

local liststr = ngx.re.sub(ngx.var.uri, "/list/","")
local n = ngx.re.match(liststr, [[^([0-9]+)]],"")
local cid = 0
local listid = ngx.var.arg_p
if listid == nil then
    listid=0
end

local mysqlstart = 0
listid = tonumber(listid)
if listid >1 then
	mysqlstart = g.page_items * (listid-1)
end

if n ~= nil then
	cid = tonumber(n[0])
end

--获得用户的收藏信息
local wishs = getwishsbytoken(token, mysqlstart)
local ext_where
if wishs then
	ext_where= 'where id in '..wishs
else
	ext_where= 'where id in (0) and 1=2'
end

local out_str = ''
local infopub_themples = ngx.shared.infopub_themples
local f_list = infopub_themples:get("f_list")

if g.debug then
    f_list = nil
end
if f_list==nil then
	local base_dir = g.base_dir
	local f = assert(io.open(base_dir.."themples/default/f_list.html","r"))
	f_list = f:read("*a")
	f:close()
	infopub_themples:set("f_list",f_list)
end

--get
if ngx.var.request_method == 'GET' then
	local list_item = ''
	local sql = "select * from info_gg_publist "..ext_where.." order by id desc limit ".. mysqlstart .. ","..g.page_items
	local res, err = mysql.query(sql)
	if res then
		for k, v in ipairs(res) do       
			list_item = list_item..'<a href="/d/'..v.id..'" style="height: 20px; line-height: 20px;display:inline-block;margin-bottom: 2px;background-color: #D7D7D7;font-size: 14px;color: #333333;width:100%;text-decoration: none;">'
			list_item = list_item..'<span style="width: 60%;display:inline-block;text-align: left;text-indent: 3px;">'
			
			local pend = funs.getlatestpos(v.details, 18)
			list_item = list_item .. string.sub(v.details, 1,pend) ..'<span style="color: #ff0000;">('..v.views..")</span></span>"
				
			list_item = list_item..'<span style="width: 36%;display:inline-block;text-align: right">'
			list_item = list_item..string.sub(v.pubtime,1,10).."</span>"
			list_item = list_item..'</a>'
		end
	end
	--总条数
	local tnumber = 0
	local tpage = 0

	sql = "select count(id) as n from info_gg_publist "..ext_where
	local res, err = mysql.query(sql)
	if res then
		tnumber = res[1].n
	end
	tpage = math.ceil(tnumber/g.page_items)
	
	out_str = out_str..f_list
	out_str = ngx.re.sub(out_str, "#LIST_ITEM#", list_item)
	
	--
	local page_n = ''
	local ncurl = 1
	local next_url = '#'
	if listid == 0 or listid==1 then
		page_n = '<span>1</span>/<span>'..tpage..'</span>'
		next_url = ngx.var.document_uri.."?p=2"
		if tpage == 1 then
			next_url = ngx.var.document_uri.."?p=1"
		end
		
	else
		ncurl = listid
		page_n = '<span>'..listid ..'</span>/<span>'..tpage..'</span>'
		next_url = ngx.var.document_uri.."?p="..listid+1
		if listid+1>tpage then
			next_url = ngx.var.document_uri.."?p="..tpage
		end
	end
	
	if tpage == 0 or tpage ==1 then
		next_url = ngx.var.document_uri.."?p=1"
	end
	
	out_str = ngx.re.sub(out_str, "#NEXT#", next_url)
	out_str = ngx.re.sub(out_str, "#PAGE_N#", page_n)
	out_str = ngx.re.sub(out_str, "#NCUR#",ncurl)
	out_str = ngx.re.sub(out_str, "#NMAX#",tpage)
	
	local hitip = '<a href="/login" style="font-weight: 700; font-size: 20px;color:#000000;" aligh="right">Login</a>'
	if session_info then
		if #session_info.nickname>0 then
			hitip = '<a href="/s"><img src="/static/img/search.png" width="20px"/></a> hi,'..session_info.nickname
		else
			hitip = '<a href="/s"><img src="/static/img/search.png" width="20px"/></a> hi,'..session_info.phone
			
		end
		out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
	else
		out_str = ngx.re.sub(out_str, "#HITIP#", hitip)
	end
	
end

local toptip = funs.gettoptipinfo()
out_str = ngx.re.sub(out_str, "#TOPTIP#", toptip)
out_str = ngx.re.sub(out_str, "</body>", g.wap_analytics.."</body>")
ngx.say(out_str)