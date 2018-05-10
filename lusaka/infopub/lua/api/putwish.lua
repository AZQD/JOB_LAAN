local cjson = require "cjson"
local str = require "resty.string"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local ran_str = require("resty.random")
local session = require("infopub_session")
local out = require "infopub_output"
local funs = require("infopub_funs")

local _M = {
    _VERSION = '0.01',
}

--[[
输入:
	{
		"token":"", 			//用户登录凭证，如果是匿名发布则留空""
		"goodid":"",			//产品ID
		"timestamp":""			//时间戳
	}
--]]

--返回1 更新成功
local function update_user_wish(item)
	local ret = 1
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_uid(item.uid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		--没有收藏文件，则创建
		items[1] = item
		funs.savefile(ipath,cjson.encode(items))
		ret = 1
	else
		local content = fpath:read("*a")
		local items = cjson.decode(content)
		fpath:close()
		for k, v in ipairs(items) do
			if v.goodid == item.goodid then
				ret = 0
				break
			end
		end
		
		if ret == 1 then
			--更新收藏内容
			table.insert(items, item)
			--写入文件
			funs.savefile(ipath,cjson.encode(items))
		end
	end
	
	ngx.log(ngx.INFO, "user_wish file is "..ipath)
	return ret
end

--返回1 更新成功
local function update_good_wish(item)
	local ret = 1
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_goodid(item.goodid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		--没有收藏文件，则创建
		items[1] = item
		funs.savefile(ipath,cjson.encode(items))
		ret = 1
	else
		local content = fpath:read("*a")
		local items = cjson.decode(content)
		fpath:close()
		
		for k, v in ipairs(items) do
			if v.uid == item.uid then
				ret = 0
				break
			end
		end
		
		if ret == 1 then
			--更新收藏内容
			table.insert(items, item)
			--写入文件
			funs.savefile(ipath,cjson.encode(items))
		end
	end
	
	--更新发布表收藏数目
	if ret == 1 then
		local sql = "update `info_gg_publist` set  `wishs` =  `wishs` +1 where id ="..tostring(item.goodid)
		mysql.query(sql)
	end
	
	ngx.log(ngx.INFO, "good_wish file is "..ipath)
	return ret
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
    	--未登陆
    	out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    --session过期
    local session_info = session.gettable(dt.token)
    if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    local wish_item = {}
    wish_item['uid'] = tonumber(session_info.id)
    wish_item['nick_name'] = session_info.nickname
    wish_item['logo_url'] = session_info.logo
    wish_item['create_time'] = ngx.now()
    wish_item['goodid'] = tonumber(dt.goodid)
    
    --更新用户收藏信息
    local uret = update_user_wish(wish_item)
    if uret ~= 1 then
    	out.error("更新用户收藏信息失败，极大可能您已经收藏了")
    end

    --更新商品收藏信息
    local gret = update_good_wish(wish_item)
    if gret ~=1 then
    	out.error("更新商品收藏信息失败，极大可能您已经收藏了")
    end
    
    out.done("收藏成功")
end

return _M