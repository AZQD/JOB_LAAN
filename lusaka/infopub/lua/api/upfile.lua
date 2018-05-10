local cjson = require "cjson"
local aes = require "resty.aes"
local str = require "resty.string"
local resty_md5 = require "resty.md5"
local upload = require "resty.upload"
local resty_string = require "resty.string"
local str_random = require "resty.random"
local g = require("infopub_config")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

local md5 = resty_md5:new()

local function get_file_name(res)
	local retname = nil
	for k, v in ipairs(res) do
		local g = ngx.re.match(v, [[filename="(.*)"]])
		if g then
			retname = g[1]
		end
	end
	
	if not retname then
		for k, v in ipairs(res) do
			local g = ngx.re.match(v, [[Content-Disposition: form-data; name="(.*)"]])
			if g then
				retname = g[1]
			end
		end
	end
	return retname
end

local function getfilepath(md5_value)
	if not md5_value then
		return nil
	end
	local path = g.imgs_path
	
	path = path..string.sub(md5_value, 1,2).."/"..string.sub(md5_value, 3,4)
	path = path.."/"..md5_value
	
	return path
end

local function checkfile(content_md5)
	if not content_md5 then
		return false
	end
	
	if string.len(content_md5)<2 then
		return false
	end
	
	local file_path = getfilepath(content_md5)
	local file_h = io.open(file_path, "r")
	if file_h then
		file_h:close()
		return true
	else
		return false
	end
end

function _M.main()
	local arg_md5 = ngx.var.arg_md5
	if checkfile(arg_md5) == true then
		out.done(arg_md5)
	end
	
	if ngx.req.get_method() == 'POST' then
		local content_md5 = nil
		local file_h = nil
		local tmp_file_path = nil
		
		local chunk_size = 8192 -- should be set to 4096 or 8192
		local form, err = upload:new(chunk_size)
		if not form then
			ngx.log(ngx.ERR, "failed to new upload: ", err)
			out.error("failed to new upload: "..err)
			ngx.exit(500)
		end
		
		form:set_timeout(30000) -- 30 sec
		while true do
			local typ, res, err = form:read()
			if not typ then
				ngx.log(ngx.ERR, '从form读取数据失败--'..err)
				out.error('从form读取数据失败--'..err)
				break
			end
			
			if typ == "header" then
				local file_name = get_file_name(res)
				if file_name then
					tmp_file_path = g.tmp_path..resty_string.to_hex(str_random.bytes(32))
					file_h = io.open(tmp_file_path, 'w+b')
					if not file_h then
						ngx.log(ngx.ERR, '创建临时文件失败--'..tmp_file_path)
						out.error('创建临时文件失败--'..tmp_file_path)
						return
					end
				end
			elseif typ == 'body' then
				if file_h then
					--ngx.say(res)
					md5:update(res)
					file_h:write(res)
				end
			elseif typ == "part_end" then
	            local md5_sum = md5:final()
	            md5:reset()
				content_md5 = string.upper(resty_string.to_hex(md5_sum))
			elseif typ == "eof" then
				if file_h then
					file_h:close()
					file_h = nil
				end
				ret = nil
				break
			else
				if file_h then
					file_h:close()
					file_h = nil
				end
			end
		end
	
		--获得文件内容的MD5
		if content_md5 then
			--ngx.say(tmp_file_path)
			
			--加上当前上传时间---重新计算
			local c_cmd = content_md5..ngx.now()
			
			content_md5 = string.upper(ngx.md5(c_cmd))
			
			ngx.log(ngx.INFO, content_md5)
			local file_path = getfilepath(content_md5)
			os.rename(tmp_file_path, file_path)
			
			
			local aes_128_cbc_md5 = aes:new(g.aes_key)
			local encrypted = aes_128_cbc_md5:encrypt(content_md5)
    
			out.done(content_md5, str.to_hex(encrypted))
			--
			--ngx.print(content_md5)
		else
			out.done('数据异常')
		end
	end
	
	
	if ngx.req.get_method() == 'GET' then
		ngx.header['content-type'] = 'text/html'
		ngx.say([[<html><body>
			<form action="/apigateway/upfile" method="post" enctype="multipart/form-data">
			<input type="file" name="fileUpload" />
			<input type="submit" value="upload" />
			</form>
		</body></html>]])
		ngx.exit(200)
	end
	
	ngx.error('未知')
end

return _M