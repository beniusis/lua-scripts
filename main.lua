files = { "files/file.txt", "files/new.txt" }
File = require "warmup"

for index, file in ipairs(files) do
    local newFile = File.new(file)
    res, output = pcall(newFile:open, "r")
    if not res
        then print("Failed: " .. output)
    else
        print(output)
    end
end