print("Start")

print("Enter repository name:")
local repoName = read()

print("Enter file name:")
local fileName = read()

local function runGit()
    fs.delete(fileName .. ".lua")
    shell.run("wget https://github.com/dadalev/" .. repoName .. "/raw/main/" .. fileName .. ".lua")
    shell.run(fileName .. ".lua")
end

runGit()

print("End")