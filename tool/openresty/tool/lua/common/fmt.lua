local _M = {}
local cjson = require "cjson"

function _M.errror(msg)
	if type(msg) == "table" then
		msg = cjson.encode(msg)
	end
	ngx.log(ngx.ERR,msg)
end

function _M.say(msg)
	if type(msg) == "table" then
		msg = cjson.encode(msg)
	end
	ngx.say(msg)
end

return _M
