local handle = fs.open("/dasl/.config","r")
local curs = handle.readLine()
handle.close()

local function e(s)
    return s == nil or s == ""
end

local function cursor()
    local handle = fs.open("/dasl/.config","r")
    local foo = handle.readLine()
    local style = handle.readLine()
    handle.close()

    if e(style) then
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
    elseif style == "win" then
        local dir
            if shell.dir() == "" then
                dir = "C:/"
            else
                dir = "C:/"..shell.dir().."/"
            end
        term.setTextColor(colors.white)
        write(dir)
    elseif style == "bash" then
        write("-$")
    elseif style == "cash" then
        write("#")
    end
end

local function rcfg()
    local handle = fs.open("/dasl/.config","r")
    curs = handle.readLine()
    handle.close()
    print("config reloaded")
end

local function pwd()
    if shell.dir() == "" then
        print("/ (root)")
    else
        print("/"..shell.dir().."/")
    end
end

while true do
    cursor()
    local i = read()
    if i == "rcfg" then
        rcfg()
    elseif i == "cls" then
        term.clear()
        term.setCursorPos(1,1)
    elseif i == "pwd" then
        pwd()
    else
        shell.run(i)
    end
end