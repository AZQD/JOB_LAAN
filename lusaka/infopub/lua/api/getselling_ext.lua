local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

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
	
	if not uid then
		out.error("uid is null")
	end
	
	uid = tonumber(uid)
	if not uid then
		out.error("uid error")
	end
	
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
	
	local total = 0
	
	local lsql = "select count(*) as n from info_gg_publist where issell = 1 and status =0 and uid="..uid
	local lres, lerr = mysql.query(lsql)
	if lres then
		total = lres[1].n
	end
	
	local sql = "select * from info_gg_publist where issell = 1 and status =0 and uid="..uid .. " limit "..start ..","..n
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			for k, v in ipairs(res) do
				if not v.cimg or #v.cimg < 1 then
					if type(v.imgs) == 'string' and #v.imgs >10 then
						local pc = string.find(v.imgs, ',')
						if pc then
							v.cimg = string.sub(v.imgs, 0, pc-1)
						else
							v.cimg = v.imgs
						end
					end
				end
				
				v.details = nil
				v.contactname = nil
				v.imgs = nil
				v.phone = nil
				v.addr_l1 = nil
				v.addr_l2 = nil
				v.addr_l3 = nil
				v.addr_l4 = nil
			end
			if (#res == 0) then
				out.done("[]",0)
			else
				out.done(cjson.encode(res), total)
			end
		end
		out.done("[]",0)
	end
	out.error('The user does not exist.')
end

return _M