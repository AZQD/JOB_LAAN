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
	{
		"token":"",			//登录凭证，当action="user" 时必须指定
		"goodid":"",		//商品ID, 当action="good" 时必须指定
		"action":"",		//good or user
		"start":"",			//从第几条开始
		"num":""			//获得几条,最多20条
	}
--]]

--返回status, data
--status == 1成功获得
local function getbyuid(uid, start, num)
	local ret = 1
	local retdata = {}
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_uid(uid)
	local fpath = funs.tryopenfile(ipath)
	--压根没有评论
	if not fpath then
		ret = 0
		return ret, nil
	end
	
	local content = fpath:read("*a")
	local items = cjson.decode(content)
	fpath:close()
	
	--压根没这么多评论
	if start > #items then
		ret = 0
	end
	
	local finish_n = #items-start
	if finish_n > num then
		finish_n = num
	end
	local inum=1
	if finish_n == 0 then
		finish_n = 1
	end
	
	for i = start, finish_n+start do
		retdata[inum] = items[i]
		inum = inum + 1
	end
    
    ngx.log(ngx.INFO, "uid_wish file is "..ipath)
    return ret, retdata, #items
end

--返回status, data
--status == 1成功获得
local function getbygoodid(goodid, start, num)
	local ret = 1
	local retdata = {}
	local items = {}
	local ipath = g.wishs_path .. funs.getpath_by_goodid(goodid)
	local fpath = funs.tryopenfile(ipath)
	--压根没有收藏
	if not fpath then
		ret = 0
	end
	
	local content = fpath:read("*a")
	local items = cjson.decode(content)
	fpath:close()
	
	--压根没这么多收藏
	if start > #items then
		ret = 0
		return ret, nil
	end
	
	local finish_n = #items-start
	if finish_n > num then
		finish_n = num
	end
	local inum=1
	if finish_n == 0 then
		finish_n = 1
	end
	for i = start, finish_n+start-1 do
		retdata[inum] = items[i]
		inum = inum + 1
	end
    
    ngx.log(ngx.INFO, "good_wish file is "..ipath)
    return ret, retdata, #items
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
    
    local start = 0
    local num = 20
    
    if #dt.start > 0 then
    	start = tonumber(dt.start)
    	if start == -1 then
    		start = 0
    	end
    end
    
    if #dt.num >0 then
    	num = tonumber(dt.num)
    	if num <0 or num >20 then
    		num = 20
    	end
    end
    
    if dt.action == "user" then
    	if not dt.token or (dt.token and #dt.token==0) then
	    	--未登陆
	    	if not dt.uid then
	    		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	    	end
	    end
	    
	    --session过期
	    local session_info = session.gettable(dt.token)
	    if not session_info then
	    	if not dt.uid then
				out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
			end
	    end
	    
	    local uid = dt.uid
	    if session_info then
	    	uid = session_info.id
	    end
	    local ruid, rdata, num= getbyuid(uid, start, num)
	    if ruid == 0 then
	    	out.error("你压根没有收藏过, 或者根本没有这么多收藏信息")
	    end
	    
	    out.done(cjson.encode(rdata),num)
    elseif dt.action == "good" then
    	local rgid, rdata, num = getbygoodid(dt.goodid, start, num)
    	if rgid == 0 then
    		out.error("该商品压根没有被收藏过, 或者根本没有这么多收藏信息")
    	end
    	
    	out.done(cjson.encode(rdata),num)
    else
    	out.error('action 错误')
    end
end

return _M