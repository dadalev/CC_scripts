local monitors = {
    peripheral.wrap("monitor_9"),
    peripheral.wrap("monitor_10"),
    peripheral.wrap("monitor_11"),
    peripheral.wrap("monitor_12"),
    peripheral.wrap("monitor_13"),
    peripheral.wrap("monitor_14")
}

local function clear()
    for _,mon in pairs( monitors ) do
      mon.clear()
    end
end

clear()

local function write(text)
    for _,mon in pairs(monitors) do
      mon.write(text)
    end
end

write("test")

print("Fire")
print("Sweep")
print("")
print("Rip")
