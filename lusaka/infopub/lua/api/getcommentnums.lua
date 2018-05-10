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
	}
--]]

--返回status, data
--status == 1成功获得
local function getbyuid(uid, start, num)
	local ret = 1
	local retdata = {}
	local ipath = g.comments_path .. funs.getpath_by_uid(uid)
	local fpath = funs.tryopenfile(ipath)
	--压根没有评论
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local datas = cjson.decode(content)
		fpath:close()
		
		retdata['num'] = datas.n
	end
    
    ngx.log(ngx.INFO, "uid_comment file is "..ipath)
    return ret, retdata
end

--返回status, data
--status == 1成功获得
local function getbygoodid(goodid, start, num)
	local ret = 1
	local retdata = {}
	local ipath = g.comments_path .. funs.getpath_by_goodid(goodid)
	local fpath = funs.tryopenfile(ipath)
	--压根没有评论
	if not fpath then
		ret = 0
	else
		local content = fpath:read("*a")
		local datas = cjson.decode(content)
		fpath:close()
		
		retdata['num'] = datas.n
	end
	
    ngx.log(ngx.INFO, "good_comment file is "..ipath)
    return ret, retdata
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
	    
	    local ruid, rdata= getbyuid(session_info.id)
	    if ruid == 0 then
	    	out.error("你压根没有评论过, 或者根本没有这么多评论信息")
	    end
	    
	    out.done(cjson.encode(rdata))
    elseif dt.action == "good" then
    	local rgid, rdata = getbygoodid(dt.goodid)
    	if rgid == 0 then
    		out.error("该商品压根没有被评论过, 或者根本没有这么多评论信息")
    	end
    	
    	out.done(cjson.encode(rdata))
    else
    	out.error('action 错误')
    end
end

return _M