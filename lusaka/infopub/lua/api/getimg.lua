local cjson = require "cjson"
local g = require("infopub_config")

local function getpath()
	local imgstr = ngx.re.sub(ngx.var.uri, "/gimg/","")
	if not imgstr then
		return nil
	end
	
	local n = ngx.re.match(imgstr, [[^([0-9A-Z]+)]],"")
	if not n then
		return nil
	end
	
	local imgid = n[0]
	if not imgid then
		return nil
	end
	if #imgid <1 then
		return nil
	end
	
	local path = g.imgs_path..string.sub(imgid, 1,2).."/"..string.sub(imgid, 3,4).."/"..imgid
	ngx.log(ngx.INFO, path)
	return path
end

local function readimg(path)
	local file = io.input(path)
	if not file then
		return nil
	end
	local content = file:read("*a")
	file:close()
	return content
end

local function main()
	ngx.header['content-type'] = "image/jpeg"
	local imgpath = getpath()
	if imgpath == nil then
		imgpath = g.base_dir.."static/default.jpg"
	end
	
	local content = readimg(imgpath)
	if not content then
		--显示默认404图片
		imgpath = g.base_dir.."static/default.jpg"
		content = readimg(imgpath)
	end
	
	ngx.say(content)
	
	ngx.exit(200)
end


main()
