local _M = {}

function _M.getcwd()
    local path = package.searchpath('script.util', package.path)
    return path
end
print(_M.getcwd())


return _M
