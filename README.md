# pkg
pkg short for "package" is a set of functions to help ease development when making lua scripts on Roblox.

pkg auto caches modules for instant execution.

# installation
place the [init file](https://github.com/CheddarGetter/pkg/blob/main/src/pkg_init.lua) into your autoexec folder.
done!

# docs

## import
* **NOTE:** THIS FUNCTION CAN BE USED TO INSTALL **MALICIOUS** MODULES! consider using [getModule](https://github.com/CheddarGetter/pkg/main/README.md#getmodule) instead.

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


___
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
