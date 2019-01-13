local _M = {}
function _M.get_ip()
    local headers=ngx.req.get_headers()
    headers["remote_addr"] = ngx.var.remote_addr
    return cjson.encode(headers)
    -- local ip=headers["X-REAL-IP"] or headers["X_FORWARDED_FOR"] or ngx.var.remote_addr or "0.0.0.0"
    -- return ip
end

return _M

