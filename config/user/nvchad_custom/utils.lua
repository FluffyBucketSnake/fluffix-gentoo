local M = {}

M.read_only = function(t)
  local proxy = {}
  setmetatable(proxy, {
    __index = t,
    __newindex = function(_, _, _)
      error("attempted to update a read-only table", 2)
    end,
  })
end

return M
