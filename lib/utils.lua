local M = {}

---Loads the specified file
---@param path string
M.loadFile = function(path)
	assert(SMODS.load_file(path))()
end

return M
