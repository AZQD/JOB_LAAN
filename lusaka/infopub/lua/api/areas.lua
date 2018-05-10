local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local ret_t = {}
	local sql = "select * from info_gg_areas where main=1 order by id"
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			for k, v in pairs(res) do
				sql = "select * from info_gg_areas where pid="..v.id
				local lres, lerr = mysql.query(sql)
				if lres then
					local lt = {}
					lt['name'] = v.name
					lt['id'] = v.id
					lt['sub'] = lres
					ret_t[k] = lt
				end
			end
			
			out.done(cjson.encode(ret_t))
		end
	end
	out.error('failed')
end

return _M