local g = require("infopub_config")
local mysql = require("infopub_mysql")
local out = require "infopub_output"
local cjson = require "cjson"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local res_t = {}
	res_t['tuser'] = 112
	res_t['tgoods'] = 39
	
	local getcount_sql = "select * from info_gg_getcounts"
	local count_res, count_err = mysql.query(getcount_sql)
	if count_res and #count_res == 1 then
		res_t['tuser'] = count_res[1].tuser
		res_t['tgoods'] = count_res[1].tgoods
	end
	
	local tusersql = "select count(*) as tu from info_gg_users"
	local tpubql = "select count(*) as tg from info_gg_publist"
	
	local res, err = mysql.query(tusersql)
	if res and #res == 1 then
		res_t['tuser'] = res_t['tuser'] + tonumber(res[1].tu)
	end
	
	res, err = mysql.query(tpubql)
	if res and #res == 1 then
		res_t['tgoods'] = res_t['tgoods'] + tonumber(res[1].tg)
	end
	
	out.done(cjson.encode(res_t))
end

return _M