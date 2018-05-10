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

local function del_good_wish(uid, goodid)
	local ret = 0
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_goodid(goodid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local items = cjson.decode(content)
		fpath:close()
		for k, v in ipairs(items) do
			if v.uid == uid then
				table.remove(items, k)
				ret = 1
				break
			end
		end
		funs.savefile(ipath,cjson.encode(items))
	end
	
	--更新发布表收藏数目
	if ret == 1 then
		local sql = "select `wishs` from `info_gg_publist` where id="..tostring(goodid)
		local res = mysql.query(sql)
		if res and #res >0 then
			if tonumber(res[1].wishs) > 0 then
				sql = "update `info_gg_publist` set  `wishs` =  `wishs` -1 where id ="..tostring(goodid)
				mysql.query(sql)
			end
		end
	end
	ngx.log(ngx.INFO, "good_wish file is "..ipath)
	return ret
end

--返回1删除成功
local function del_user_wish(uid, goodid)
	local ret = 0
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_uid(uid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local items = cjson.decode(content)
		fpath:close()
		for k, v in ipairs(items) do
			if v.goodid == tonumber(goodid) then
				table.remove(items, k)
				ret = 1
				break
			end
		end
		funs.savefile(ipath,cjson.encode(items))
	end
	
	ngx.log(ngx.INFO, "user_wish file is "..ipath)
	
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
    
    --更新用户收藏信息
    local uret = del_user_wish(session_info.id, dt.goodid)
    if uret ~= 1 then
    	out.error("更新用户收藏信息失败，你压根就没收藏啊")
    end
    
    --更新商品收藏信息
    local gret = del_good_wish(session_info.id, dt.goodid)
    if uret ~= 1 then
    	out.error("更新用户收藏信息失败，你压根就没收藏啊")
    end
    
    out.done("删除成功")
end

return _M