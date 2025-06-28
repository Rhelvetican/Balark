if not Balark then
	Balark = {}
end

local path = "" .. SMODS.current_mod.path
local libitems = NFS.getDirectoryItems(path .. "lib")

Balark.path = path

for _, file in pairs(libitems) do
	local f, err = SMODS.load_file("lib/" .. file)
	if err or f == nil then
		error(err)
	end

	f()
end

local items = NFS.getDirectoryItems(path .. "items")

for _, file in pairs(items) do
	local f, err = SMODS.load_file("items/" .. file)
	if err or f == nil then
		error(err)
	end

	f()
end
