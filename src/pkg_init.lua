-- synapse only!!! >:(
if not syn then return end

-- create the pkg folder if it doesn't already exist
if not isfolder "pkg" then
    makefolder "pkg"
end

local function updateController()
    -- send a request to get the latest controller version
    local response = syn.request {Url = "https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/controller.lua"}

    if response.Success == true then
        -- install the controller
        writefile("pkg/controller.lua", response.Body)
    else
        -- woops something went wrong with the request, this darned internet i tell ya!
        error(response.StatusCode .. ": " .. response.StatusMessage) -- tell me what went wrong... NOW!
    end
end

-- if the pkg controller is not installed, install it
if not isfile "pkg/controller.lua" then
    updateController()
end

-- load that controllah! please no errors :^) (praying)
local chunk, catch = loadfile "pkg/controller.lua"
if catch then
    error(catch) -- tell me why!!!!!!!
end

-- the user won't run the latest controller until this script is executed again
-- personally i think this is better than yielding to get the latest version though
-- change it if u so desire, this is the beauty of open source software!
updateController()
