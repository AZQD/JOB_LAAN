local cjson = require "cjson"
local g = require("infopub_config")
local aes = require "resty.aes"
local str = require "resty.string"
local out = require "infopub_output"

local aes_128_cbc_md5 = aes:new(g.aes_key)

local function getpath(img_md5)
	local path = g.imgs_path..string.sub(img_md5, 1,2).."/"..string.sub(img_md5, 3,4).."/"..img_md5
	return path
end

local function fromhex(str)
    return (str:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

local function aesdecode(content)
	local lcontent = ""
	if content then
		lcontent = content
	end
	
	local binc=nil
	if not pcall(function (str) binc = fromhex(str) end, lcontent) then
		return nil
	end
	
	if not binc then
		return nil
	end
	local dec = aes_128_cbc_md5:decrypt(binc)
	return dec
end

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local img_id = ngx.var.arg_id
	local dcode = aesdecode(img_id)
	
	if dcode then
		local true_path = getpath(dcode)
		os.remove(true_path)
		ngx.log(ngx.INFO, true_path)
		out.done("success")
	else
		out.error("failed")
	end
end


return _M