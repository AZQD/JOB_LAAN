local _M = {
    _VERSION = '0.01',

    ERR_TOKEN_INVAID=501,
}

function _M.error(err, code, data)
	local s = {}
	s['status'] = 500
	if code then
		s['status'] = code
	end

	s['data'] = ''
	if data then
		s['data'] = data
	end
	s['msg'] = err
	ngx.say(cjson.encode(s))
	ngx.exit(200)
end

function _M.done(data,extdata)
	local s = {}
	s['status'] = 200
	s['msg'] = ''
	s['data'] = data
	if extdata then
		s['extdata'] = extdata
	end
	ngx.say(cjson.encode(s))
	ngx.exit(200)
end

return _M
