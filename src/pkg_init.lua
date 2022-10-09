if not syn then return end

if not isfolder "pkg" then makefolder "pkg" end
if not isfolder "pkg/modules" then makefolder "pkg/modules" end

if not isfile "pkg/controller.lua" then
    local response = syn.request {Url = "https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/controller.lua"}

    if response.Success == true then
        writefile("pkg/controller.lua", response.Body)
    else
        warn(tostring(response.StatusCode) .. ": " .. tostring(response.StatusMessage))
        return
    end
end

local chunk, catch = loadfile "pkg/controller.lua"
if catch then
    warn(catch)
    return
end

task.spawn(chunk)
