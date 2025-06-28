local M = {}

---@generic T
---@alias Predicate fun(item: T): boolean

---Check if any of the elements in the iterator met a certain predicate.
---@generic T
---@param iterator table<any, T>
---@param predicate Predicate
---@return boolean
M.any = function(iterator, predicate)
	for _, value in pairs(iterator) do
		if predicate(value) then
			return true
		end
	end

	return false
end

---Check if all of the elements in the iterator met a certain predicate.
---@generic T
---@param iterator table<any, T>
---@param predicate Predicate
---@return boolean
M.all = function(iterator, predicate)
	for _, value in pairs(iterator) do
		if not predicate(value) then
			return false
		end
	end

	return true
end

return M
