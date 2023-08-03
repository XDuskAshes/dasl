local l = {
    "startup.lua",
    "LICENSE",
    "dasl/.config",
    "dasl/dasl.lua",
    "dasl/info.txt",
}

local spinner = {"|","/","-","\\"}
local stage = 0

local x,y = term.getCursorPos()
if fs.exists("/dasl/") then
    for k,v in pairs(l) do
        local handle = assert(http.get("https://raw.githubusercontent.com/XDuskAshes/dasl/main/"..v))
            local toWrite = {}
            repeat
                local a = handle.readLine()
                table.insert(toWrite,a)
            until a == nil
            handle.close()
            handle = fs.open(v,"w")
            for _,v in pairs(toWrite) do
                handle.writeLine(v)
            end
            handle.close()
        term.setCursorPos(x,y)
        stage = (stage % 4) + 1
        write("installing dasl... ".. spinner[stage].." ")
    end
else
    fs.makeDir("/dasl/")
        for k,v in pairs(l) do
            local handle = assert(http.get("https://raw.githubusercontent.com/XDuskAshes/dasl/main/"..v))
            local toWrite = {}
            repeat
                local a = handle.readLine()
                table.insert(toWrite,a)
            until a == nil
            handle.close()
            handle = fs.open(v,"w")
            for _,v in pairs(toWrite) do
                handle.writeLine(v)
            end
            handle.close()
        term.setCursorPos(x,y)
        stage = (stage % 4) + 1
        write("installing dasl... ".. spinner[stage].." ")
        end
end

print("dasl installed.")
sleep(1)
os.reboot()
