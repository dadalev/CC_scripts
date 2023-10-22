local monitors = {
    peripheral.wrap("monitor_9"),
    peripheral.wrap("monitor_10"),
    peripheral.wrap("monitor_11"),
    peripheral.wrap("monitor_12"),
    peripheral.wrap("monitor_13"),
    peripheral.wrap("monitor_14")
}

local trades = {
    --11
    {
        --111
        {
            {"Fire", colors.red, colors.gray},{"Sweep"},{""},{""},{"Riptide"}
        },
        --112
        {
            {"Sharp"},{"AquaAfi"},{""},{""},{"Fortune"}
        },
        --113
        {
            {"Infinit"},{""},{""},{""},{"Effi"}
        },
        --114
        {
            {"BlastPr"},{"Multi"},{"Mending"},{""},{"Power"}
        },
        --115
        {
            {"Effi"},{"FrostWa"},{""},{""},{"Impalin"}
        },
    },
    --12
    {
        --121
        {
            {"Fortune"},{""},{""},{""},{"Thorns"}
        },
        --122
        {
            {"FireProt"},{""},{""},{""},{"Looting"}
        },
        --123
        {
            {"Unbreak"},{"Punch"},{""},{""},{"Smite"}
        },
        --124
        {
            {""},{""},{""},{""},{"Sharp"}
        },
        --125
        {
            {"Pierc"},{"Silk"},{"Feather"},{""},{"Thorns"}
        },
    },
    --21
    {
        --211
        {
            {"Punch"},{"Channel"},{""},{""},{"Sweep"}
        },
        --212
        {
            {"Multi"},{""},{""},{""},{"Unbreak"}
        },
        --213
        {
            {"Smite"},{"Channel"},{"Riptide"},{""},{"FireAsp"}
        },
        --214
        {
            {"Respira"},{"Binding"},{"PotatoR"},{""},{"Pierc"}
        },
        --215
        {
            {""},{""},{""},{""},{"Knockba"}
        },
    },
    --22
    {
        --221
        {
            {"Depth"},{"Knockba"},{""},{""},{"Thorns"}
        },
        --222
        {
            {"Looting"},{"Protect"},{""},{""},{"Loyalty"}
        },
        --223
        {
            {"Impalin"},{""},{""},{""},{"Feather"}
        },
        --224
        {
            {"Power"},{"Vanish"},{""},{""},{"Power"}
        },
        --225
        {
            {"Binding"},{"FireAsp"},{""},{""},{"BaneOfA"}
        },
    },
    --31
    {
        --311
        {
            {"Thorns"},{""},{""},{""},{"Pierc"}
        },
        --312
        {
            {"LuckOfTS"},{"Raiders"},{""},{""},{"Punch"}
        },
        --313
        {
            {"PProt"},{"AquaAfi"},{""},{""},{"Punch"}
        },
        --314
        {
            {"Flame"},{"Vanish"},{"Respira"},{""},{"Loyalty"}
        },
        --315
        {
            {"Backsta"},{"Vanish"},{""},{""},{"Impalin"}
        },
    },
    --32
    {
        --321
        {
            {"Loyalty"},{""},{""},{""},{"LuckOfTS"}
        },
        --322
        {
            {"Multi"},{"Lure"},{""},{""},{"Pierc"}
        },
        --323
        {
            {"QuickCh"},{"Mending"},{""},{""},{"Fortune"}
        },
        --324
        {
            {"Mystica"},{"Stasis"},{""},{""},{"Loyalty"}
        },
        --325
        {
            {"BaneOfA"},{""},{""},{""},{"Lure"}
        },
    },
}

--trades[monitor][villager][trade][1] enchant
--trades[monitor][villager][trade][2] textColor
--trades[monitor][villager][trade][3] backgroundColor

local function setupMonitors()
    for _,mon in pairs(monitors) do
      mon.clear()
      mon.setTextScale(1)
      mon.setTextColor(colors.white)
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

                if trade == 5 then
                    changeColors(colors.purple, colors.black)
                else
                    changeColors(colors.white, colors.black)
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

                    end
                end
            end
        end
    end
end

setupMonitors()
reloadText()
lookupEnchant()