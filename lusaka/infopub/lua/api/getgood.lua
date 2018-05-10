local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local goodid = ngx.var.arg_id
	
	if not goodid then
		out.error('id is null')
	end
	
	local token = session.getcookie('token')
	if token == nil then
		token = session.getfromurl('token')
	end
	local session_info = session.gettable(token)
	
	goodid = tonumber(goodid)
	--local sql = "select * from info_gg_publist where id="..goodid
	local sql = "SELECT `id`,`uid`,`title`,`details`,`goodstatus`,`price`,`imgs`,`cimg`,`contactname`,`phone`,`cid`,`issell`,`addr_l1`,`addr_l2`,`addr_l3`,`addr_l4`,`views`,`wishs`,`status`, DATE_FORMAT( pubtime,  '%m-%d-%Y %H:%i' ) AS pubtime FROM  `info_gg_publist` WHERE id="..goodid
	
	local res, err = mysql.query(sql)
	if res then
		if table.maxn(res) > 0 then
			if not res[1].cimg or #res[1].cimg < 10 then
				if type(res[1].imgs) == "string" and #res[1].imgs>10 then
					local pc = string.find(res[1].imgs, ',')
					if pc then
						res[1].cimg = string.sub(res[1].imgs, 0, pc-1)
					else
						res[1].cimg = res[1].imgs
					end
				end
			end
			if type( res[1].imgs) == "userdata" then
				 res[1].imgs = ""
			end
			sql = "update `info_gg_publist` set  `views` =  `views` +1 where id ="..tostring(goodid)
			mysql.query(sql)
			if not session_info then
				if #res[1].phone> 6 then
					res[1].phone = string.sub(res[1].phone, 1, -5).."****"
				end
			end
			out.done(cjson.encode(res[1]))
		end
	end
	out.error('failed')
end

return _M
