local M = {}

M.loadFile = function(path)
	assert(SMODS.load_file(path))
end

return M
