local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}


function _M.main()
	local sql = "select * from info_gg_recommend_logo where 1"
	local res, err = mysql.query(sql)
	if res then
		out.done(cjson.encode(res))
	end
	out.error('failed')
end

return _M