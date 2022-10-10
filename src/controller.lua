if not syn or pkg then return end

if not isfile "pkg_controller.lua" then
    local response = syn.request {Url = "https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/controller.lua"}

    if response.Success == true then
        writefile("pkg_controller.lua", response.Body)
    else
        warn(tostring(response.StatusCode) .. ": " .. tostring(response.StatusMessage))
        return
    end
end

if not isfolder "pkg" then makefolder "pkg" end
if not isfolder "pkg/modules" then makefolder "pkg/modules" end

local b64Decode = syn_crypt_b64_decode
local b64Encode = syn_crypt_b64_encode

local moduleFolderUrl = "https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/modules/%s.lua"

local modules = {}
local importQueue = {}
local moduleLoaded = Instance.new("BindableEvent")

local globalEnv = getgenv()

globalEnv.pkg = true

local function httpGet(url, callback)
    local response = syn.request {Url = url}

    if response.Success == true then
        callback(response)
    else
        warn(tostring(response.StatusCode) .. ": " .. tostring(response.StatusMessage))
        return
    end

    return response
end

function globalEnv.import(url)
    if importQueue[url] then
        while moduleLoaded.Event:Wait() ~= url do end
    end

    if modules[url] then
        return modules[url]
    end

    importQueue[url] = true

    local b64Url = b64Encode(url)
    local path = ("pkg/modules/%s.lua"):format(b64Url)

    if not isfile(path) then
        httpGet(url, function(response)
            writefile(path, response.Body)
        end)
    end

    local chunk, catch = loadfile(path)
    if catch then
        warn(catch)
        return
    end

    local module = assert(chunk(), "Module does not return anything")

    importQueue[url] = nil
    modules[url] = module

    moduleLoaded:Fire(url)

    return module
end

function globalEnv.getModule(moduleName)
    return import(moduleFolderUrl:format(moduleName))
end


-- handle updating
httpGet("https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/controller.lua", function(response)
    if readfile "pkg/controller.lua" == response.Body then return end

    local choice = messagebox("would you like to update the pkg controller?", "pkg", 4)

    if choice == 6 then
        writefile("pkg/controller.lua", response.Body)
    end
end)
