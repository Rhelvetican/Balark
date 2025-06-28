if not Balark then
	Balark = {}
end

local path = "" .. SMODS.current_mod.path
local libitems = NFS.getDirectoryItems(path .. "lib")

Balark.path = path

for _, file in pairs(libitems) do
	local f, err = SMODS.load_file("lib/" .. file)
	if err then
		error(err)
	end

	f()
end

Balark.utils.loadFile("items/Atlas.lua")
Balark.utils.loadFile("items/Enhancements.lua")
Balark.utils.loadFile("items/Joker.lua")
