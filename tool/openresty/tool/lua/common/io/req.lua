local _M = {}

function _M.get_get_arg()
	local arg = ngx.req.get_uri_args()
	return arg
end

function _M.get_post_arg()
	ngx.req.read_body() -- 解析 body 参数之前一定要先读取 body
        local arg = ngx.req.get_post_args()
	return arg
end
return _M
