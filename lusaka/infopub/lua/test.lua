local session = require("infopub_session")
local funs = require("infopub_funs")


local token = session.getcookie('token')
local token_from_url = session.getfromurl('token')
if token then
	ngx.say('from cookie token is '..token)
	if session.gettable(token) then
		ngx.say('<br>phone is '..session.gettable(token).phone)
		ngx.say('<br>phone is '..session.gettable(token).id)
	else
		ngx.say('session timeout')
	end
end

if token_from_url then
	ngx.say('<br>from uri token is '..token_from_url)
	if session.gettable(token_from_url) then
		ngx.say('<br>phone is '..session.gettable(token_from_url).phone)
		ngx.say('<br>phone is '..session.gettable(token_from_url).id)
	else
		ngx.say('session timeout')
	end
end

if not token and not token_from_url then
	ngx.say('please sign in')
end

ngx.say(funs.gettoptipinfo())