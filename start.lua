print("Start")

write("Enter repository name:")
local repoName = io.read()

write("Enter file name:")
local fileName = io.read()

local function runGit()
    fs.delete(fileName .. ".lua")
    shell.run("wget https://github.com/dadalev/" .. repoName .. "/raw/main/" .. fileName .. ".lua")
    shell.run(fileName .. ".lua")
end

runGit()

print("End")