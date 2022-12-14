-- made for pkg
-- net.lua
-- 12/4/2022

local heartbeat = game:GetService("RunService").Heartbeat
local random = Random.new()

local module = {}

function module:align(part0, part1)
    local at0 = Instance.new("Attachment")
    at0.Parent = part0

    local at1 = Instance.new("Attachment")
    at1.Parent = part1

    local alignPosition = Instance.new("AlignPosition")
    alignPosition.Attachment0 = at0
    alignPosition.Attachment1 = at1
    alignPosition.RigidityEnabled = true
    alignPosition.Parent = part0

    local alignOrientation = Instance.new("AlignOrientation")
    alignOrientation.Attachment0 = at0
    alignOrientation.Attachment1 = at1
    alignOrientation.RigidityEnabled = true
    alignOrientation.Parent = part0
end

function module:keepOwnershipOf(part)
    local update = true

    task.spawn(function()
        while update do
            part.AssemblyLinearVelocity = (Vector3.xAxis * random:NextNumber(27, 28))
            part.AssemblyLinearVelocity = (Vector3.yAxis * random:NextNumber(27, 28))

            heartbeat:Wait()
        end
    end)

    local checkParent; checkParent = part:GetPropertyChangedSignal("Parent"):Connect(function()
        if part.Parent == nil then
            update = nil
            checkParent:Disconnect()
        end
    end)
end

return module
