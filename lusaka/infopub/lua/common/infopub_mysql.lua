local cjson = require "cjson"
local mysql = require("resty.mysql")
local g = require("infopub_config")

local _M = {
}

function _M.query(sql)
	local db, err = mysql:new()
	if not db then
		ngx.say("failed to instantiate mysql: ", err)
		return
	end

	db:set_timeout(1000) -- 1 sec
	local ok, err, errcode, sqlstate = db:connect(g.mysql_option)
	
	if not ok then
		ngx.log(ngx.ERR, "connect db error. err: " .. err)
		return nil, nil
	end
	
    local res, err, errcode, sqlstate = db:query(sql)
    if not res then
        ngx.log(ngx.ERR, "query db error. res: " .. err)
		db:close()
        return nil,nil
    end
	
	db:set_keepalive(10000, 10)
	
    return res, err
end

return _M
