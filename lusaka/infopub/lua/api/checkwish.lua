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

--返回1说明存在
local function check_wish(uid, goodid)
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
			if tonumber(v.goodid) == tonumber(goodid) then
				ret = 1
				break
			end
		end
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
    
    --检查
    local gret = check_wish(session_info.id, dt.goodid)
    if gret ~= 1 then
    	out.done("0")
    end
    
    out.done("1")
end

return _M