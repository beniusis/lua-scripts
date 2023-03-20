local File = require("file_object")
local files = { "files/file.txt", "files/new.txt" }

for _, file in ipairs(files) do
  local file_obj = File:new(file)
  
  local success, output
  
  success, output = pcall(file_obj.open, file_obj, "r")
  if not success then
    print(output)
  else
    print("Successfully opened '" .. file_obj.filename .. "'")
  end
  
  success, output = pcall(file_obj.read, file_obj)
  if not success then
    print(output)
  else
    print("'" .. file_obj.filename .. "' contents: " .. output)
  end
  
  success, output = pcall(file_obj.write, file_obj, "😃💀🔥")
  if not success then
    print(output)
  else
    print("Successfully added new content to '" .. file_obj.filename .. "'")
  end
  
  success, output = pcall(file_obj.close, file_obj)
  if not success then
    print(output)
  else
    print("Successfully closed '" .. file_obj.filename .. "'")
  end
  
  success, output = pcall(file_obj.delete, file_obj)
  if not success then
    print(output)
  else
    print("Successfully deleted '" .. file_obj.filename .. "'")
  end
end