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
            {"Fire"},{"Sweep"},{""},{""},{"Rip"}
        },
        --112
        {
            {""},{""},{""},{""},{""}
        },
        --113
        {
            {""},{""},{""},{""},{""}
        },
        --114
        {
            {""},{""},{""},{""},{""}
        },
        --115
        {
            {""},{""},{""},{""},{""}
        },
    },
    --12
    {
        --121
        {
            {""},{""},{""},{""},{""}
        },
        --122
        {
            {""},{""},{""},{""},{""}
        },
        --123
        {
            {""},{""},{""},{""},{""}
        },
        --124
        {
            {""},{""},{""},{""},{""}
        },
        --125
        {
            {""},{""},{""},{""},{""}
        },
    },
    --21
    {
        --211
        {
            {""},{""},{""},{""},{""}
        },
        --212
        {
            {""},{""},{""},{""},{""}
        },
        --213
        {
            {""},{""},{""},{""},{""}
        },
        --214
        {
            {""},{""},{""},{""},{""}
        },
        --215
        {
            {""},{""},{""},{""},{""}
        },
    },
    --22
    {
        --221
        {
            {""},{""},{""},{""},{""}
        },
        --222
        {
            {""},{""},{""},{""},{""}
        },
        --223
        {
            {""},{""},{""},{""},{""}
        },
        --224
        {
            {""},{""},{""},{""},{""}
        },
        --225
        {
            {""},{""},{""},{""},{""}
        },
    },
    --31
    {
        --311
        {
            {""},{""},{""},{""},{""}
        },
        --312
        {
            {""},{""},{""},{""},{""}
        },
        --313
        {
            {""},{""},{""},{""},{""}
        },
        --314
        {
            {""},{""},{""},{""},{""}
        },
        --315
        {
            {""},{""},{""},{""},{""}
        },
    },
    --32
    {
        --321
        {
            {""},{""},{""},{""},{""}
        },
        --322
        {
            {""},{""},{""},{""},{""}
        },
        --323
        {
            {""},{""},{""},{""},{""}
        },
        --324
        {
            {""},{""},{""},{""},{""}
        },
        --325
        {
            {""},{""},{""},{""},{""}
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
                monitors[monitor].write("test " .. villager .. " " .. trade)
            end
        end
    end
end

setupMonitors()
write(trades)