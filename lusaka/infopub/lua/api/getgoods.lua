local g = require("infopub_config")
local mysql = require("infopub_mysql")
local session = require("infopub_session")
local out = require "infopub_output"

local _M = {
    _VERSION = '0.01',
}

function _M.main()
	local cid = ngx.var.arg_cid
	if cid then
		cid = tonumber(cid)
	end
	
	local areaid = ngx.var.arg_areaid
	if areaid then
		areaid = tonumber(areaid)
	end
	
	local goodstatus = ngx.var.arg_goodstatus
	if goodstatus then
		goodstatus = tonumber(goodstatus)
	end
	
	local orderby = ngx.var.arg_orderby
	local sort = ngx.var.arg_sort
	
	if not orderby then
		orderby = 'pubtime'
		orderby = 'id'
	else
		if orderby == 'price' then
			orderby = 'price'
		else
			orderby = 'pubtime'
			orderby = 'id'
		end
	end
	if not sort then
		sort = 'desc'
	else
		if sort == 'asc' then
			sort = 'asc'
		else
			sort = 'desc'
		end
	end
	
	local bimage = false
	local hasImage = ngx.var.arg_hasImage
	
	if hasImage and tonumber(hasImage) == 1 then
		bimage = true
	end
	
	local pmax = ngx.var.arg_pmax
	if pmax then
		pmax = tonumber(pmax)
	end
	
	local pmin = ngx.var.arg_pmin
	if pmin then
		pmin = tonumber(pmin)
	end
	
	local start = ngx.var.arg_start
	if start then
		start = tonumber(start)
		if not start then
			start = 0
		end
	end
	
	local issell = ngx.var.arg_issell
	if issell then
		issell = tonumber(issell)
	end
	
	local n = ngx.var.arg_n
	if n then
		n = tonumber(n)
		if not n then
			n=30
		end
	else
		n = 30
	end
	
	if n>30 then
		n = 30
	end
	
	local sql = "SELECT `id`,`uid`,`title`,`goodstatus`,`price`,`imgs`, `cimg`,`contactname`,`details`,`cid`,`issell`,`addr_l1`,`addr_l2`,`addr_l3`,`addr_l4`,`views`,`wishs`, DATE_FORMAT(`pubtime`,'%m/%d/%Y') as pubtime,`status`  FROM `info_gg_publist` where status=0"
	
	local where_ext = ""
	if cid then
		--获得所有子分类
		local lsql = "select id from info_gg_category where pid="..cid
		local lres, lerr = mysql.query(lsql)
		local cids = "("..cid
		if lres then
			for k, v in ipairs(lres) do
				cids = cids .. ","..v.id
			end
		end
		cids = cids .. ")"
		
		where_ext = where_ext.." and cid in "..cids
	end
	
	if areaid then
		where_ext = where_ext.." and (addr_l1="..areaid
		where_ext = where_ext.." or addr_l2="..areaid..")"
	end
	
	if pmax then
		where_ext = where_ext.." and price<"..pmax
	end
	
	if pmin then
		where_ext = where_ext.." and price>"..pmin
	end
	
	if issell then
		where_ext = where_ext.. " and issell="..issell
	end
	
	if bimage then
		where_ext = where_ext .. ' and imgs <> ""'
	end
	
	if goodstatus then
		where_ext = where_ext .. ' and goodstatus='..goodstatus
	end
	
	local orderby_sql = " order by id desc"
	if orderby and sort then
		orderby_sql = " order by "..orderby .." "..sort
	end
	
	if not n or n>30 then
		n = 30
	end
	
	if not start then
		start = 0
	end
	
	if start and n then
		orderby_sql = orderby_sql.." limit "..start..","..n
	end
	
	--总条数
	local msql = "select count(id) as n from info_gg_publist where status=0 "..where_ext
	local mres, merr = mysql.query(msql)
	local tnumber = 0
	if mres then
		tnumber = mres[1].n
	end
	
	sql = sql .. where_ext .. orderby_sql
	ngx.log(ngx.INFO, sql)
	ngx.log(ngx.INFO, msql)
	local res, err = mysql.query(sql)
	if res then
		for k, v in ipairs(res) do

			if not v.cimg or #v.cimg < 10 then
				if type(v.imgs) == 'string' and #v.imgs >10 then
					local pc = string.find(v.imgs, ',')
					if pc then
						v.cimg = string.sub(v.imgs, 0, pc-1)
					else
						v.cimg = v.imgs
					end
				end
			end
			if type(v.imgs) == "userdata" then
				v.imgs = ""
			end

		end
		
		out.done(cjson.encode(res), tnumber)
	end
	out.error('failed')
end

return _M