local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

local function strsplit(str, delimiter)
	if str==nil or str=='' or delimiter==nil then
		return nil
	end
	
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

local function formatstr(str)
	local ret_t = {}
	local tt = strsplit(str, ';')
	for k, v in ipairs(tt) do
		local interval = {}
		interval['min'] = strsplit(v, ',')[1]
		interval['max'] = strsplit(v, ',')[2]
		
		ret_t[k] = interval
	end
	return ret_t
end

function _M.main()
	local ret_t = {}
	local others = {}
	local inum = 1
	local sql = "select * from info_gg_category where main=1"
	local res, err = mysql.query(sql)
	if res then
		local index_stu = 0
		if table.maxn(res) > 0 then
			for k, v in pairs(res) do
				if v.name == 'Students' then
					index_stu = k
				end
					
				sql = "select * from info_gg_category where pid="..v.id
				local lres, lerr = mysql.query(sql)
				if lres then
					local lt = {}
					
					if v.name ~= 'Others' then
						lt['name'] = v.name
						lt['cid'] = v.id
						lt['id'] = v.id
						lt['imgsrc'] = v.imgsrc
						lt['interval'] = formatstr(v.interval)
						for k1, v1 in ipairs(lres) do
							v1['cid'] = v1.id
							v1['interval'] = nil
						end
						lt['sub'] = lres

						ret_t[inum] = lt
						inum = inum+1
					else
						others['name'] = v.name
						others['cid'] = v.id
						others['id'] = v.id
						others['imgsrc'] = v.imgsrc
						others['interval'] = formatstr(v.interval)
						for k1, v1 in ipairs(lres) do
							v1['cid'] = v1.id
							v1['interval'] = nil
						end
						
						--特殊处理大分类下面的Others子分类
						local ttmp = {}
						ttmp['name'] = v.name
						ttmp['cid'] = v.id
						ttmp['id'] = v.id
						ttmp['imgsrc'] = ''
						local ttmps = {}
						ttmps[1] = ttmp
						--
						
						others['sub'] = ttmps
					end
				end
			end
			
			ret_t[inum] = others
			
			local tmp_st = ret_t[index_stu-1]
			table.insert(ret_t, 0, tmp_st)
			table.remove(ret_t, index_stu)
			
			local ik = 1
			local n_ret = {}
			for k, v in pairs(ret_t) do
				n_ret[ik] = v
				ik = ik+1
			end
			out.done(cjson.encode(n_ret))
		end
	end
	out.error('failed')
end

return _M
