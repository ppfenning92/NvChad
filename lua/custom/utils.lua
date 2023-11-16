local M = {}

function M.randomString(length, charset)
  charset = charset or "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
  if length > 0 then
    local idx = math.random(1, #charset)
    return M.randomString(length - 1, charset) .. charset:sub(idx, idx)
  else
    return ""
  end
end

return M
