local _M = {}
local util = require "script.util"

function _M.access(service)
    ngx.say(CONF["esignature"]["redis"]["passwd"])
end

return _M
