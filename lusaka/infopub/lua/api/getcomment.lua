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
	local ipath = g.comments_path .. funs.getpath_by_uid(uid)
	local fpath = funs.tryopenfile(ipath)
	local tnum = 0
	--压根没有评论
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local datas = cjson.decode(content)
		fpath:close()
		
		--压根没这么多评论
		if start > #datas.comments then
			ret = 0
		end
		
		tnum = datas.n
		local finish_n = #datas.comments-start
		if finish_n > num then
			finish_n = num
		end
		local inum=1
		if finish_n == 0 then
			finish_n = 1
		end
		
		if num == 1 then
			finish_n = 0
		end
		
		for i = start, finish_n+start do
			retdata[inum] = datas.comments[i]
			inum = inum + 1
		end
	end
    
    ngx.log(ngx.INFO, "uid_comment file is "..ipath)
    return ret, retdata, tnum
end

--返回status, data
--status == 1成功获得
local function getbygoodid(goodid, start, num)
	local ret = 1
	local retdata = {}
	local ipath = g.comments_path .. funs.getpath_by_goodid(goodid)
	local fpath = funs.tryopenfile(ipath)
	local tnum = 0
	--压根没有评论
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local datas = cjson.decode(content)
		fpath:close()
		
		--压根没这么多评论
		if start > #datas.comments then
			ret = 0
		end
		
		tnum = datas.n
		local finish_n = #datas.comments-start
		if finish_n > num then
			finish_n = num
		end
		local inum=1
		if finish_n == 0 then
			finish_n = 1
		end
		
		if num == 1 then
			finish_n = 0
		end
		
		for i = start, finish_n+start do
			retdata[inum] = datas.comments[i]
			inum = inum + 1
		end
	end
	
    ngx.log(ngx.INFO, "good_comment file is "..ipath)
    return ret, retdata, tnum
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
	    	out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	    end
	    
	    --session过期
	    local session_info = session.gettable(dt.token)
	    if not session_info then
			out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	    end
	    
	    local ruid, rdata, tnum = getbyuid(session_info.id, start, num)
	    if ruid == 0 then
	    	out.error("你压根没有评论过, 或者根本没有这么多评论信息")
	    end
	    
	    out.done(cjson.encode(rdata),tnum)
    elseif dt.action == "good" then
    	local rgid, rdata, tnum = getbygoodid(dt.goodid, start, num)
    	if rgid == 0 then
    		out.error("该商品压根没有被评论过, 或者根本没有这么多评论信息")
    	end
    	
    	out.done(cjson.encode(rdata),tnum)
    else
    	out.error('action 错误')
    end
end

return _M