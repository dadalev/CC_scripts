local version = "v1.1.8"

local monitors = {
    peripheral.wrap("monitor_9"),
    peripheral.wrap("monitor_10"),
    peripheral.wrap("monitor_11"),
    peripheral.wrap("monitor_12"),
    peripheral.wrap("monitor_13"),
    peripheral.wrap("monitor_14")
}

--[Monitor][Villager][Trade][name, textColor, backgroundColor, boolean]
local trades = {
    --Monitor 1
    {
        --Villager 1
        {
            {"Fire"},{"Sweep"},{""},{""},{"Riptide"}
        },
        {
            {"Sharp"},{"AquaAfi"},{""},{""},{"Fortune"}
        },
        {
            {"Infinit"},{""},{""},{""},{"Effi"}
        },
        {
            {"BlastPr"},{"Multi"},{"Mending"},{""},{"Power"}
        },
        {
            {"Effi"},{"FrostWa"},{""},{""},{"Impalin"}
        },
    },
    --Monitor 2
    {
        {
            {"Fortune"},{""},{""},{""},{"Thorns"}
        },
        {
            {"FireProt"},{""},{""},{""},{"Looting"}
        },
        {
            {"Unbreak"},{"Punch"},{""},{""},{"Smite"}
        },
        {
            {""},{""},{""},{""},{"Sharp"}
        },
        {
            {"Pierc"},{"Silk"},{"Feather"},{""},{"Thorns"}
        },
    },
    --Monitor 3
    {
        {
            {"Punch"},{"Channel"},{""},{""},{"Sweep"}
        },
        {
            {"Multi"},{""},{""},{""},{"Unbreak"}
        },
        {
            {"Smite"},{"Channel"},{"Riptide"},{""},{"FireAsp"}
        },
        {
            {"Respira"},{"Binding"},{"PotatoR"},{""},{"Pierc"}
        },
        {
            {""},{""},{""},{""},{"Knockba"}
        },
    },
    --Monitor 4
    {
        {
            {"Depth"},{"Knockba"},{""},{""},{"Thorns"}
        },
        {
            {"Looting"},{"Protect"},{""},{""},{"Loyalty"}
        },
        {
            {"Impalin"},{""},{""},{""},{"Feather"}
        },
        {
            {"Power"},{"Vanish"},{""},{""},{"Power"}
        },
        {
            {"Binding"},{"FireAsp"},{""},{""},{"BaneOfA"}
        },
    },
    --Monitor 5
    {
        {
            {"Thorns"},{""},{""},{""},{"Pierc"}
        },
        {
            {"LuckOfTS"},{"Raiders"},{""},{""},{"Punch"}
        },
        {
            {"PProt"},{"AquaAfi"},{""},{""},{"Punch"}
        },
        {
            {"Flame"},{"Vanish"},{"Respira"},{""},{"Loyalty"}
        },
        {
            {"Backsta"},{"Vanish"},{""},{""},{"Impalin"}
        },
    },
    --Monitor 6
    {
        {
            {"Loyalty"},{""},{""},{""},{"LuckOfTS"}
        },
        {
            {"Multi"},{"Lure"},{""},{""},{"Pierc"}
        },
        {
            {"QuickCh"},{"Mending"},{""},{""},{"Fortune"}
        },
        {
            {"Mystica"},{"Stasis"},{""},{""},{"Loyalty"}
        },
        {
            {"BaneOfA"},{""},{""},{""},{"Lure"}
        },
    },
}

--trades[monitor][villager][trade][1] string        enchant
--trades[monitor][villager][trade][2] colors.white  textColor
--trades[monitor][villager][trade][3] colors.black  backgroundColor
--trades[monitor][villager][trade][4] false         -

local function setupMonitors()
    for _,mon in pairs(monitors) do
      mon.clear()
      mon.setTextScale(1)
      mon.setBackgroundColor(colors.black)
    end
end

local function changeColors(textColor, backgroundColor)
    for _,mon in pairs(monitors) do
      mon.setTextColor(textColor)
      mon.setBackgroundColor(backgroundColor)
    end
end

local function reloadText()
    for monitor in pairs(trades) do
        for villager in pairs(trades[monitor]) do
            for trade in pairs(trades[monitor][villager]) do
                if villager == 1 then
                    monitors[monitor].setCursorPos(1,trade)
                else
                    monitors[monitor].setCursorPos(((villager-1)*10.5),trade)
                end

                changeColors(trades[monitor][villager][trade][2], trades[monitor][villager][trade][3])
                monitors[monitor].write(trades[monitor][villager][trade][1])
            end
        end
    end
end

local function loadTextColors()
    for monitor in pairs(trades) do
        for villager in pairs(trades[monitor]) do
            for trade in pairs(trades[monitor][villager]) do
                if trade == 5 then
                    trades[monitor][villager][trade][2] = colors.purple
                else
                    trades[monitor][villager][trade][2] = colors.yellow
                end

                trades[monitor][villager][trade][3] = colors.black

                trades[monitor][villager][trade][4] = false
            end
        end
    end
end

local function loopLookupEnchant()
    local runLoop = true
    while runLoop do
        write("Lookup enchant: ")
        local userInput = io.read()

        if userInput == "reload" or userInput == "reset" or userInput == "stop" then
            if userInput == "reload" then
                shell.run("clear")

                print("reloaded " .. version)
                print("type reload => reloads program")
                print("type stop => ends program")

                loadTextColors()
                reloadText()
            end

            if userInput == "stop" then
                print("stopped")
                runLoop = false
            end
        else
            for monitor in pairs(trades) do
                for villager in pairs(trades[monitor]) do
                    for trade in pairs(trades[monitor][villager]) do
                        if string.match(string.lower(trades[monitor][villager][trade][1]), string.lower(userInput)) then
                            print("monitor: " .. monitor .. ",   villager: " .. villager .. ",   trade: " .. trade)

                            if trades[monitor][villager][trade][2] == colors.purple then
                                trades[monitor][villager][trade][2] = colors.orange
                            else
                                trades[monitor][villager][trade][2] = colors.red
                            end
                            reloadText()
                        end
                    end
                end
            end
        end
    end
end

shell.run("clear")
print("start " .. version)
print("type reload => reloads program")
print("type stop => ends program")

loadTextColors()
setupMonitors()
reloadText()
loopLookupEnchant()