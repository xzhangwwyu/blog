local req = require "common.io.req"
local fmt = require "common.fmt"
local _M = {}

function _M.test_get()
	fmt.say(req.get_get_arg())
end
function _M.test_post()
	fmt.say(req.get_post_arg())
end

return _M
