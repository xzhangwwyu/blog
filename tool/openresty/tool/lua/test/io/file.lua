local _M = {}
local test_io = require "common.io.file"
local test_fmt = require "common.fmt"

function _M.test_get_conf_path()
	test_fmt.say(test_io.get_config_file())
end

function _M.test_get_conf()
	test_fmt.say(test_io.get_config(test_io.get_config_file()))
end
return _M
