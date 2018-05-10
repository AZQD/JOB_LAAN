local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local n = ngx.var.arg_n
	
	if not n then
		n = 20
	else
		n = tonumber(n)
		if not n then
			n = 20
		end
	end
	
	local sql = "select * from info_gg_publist where status=0 order by views desc limit 0, "..n
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
				out.done(cjson.encode(res))
			end
		end
		out.done("[]",0)
	end
	out.error('failed')
end

return _M