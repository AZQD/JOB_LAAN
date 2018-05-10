local cjson = require "cjson"
local str = require "resty.string"
local g = require("infopub_config")
local mysql = require("infopub_mysql")
local ran_str = require("resty.random")
local session = require("infopub_session")
local out = require "infopub_output"
local funs = require("infopub_funs")

local _M = {
    _VERSION = '0.01',
}

--[[
输入:
	{
		"token":"", 			//用户登录凭证，如果是匿名发布则留空""
		"goodid":"",			//产品ID
		"content":"",			//评论内容
		"tocomment":"",			//给哪个评论
		"timestamp":""			//时间戳
	}
	
	{"token":"", "content":"", "to":"","timestamp":""}

保存的文件格式:
{
	"comment":[
		{
			"uid": 34,
			"gid": 33, //产品ID
            "nick_name": "零点、零一",
            "logo_url": "http: //wx.qlogo.cn/mmopen/vi_24/hqDXUD6csU83An5xflbhjxZyCayq6OnA2h45xElAhkZWdBibI7GOw06cfHxreibAsuj0GrBrI2icvA/132",
            "content": "中国永远要对美日欧留一手！",
            "create_time": 1481630229,
            "comment_id": "4056149436257009782",
            "like_id": 10002,
            "like_num": 17,
            "hate_num": 0,
            "reply": {
                []
            }
		},
		{
		}
	]
}
--]]

local function updatereplys(v, item)
	if v.reply then
		for lk, lv in ipairs(v.reply) do
			local lret = updatereplys(lv, item)
			if lret == 1 then
				break
			end
		end
	else
		if v.comment_id == item.tocomment then
			local is = {}
			is[1] = item
			v['reply'] = is
			
			return 1
		end
	end
	
	if v.reply and v.comment_id == item.tocomment then
		table.insert(v.reply, item)
		return 1
	end
	
	return 0
end


local function update_user_comment(item)
	--是否存在评论文件
	local items = {}
	local gdata = {}
	local ipath = g.comments_path .. funs.getpath_by_uid(item.uid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		--没有评论文件，则创建
		items[1] = item
		gdata["n"] = 1
		gdata["comments"] = items
		funs.savefile(ipath,cjson.encode(gdata))
	else
		--有评论文件，读取评论文件
		local content = fpath:read("*a")
		local gdata = cjson.decode(content)
		fpath:close()
		
		gdata["n"] = tonumber(gdata["n"])+1
		--更新评论内容
		table.insert(gdata.comments, item)
		--写入文件
		funs.savefile(ipath,cjson.encode(gdata))
	end
	
	ngx.log(ngx.INFO, "user_comment file is "..ipath)
	return 1
end

--返回1 评论成功
local function update_good_comment(item)
	local ret = 1
	--是否存在评论文件
	local items = {}
	local gdata = {}
	local ipath = g.comments_path .. funs.getpath_by_goodid(item.goodid)
	local fpath = funs.tryopenfile(ipath)
	if not fpath then
		--没有评论文件，则创建
		items[1] = item
		gdata["n"] = 1
		gdata['comments'] = items
		funs.savefile(ipath,cjson.encode(gdata))
		ret = 1
	else
		--有评论文件，读取评论文件
		local content = fpath:read("*a")
		local gdata = cjson.decode(content)
		fpath:close()
		
		gdata["n"] = tonumber(gdata["n"])+1
		--更新评论内容
		if item.tocomment == -1 then
			table.insert(gdata.comments, item)
		else
			--递归找待回复的评论
			for k, v in ipairs(gdata.comments) do
				ret = updatereplys(v, item)
				if ret == 1 then
					break
				end
			end
		end
		--写入文件
		funs.savefile(ipath,cjson.encode(gdata))
	end
	
	ngx.log(ngx.INFO, "good_comment file is "..ipath)
	return ret
end

function _M.main()
	ngx.req.read_body()
    local data = ngx.req.get_body_data()
    if not data then
    	out.error('no body')
    end
    
    local dt = cjson.decode(data)
    if not dt then
    	out.error('data error')
    end
    
    if not dt.token or (dt.token and #dt.token==0) then
    	--未登陆
    	out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    local session_info = session.gettable(dt.token)
    if not session_info then
		out.error("TOKEN_INVAID",out.ERR_TOKEN_INVAID, "/login")
    end
    
    --获得用户信息
    local comment_item = {}
    comment_item['uid'] = tonumber(session_info.id)
    comment_item['nick_name'] = session_info.nickname
    comment_item['logo_url'] = session_info.logo
    comment_item['content'] = dt.content
    comment_item['create_time'] = ngx.now()
    comment_item['goodid'] = tonumber(dt.goodid)
    comment_item['tocomment'] = tonumber(dt.tocomment)
    
    if comment_item['nick_name'] and #comment_item['nick_name'] == 0 then
    	comment_item['nick_name'] = session_info.phone
    end
    --更新评论表
    if not comment_item['tocomment'] then
    	comment_item['tocomment'] = -1
    end
    local sql = "insert into info_gg_comment (`uid`,`tocomment`,`togoodid`,`content`) VALUES("..comment_item['uid']..","..comment_item['tocomment']..","..comment_item['goodid']..","..ngx.quote_sql_str(comment_item['content'])..")"
    local res, err = mysql.query(sql)
    if not res then
    	out.error("发布评论失败 1")
    end
    comment_item['comment_id'] = res.insert_id
    comment_item['like_num'] = 0
    comment_item['hate_num'] = 0
    
    --更新用户评论信息
    local uret = update_user_comment(comment_item)
    if uret ~= 1 then
    	out.error("更新用户评论表失败")
    end
    
    --更新产品评论信息
    local gret = update_good_comment(comment_item)
    if gret ~=1 then
    	out.error("更新商品评论失败, 很大可能是你回复的评论ID 不存在")
    end
    
    out.done('发布成功')
end

return _M
