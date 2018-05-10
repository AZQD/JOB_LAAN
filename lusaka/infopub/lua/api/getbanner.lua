local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

--[[
	输入:?gname=
	输出:
		
--]]
function _M.main()
	local gname = ngx.var.arg_gname
	local out_t = {}
	if not gname then
		out.error('id is null')
	end
	
	local sql = "select * from info_gg_banners where groupname="..ngx.quote_sql_str(gname) .. " order by id"
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			for k, v in ipairs(res) do
				out_t[k] = v
				out_t[k].id = nil
				out_t[k].groupname = nil
			end
			out.done(cjson.encode(out_t))
		end
	end
	out.error('failed')
end

return _M
