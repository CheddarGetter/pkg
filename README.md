# pkg
pkg short for "package" is a set of functions to help ease development when making scripts on Roblox.

pkg is a [daemon](https://www.wordnik.com/words/daemon), it is non intrusive and intuitive to use.

import and use externally hosted modules with 1 line of code.
the modules you import have similar functionality to normal Roblox [ModuleScripts](https://create.roblox.com/docs/reference/engine/classes/ModuleScript).

# how to use
simply place the loadstring at the top of your script.
example:
```lua
loadstring(isfile "pkg_controller.lua" and readfile "pkg_controller.lua" or game:HttpGetAsync("https://raw.githubusercontent.com/CheddarGetter/pkg/main/src/controller.lua"))()

print(getModule("debug"))
```

# docs

## getModule
this functions allows you to import safe open-source modules that have been curated by pkg.

view the curated list of modules [here](https://github.com/CheddarGetter/pkg/tree/main/src/modules).

```
getModule([string] moduleName) [variant] moduleContents
```

```lua
local signal = getModule("signal")
local newNumber = signal.new()

newNumber:Connect(function(number)
    print(number)
end)

for i = 1, 10 do
    newNumber:Fire(i)
end
```

___
## import
**NOTE:** THIS FUNCTION CAN BE USED TO INSTALL **MALICIOUS** MODULES! consider using getModule instead.

this function allows you to import any lua module from a raw content url.

```
import([string] url) [variant] moduleContents
```

```lua
local signal = import("https://gist.githubusercontent.com/stravant/b75a322e0919d60dde8a0316d1f09d2f/raw/f6a8900676185457211ec25d22d681c20ee792cb/GoodSignal.lua")
local newNumber = signal.new()

newNumber:Connect(function(number)
    print(number)
end)

for i = 1, 10 do
    newNumber:Fire(i)
end
```
