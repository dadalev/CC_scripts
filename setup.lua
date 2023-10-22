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
            {""},{""},{""},{""},{"Thorns"}
        },
        --122
        {
            {""},{""},{""},{""},{"Looting"}
        },
        --123
        {
            {""},{""},{""},{""},{"Smite"}
        },
        --124
        {
            {""},{""},{""},{""},{"Sharp"}
        },
        --125
        {
            {""},{""},{""},{""},{"Thorns"}
        },
    },
    --21
    {
        --211
        {
            {""},{""},{""},{""},{"Sweep"}
        },
        --212
        {
            {""},{""},{""},{""},{"Unbreak"}
        },
        --213
        {
            {""},{""},{""},{""},{"FireAsp"}
        },
        --214
        {
            {""},{""},{""},{""},{"Pierc"}
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
            {""},{""},{""},{""},{"Thorns"}
        },
        --222
        {
            {""},{""},{""},{""},{"Loyalty"}
        },
        --223
        {
            {""},{""},{""},{""},{"Feather"}
        },
        --224
        {
            {""},{""},{""},{""},{"Power"}
        },
        --225
        {
            {""},{""},{""},{""},{"BaneOfA"}
        },
    },
    --31
    {
        --311
        {
            {""},{""},{""},{""},{"Pierc"}
        },
        --312
        {
            {""},{""},{""},{""},{"Punch"}
        },
        --313
        {
            {""},{""},{""},{""},{"Punch"}
        },
        --314
        {
            {""},{""},{""},{""},{"Loyalty"}
        },
        --315
        {
            {""},{""},{""},{""},{"Impalin"}
        },
    },
    --32
    {
        --321
        {
            {""},{""},{""},{""},{"LuckOf"}
        },
        --322
        {
            {""},{""},{""},{""},{"Pierc"}
        },
        --323
        {
            {""},{""},{""},{""},{"Fortune"}
        },
        --324
        {
            {""},{""},{""},{""},{"Loyalty"}
        },
        --325
        {
            {""},{""},{""},{""},{"Lure"}
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
      mon.setBackgroundColor(colors.black)
      mon.setTextColor(colors.white)
    end
end

local function write(list)
    for monitor,mon in pairs(trades) do
        print("monitor")
        for villager,vil in pairs(trades[monitor]) do
            print("villager")
            for trade,tra in pairs(trades[monitor][villager]) do
                print("trade")
                if villager == 1 then
                    monitors[monitor].setCursorPos(1,trade)
                else
                    monitors[monitor].setCursorPos(((villager-1)*10.5),trade)
                end
                --monitors[monitor].write("test " .. villager .. " " .. trade)
                monitors[monitor].write(trades[monitor][villager][trade])
            end
        end
    end
end

setupMonitors()
write(trades)