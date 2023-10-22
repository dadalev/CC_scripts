local monitors = {
    peripheral.wrap("monitor_9"),
    peripheral.wrap("monitor_10"),
    peripheral.wrap("monitor_11"),
    peripheral.wrap("monitor_12"),
    peripheral.wrap("monitor_13"),
    peripheral.wrap("monitor_14")
}

local trades = {
    --1
    {
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
    --2
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
    --3
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
    --4
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
    --5
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
    --6
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

local function lookupEnchant()
    while true do
        write("Lookup enchant: ")
        local userInput = io.read()

        for monitor in pairs(trades) do
            for villager in pairs(trades[monitor]) do
                for trade in pairs(trades[monitor][villager]) do
                    if string.match(
                            string.lower(trades[monitor][villager][trade][1]), 
                            string.lower(userInput)
                        ) then
                        print("monitor: " .. monitor .. ",   villager: " .. villager .. ",   trade: " .. trade)
                        trades[monitor][villager][trade][2] = colors.red
                        reloadText()
                    end
                end
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

print("v1.0.4")
loadTextColors()
setupMonitors()
reloadText()
lookupEnchant()