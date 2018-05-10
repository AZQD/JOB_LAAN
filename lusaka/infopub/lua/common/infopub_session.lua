local cjson = require "cjson"

local _M = {
}

function _M.get(key)
	local infopub_session = ngx.shared.infopub_session
	if not infopub_session then
		return nil
	end
	
	return infopub_session:get(key)
end

function _M.gettable(key)
	if not key then
		return nil
	end
	local infopub_session = ngx.shared.infopub_session
	if not infopub_session then
		return nil
	end
	
	if type(key) == 'userdata' then
		return nil
	end
	if #key ==0 then
		return nil
	end
	if infopub_session:get(key) then
		return cjson.decode(infopub_session:get(key))
	end
	return nil
end

function _M.set(key, value, exptime)
	local infopub_session = ngx.shared.infopub_session
	if not infopub_session then
		return nil
	end
	
	infopub_session:flush_expired(128)
	return infopub_session:set(key, value, exptime)
end

function _M.del(key)
	local infopub_session = ngx.shared.infopub_session
	if not infopub_session then
		return nil
	end
	
	return infopub_session:delete(key)
end

function _M.setcookie(key,value)
	ngx.header['Set-Cookie'] = key.."="..value
end

function _M.getcookie(key)
	local cookie_str = ngx.req.get_headers()["cookie"]
	if not cookie_str then
		return nil
	end
	
	local m, err = ngx.re.match(cookie_str, [[token=([a-z0-9]+)]])
	if m then
		return m[1]
	end
	return nil
end

function _M.update(key,value,exptime)
	local infopub_session = ngx.shared.infopub_session
	if not infopub_session then
		return nil
	end
	
	return infopub_session:set(key, value, exptime)
end

function _M.getfromurl(key)
	if ngx.var.arg_token then
		return ngx.var.arg_token
	end
	return nil
end

return _M