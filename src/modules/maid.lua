-- maid.lua
-- by red
-- 10 / 4 / 2022

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

local maid; maid = {
    __index = maid;

    __call = function(self, object)
        if object == nil then
            for _, object in ipairs(self) do
                objectCleanLogic[typeof(object)](object)
            end
        
            table.clear(self)
        else
            if objectCleanLogic[typeof(object)] then
                self[#self + 1] = object
                return object
            end
        end
    end;

    new = function()
        return setmetatable({}, maid)
    end;
}

return maid
