if not syn then return end -- synapse only

if not isfolder "pkg" then  -- create the pkg folder if it doesn't already exist
    makefolder "pkg"
end

if not isfile "pkg/controller.lua" then -- if the pkg controller is not installed
    local response = syn.request {Url = ""}
else -- if the pkg controller IS installed

    -- automatically update the pkg controller if it's out of sync from the repo

end
