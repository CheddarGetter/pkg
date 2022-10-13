-- maid.lua
-- by red
-- 10 / 12 / 2022

local objectCleanLogic = {
	["thread"] = function(object)
		task.cancel(object)
	end;

	["RBXScriptConnection"] = function(object)
		object:Disconnect()
	end;

	["Instance"] = function(object)
		object:Destroy()
	end;
}

local module = {}; module.__index = module

function module.new()
	return setmetatable({}, module)
end

function module:clean()
	for _, object in ipairs(self) do
		objectCleanLogic[typeof(object)](object)
	end

	table.clear(self)
end

function module:add(object)
	if objectCleanLogic[typeof(object)] then
		self[#self + 1] = object
		return object
	end
end

return module
