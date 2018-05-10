local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

--[[
输入:
	{
		"token":"", 			//用户登录凭证，如果是匿名发布则留空""
		"id","",				//产品ID
		"cid":"",				//产品分类ID
		"issell":"",			//是否是出售，"1"为出售，"0"为需求
		"goodstatus":"",		//产品新旧,"0","1","2","3","4","5"...
		"price":"",				//价格
		"title":"title",		//标题
		"details":"details",	//产品详情
		"addr_l1":"",			//一级地址 ID
		"addr_l2":"",			//二级地址 ID
		"addr_l3":"",			//三级地址 ID
		"addr_l4":"",			//详细地址
		"contactname":"name",	//联系人姓名
		"phone":"phone",		//联系人手机
		"imgs":""				//产品图片ID，图片ID通过图片上传接口获得
	}
--]]

local function gsqlstr(dt,uid)
	
	if not dt.title or type(dt.title) == "userdata" then
		dt.title = ""
	end
	
	if not dt.details or type(dt.details) == "userdata" then
		dt.details = ""
	end
	
	if not dt.contactname or type(dt.contactname) == "userdata" then
		dt.contactname = ""
	end
	
	if not dt.phone or type(dt.phone) == "userdata" then
		dt.phone = ""
	end
	
	if not dt.imgs or type(dt.imgs) == "userdata" then
		dt.imgs = ""
	end
	
	if not dt.addr_l4 or type(dt.addr_l4) == "userdata" then
		dt.addr_l4 = ""
	end
	
	if not dt.addr_l1 or type(dt.addr_l1) == "userdata" then
		dt.addr_l1 = 1
	end
	
	if not dt.addr_l2 or type(dt.addr_l2) == "userdata" then
		dt.addr_l2 = 11
	end
	
	
	local sql = "UPDATE `info_gg_publist` SET `title`="
	sql = sql ..ngx.quote_sql_str(dt.title)..",`details`="..ngx.quote_sql_str(dt.details)
	sql = sql .. ",`goodstatus`="..tonumber(dt.goodstatus)..",`price`="..tonumber(dt.price)..",`imgs`="..ngx.quote_sql_str(dt.imgs)
	sql = sql .. ",`contactname`="..ngx.quote_sql_str(dt.contactname)..",`phone`="..ngx.quote_sql_str(dt.phone)
	sql = sql ..",`cid`="..tonumber(dt.cid)..",`issell`="..tonumber(dt.issell)
	sql = sql ..",`addr_l1`="..tonumber(dt.addr_l1)..",`addr_l2`="..tonumber(dt.addr_l2)..",`addr_l4`="..ngx.quote_sql_str(dt.addr_l4)
	sql = sql .." WHERE id="..tonumber(dt.id).." and uid="..uid
	
    ngx.log(ngx.INFO, sql)
    return sql
end

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
    
    if not dt.token or (dt.token and #dt.token==0) then
    	out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    local session_info = session.gettable(dt.token)
    if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    if not dt.id or #dt.id<1 then
    	out.error("id is error")
    end
    
    if #dt.cid<1 then
    	dt.cid = 1
    end
    local sql = gsqlstr(dt, session_info.id)
	local res, err = mysql.query(sql)
	if res and res.affected_rows ==1 then
		out.done("success")
	end
	
	out.error("failed")
end

return _M
