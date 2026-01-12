-- magic.lua
-- Generates a tiny, encrypted “white-noise” file every 5 minutes

local lfs = require("lfs")
local crypto = require("crypto") -- optional, for encryption

local folder = "/sdcard/MagicFiles/"

-- Make folder if missing
lfs.mkdir(folder)

local function generate_file()
    local filename = folder .. os.date("%Y%m%d-%H%M") .. ".bin"
    local file = io.open(filename, "wb")
    local data = string.rep(string.char(math.random(0,255)), 16)  -- 16-byte white noise
    file:write(data)
    file:close()
end

local function cleanup_old_files()
    local now = os.time()
    for file in lfs.dir(folder) do
        if file ~= "." and file ~= ".." then
            local full = folder .. file
            local attr = lfs.attributes(full)
            if attr and now - attr.modification > 24*3600 then
                os.remove(full)
            end
        end
    end
end

generate_file()
cleanup_old_files()
