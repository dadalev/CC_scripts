local function runGit(repoName, fileName)
    fs.delete(fileName .. ".lua")
    shell.run("wget https://github.com/" .. repoName .. "/raw/main/" .. fileName .. ".lua")
    shell.run(fileName .. ".lua")
end

write("Enter repository name:")
local myRepoName = io.read()

write("Enter file name:")
local myFileName = io.read()

runGit(myRepoName, myFileName)