local module = {}; module.__index = module

function module.new(instance)
	return setmetatable({instance = Instance.new(instance)}, module)
end

function module.__unm(self)
	return self.instance
end

function module:s(prop, value)
	self.instance[prop] = value
	return self
end

return module
