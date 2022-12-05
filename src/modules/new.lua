-- made for pkg
-- new.lua
-- 12/4/2022

local newInstance = Instance.new

return function (instance)
    local _instance = newInstance(instance)

    return function (properties)
        local parent = properties.Parent
        if parent then properties.Parent = nil end

        for k, v in pairs(properties) do
            _instance[k] = v
        end

        _instance.Parent = parent

        return _instance
    end
end
