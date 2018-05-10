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


local function getallcate()
	local sql = "select id, name from info_gg_category"
	local res, err = mysql.query(sql)
	if res then
		return res
	end
	return nil
end

local function getcnamebycid(cates,cid)
	for k, v in ipairs(cates) do
		if v.id == cid then
			return v.name
		end 
	end
end

--info_gg_bestgoods
--info_gg_publist
--select * from info_gg_publist where id in (select goodid from info_gg_bestgoods)
function _M.main()
	local out_t = {}
	local cates = getallcate()
	
	local sql = "select id,price,cimg,cid from info_gg_publist where id in (select goodid from info_gg_bestgoods)"
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			for k, v in ipairs(res) do
				out_t[k] = v
				out_t[k].cname = getcnamebycid(cates,v.cid)
				out_t[k].cimg = v.cimg
			end
			out.done(cjson.encode(out_t))
		end
	end
	out.error('failed')
end

return _M
