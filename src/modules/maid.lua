-- made for pkg
-- maid.lua
-- 12 / 4 / 2022

local objectCleanLogic = {
	["thread"] = function(object)
		pcall(task.cancel, object) -- could be a footgun?
	end;

	["RBXScriptConnection"] = function(object)
		object:Disconnect()
	end;

	["Instance"] = function(object)
		object:Destroy()
	end;
}

local module = {}
module.__index = module

function module.new()
	return setmetatable({}, module)
end

function module:Clean()
	for _, object in ipairs(self) do
		objectCleanLogic[typeof(object)](object)
	end

	table.clear(self)
end

function module:Add(object)
	if objectCleanLogic[typeof(object)] then
		self[#self + 1] = object
		return object
	end
end

return module
