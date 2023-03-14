-- checks whether the specified file exists
function file_exists(path)
    local file = io.open(path, "r")
    if file then file:close() end
    return file ~= nil
end

-- reads the content of a file
function read_file(path)
    if not file_exists(path) then return nil end
    local file = io.open(path, "r")
    local content = file:read("*a")
    file:close()
    return content
end

-- appends new content at the end of a specified file
function append_to_file(path, text)
    if not text then return nil end
    if not file_exists(path) then
        local file = io.output(path, "a")
        file:write(text)
        file:close()
    else
        local file = io.open(path, "a")
        file:write(string.format("\n%s", text))
        file:close()
    end
end

-- main
local file = "file.txt"

local fileContent = read_file(file)
print(fileContent)

append_to_file(file, "😎")