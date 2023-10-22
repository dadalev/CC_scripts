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
            {"Fire"},{"Sweep"},{""},{""},{"Riptide"}
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

--hight      12(mc)  49(cc)
--width side 14(mc)  56(cc)
--width full 16(mc)  64(cc)

local function setupMonitors()
    for _,mon in pairs(monitors) do
      mon.clear()
      mon.setTextScale(1)
      mon.setTextColor(colors.white)
      mon.setBackgroundColor(colors.black)
    end
end

local function changeMonitorColors(textColor, backgroundColor)
    for _,mon in pairs(monitors) do
      mon.setTextColor(textColor)
      mon.setBackgroundColor(colors.backgroundColor)
    end
end

local function write(list)
    for monitor,mon in pairs(trades) do
        for villager,vil in pairs(trades[monitor]) do
            for trade,tra in pairs(trades[monitor][villager]) do
                if villager == 1 then
                    monitors[monitor].setCursorPos(1,trade)
                else
                    monitors[monitor].setCursorPos(((villager-1)*10.5),trade)
                end

                if trade == 5 then
                    changeMonitorColors(colors.white, colors.black)
                else
                    changeMonitorColors(colors.red, colors.gray)
                end

                monitors[monitor].write(trades[monitor][villager][trade][1])
            end
        end
    end
end

setupMonitors()
write(trades)