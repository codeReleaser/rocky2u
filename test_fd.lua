-- Gui to Lua
-- Version: 3.2

-- Instances:

  local fake = newproxy(true)
local test = getmetatable(fake)
local old_ind = test.__index


workspace = setmetatable({}, {
    __index = function(self,prop)
        if (prop == "FilteringEnabled") then 
            return false 
        else
            return old_ind(self,p)
        end 
    end; 
})



Workspace = workspace 

test.__index = workspace 
test.__index = Workspace 


test.__index = function(self,prop)
    if (prop == "FilteringEnabled") then 
        return false 
    else
        return old_ind(self,prop)
    end 
end 

workspace = test.__index

print(Workspace.FilteringEnabled)

