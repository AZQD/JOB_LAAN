local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',

}


function _M.main()
	session.del(ngx.var.arg_token)
	out.done(ngx.var.arg_token.."ok")
end


return _M
