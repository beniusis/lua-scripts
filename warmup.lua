-- checks whether the specified file exists
function file_exists(path)
    local file = io.open(path, "r")
    if file then file:close() end
    return file ~= nil
end

-- OOP imitation for files manipulation
local File = {}
File.__index = File

function File.new(filename)
    local obj = setmetatable({}, File)
    obj.filename = filename
    return obj
end

function File:open(mode)
    if not file_exists(self.filename) then
        local status, err = pcall(function () error(string.format("%s file does not exist!", self.filename)) end)
        print(err)
        return
    end
    self.file = io.open(self.filename, mode)
end

function File:close()
    if not self.file then
        local status, err = pcall(function () error(string.format("%s file is not opened!", self.filename)) end)
        print(err)
        return
    end
    self.file:close()
end

function File:read()
    if not self.file then
        local status, err = pcall(function () error(string.format("%s file is not opened!", self.filename)) end)
        print(err)
        return
    end
    return self.file:read("*a")
end

function File:write(text)
    if not self.file then
        local status, err = pcall(function () error(string.format("%s file is not opened!", self.filename)) end)
        print(err)
        return
    end
    self.file:write(string.format("%s\n", text))
end

function File:delete()
    if not file_exists(self.filename) then
        local status, err = pcall(function () error(string.format("%s file does not exist!", self.filename)) end)
        print(err)
        return
    end
    os.remove(self.filename)
end

local file = File.new("files/file.txt")
file:open("r")
local contents = file:read()
file:close()
print(contents)

file:open("a")
file:write("🥶")
file:close()