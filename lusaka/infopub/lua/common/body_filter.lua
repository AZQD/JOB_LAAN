local g = require("infopub_config")

if ngx.status ~= 200 then
	return
end

if not string.find(ngx.header.content_type, "text/html") then
	return
end

local chunk, eof = ngx.arg[1], ngx.arg[2]
local buffered = ngx.ctx.buffered

if not buffered then
    buffered = {}
    ngx.ctx.buffered = buffered
end

if chunk ~= "" then
    buffered[#buffered + 1] = chunk
    ngx.arg[1] = nil
end

if eof then
    str = table.concat(buffered)
    ngx.ctx.buffered = nil

	str = ngx.re.sub(str, "</body>", g.web_analytics.."</body>")
    ngx.arg[1] = str
end
ngx.log(ngx.INFO, 'body_filter')
