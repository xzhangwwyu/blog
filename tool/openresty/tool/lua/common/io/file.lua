local _M = {}
local cjson = require "cjson"

function _M.get_config(filename)
    local file = io.open(filename,"r")
    local conf = file:read("*a")
    file:close()
    return cjson.decode(conf)
end

function _M.get_config_file()
    local path = package.searchpath('common.io.file', package.path)
    local dir = string.match(path, "(.+)/[^/]*%.%w+$") 
    local env = os.getenv("ENV")
    return dir..'/../../conf/cat.'..env..'.json'
end

return _M
