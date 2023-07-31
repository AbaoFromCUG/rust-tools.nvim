local M = {}

M.get_task_opts = function(defn)
  local cmd = nil
  if defn.args then
    cmd = { "cargo", defn.command, unpack(defn.args) }
  else
    cmd = { "cargo", defn.command }
  end
  return {
    cmd = cmd,
  }
end

return M
