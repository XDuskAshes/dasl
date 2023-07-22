local handle = fs.open("/dasl/.config","r")
local curs = handle.readLine()
handle.close()

local function rcfg()
    local handle = fs.open("/dasl/.config","r")
    curs = handle.readLine()
    handle.close()
    print("config reloaded")
end

while true do
    local dir
    if shell.dir() == "" then
        dir = "/"
    else
        dir = "/"..shell.dir().."/"
    end
    term.setTextColor(colors.yellow)
    print("+["..dir.."]")
    write("|"..curs.." ")
    term.setTextColor(colors.white)
    local i = read()
    if i == "rcfg" then
        rcfg()
    elseif i == "cls" then
        term.clear()
        term.setCursorPos(1,1)
    else
        shell.run(i)
    end
end