local g = require("infopub_config")
local mysql = require("infopub_mysql")
local out = require "infopub_output"
local cjson = require "cjson"

local lsql = "update `info_gg_getcounts` set  `tuser` =  `tuser` +2 , `tgoods` = `tgoods` +2 where id =0"
local count_res, count_err = mysql.query(lsql)
ngx.log(ngx.INFO, cjson.encode(count_res))

ngx.say(cjson.encode(count_res))
