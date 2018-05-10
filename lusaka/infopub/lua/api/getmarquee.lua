local g = require("infopub_config")
local out = require "infopub_output"
local cjson = require "cjson"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local res_t = {}
	res_t[1] = 'All transactions will be done in person by the seller and buyer inclusive of the quality of goods. no money transactions will be done on our website.'
	res_t[2] = 'Kindly forward any suggestions or website issues to kalichimall administration kalichimall@gmaill.com'
	res_t[3] = 'Welcome to kalichimall, you can sell or buy second hand items & new items on our website hope you have a very wonderful experience'
	out.done(res_t[3])
end

return _M