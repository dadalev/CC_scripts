print("Start")

print("Enter file name:")
local fileName = read("*")

local function runGit()
    fs.delete(fileName .. ".lua")
    shell.run("wget https://github.com/dadalev/CC_villagers/raw/main/" .. fileName .. ".lua")
    shell.run(fileName .. ".lua")
end

runGit()

print("newTest")
print("End")