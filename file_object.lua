-- checks whether the specified file exists
function file_exists(path)
    local file = io.open(path, "r")
    if file then file:close() end
    return file ~= nil
end

-- OOP imitation for files manipulation
local File = {}
File.__index = File

function File:new(filename)
  local self = setmetatable({}, File)
  self.filename = filename
  return self
end

function File:open(mode)
  local file, err = io.open(self.filename, mode)
  if not file then
    error("Error while opening the file '" .. self.filename .. "': does not exist")
  end
  self.file = file
  self.mode = mode
end

function File:close()
  if not self.file then
    error("Error while closing the file '" .. self.filename .. "': is not opened")
  end
  self.file:close()
end

function File:read()
  if not self.file then
    error("Error while reading the file '" .. self.filename .. "': is not opened or opened with the wrong mode")
  end
  return self.file:read("*all")
end

function File:write(contents)
  if not self.file then
    error("Error while writing to the file '" .. self.filename .. "': file not opened")
  end
  if self.mode ~= "w" and self.mode ~= "a" then
    error("Error while writing to the file '" .. self.filename .. "': file not opened in write or append mode")
  end
  self.file:write(contents .. "\n")
end

function File:delete()
  if not file_exists(self.filename) then
    error("Error while deleting the file '" .. self.filename .. "': does not exist")
  end
  os.remove(self.filename)
end

return File