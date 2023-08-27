local function e(s)
    return s == nil or s == ""
end

local dir

local function cursor()
    local handle = fs.open("/dasl/.config","r")
    local curs = handle.readLine()
    local style = handle.readLine()
    handle.close()

    if e(style) then
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
                dir = "C:\\"
            else
                dir = "C:\\"..shell.dir().."\\"
            end
        term.setTextColor(colors.white)
        write(dir)
    elseif style == "bash" then
        write("$")
    elseif style == "cash" then
        write("#")
    end
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
    local i = read(nil, nil, function(str)
        return fs.complete(str, dir, {
            include_files = true,
            include_dirs = true,
            include_hidden = true,
        })
    end)
    if i == "cls" then
        term.clear()
        term.setCursorPos(1,1)
    elseif i == "pwd" then
        pwd()
    elseif i == "cfgedt" then
        shell.run("edit /dasl/.config")
    elseif e(i) then
        write("")
    elseif fs.isDir(i) then
        shell.run("cd",i)
    elseif i == ".." then
        shell.run("cd ..")
    else
        shell.run(i)
    end
end