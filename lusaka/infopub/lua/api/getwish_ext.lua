local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"
local dic = require("infopub_dic")
local funs = require("infopub_funs")
local cjson = require "cjson"

local _M = {
    _VERSION = '0.01',
}

local function getwishsbytoken(token, uid, start, n)
	local pbody = {}
	pbody['token'] = token
	pbody['goodid'] = ""
	pbody['uid'] = uid
	pbody['action'] = "user"
	pbody['start'] = tostring(start)
	if pbody['start'] == '0' then
		pbody['start'] = '1'
	end
	pbody['num'] = tostring(n)
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
	return retstr, rest.extdata
end

function _M.main()
	local start = ngx.var.arg_start
	local n = ngx.var.arg_n
	local uid = ngx.var.arg_uid
	
	--[[
	local token = ngx.var.arg_token
	if not token then
		out.error('token is null')
	end
	
	local session_info = session.gettable(token)
	
	if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
	end	
	local uid = session_info.id
	if not uid then
		out.error("SEESIONINFO ERROR")
	end
	--]]
	
	if not start then
		start = 0
	else
		start = tonumber(start)
		if not start then
			start = 0
		end
	end
	
	if not n then
		n = 30
	else
		n = tonumber(n)
		if not n then
			n = 30
		end
	end
	
	if not uid then
		out.error("uid is null")
	end
	
	uid = tonumber(uid)
	if not uid then
		out.error("uid is null")
	end
	
	--获得用户的收藏信息
	local token = nil
	local wishs,tnum = getwishsbytoken(token, uid, start, n)
	local ext_where
	if wishs then
		ext_where= 'where id in '..wishs
	else
		ext_where= 'where id in (0) and 1=2'
	end

	local list_item = ''
	local sql = "select * from info_gg_publist "..ext_where.." order by id desc"
	ngx.log(ngx.INFO, sql)
	local res, err = mysql.query(sql)
	if res then
		for k, v in ipairs(res) do  
			v.imgs = nil
			v.contactname = nil
			v.phone = nil
			v.addr_l1 = nil
			v.addr_l2 = nil
			v.addr_l3 = nil
			v.addr_l4 = nil
		end
		if (#res == 0) then
			out.done("[]",0)
		else
			out.done(cjson.encode(res), tnum)
		end
		out.done("[]",0)
	end
end

return _M