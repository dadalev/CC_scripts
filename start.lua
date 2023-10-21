local function runGit(repoName, fileName)
    fs.delete(fileName .. ".lua")
    shell.run("wget https://github.com/" .. repoName .. "/raw/main/" .. fileName .. ".lua")
    shell.run(fileName .. ".lua")
end

local function userInputEmpty(input)
    if input == "" then
        return true
    else
        return false
    end
end

local myRepoName = "dadalev/CC_scripts"
local myFileName = "setup"

write("Enter repository name:")
local userInput = io.read()
if not userInputEmpty(userInput) then
    myRepoName = userInput
end

write("Enter file name:")
userInput = io.read()
if not userInputEmpty(userInput) then
    myFileName = userInput
end

runGit(myRepoName, myFileName)