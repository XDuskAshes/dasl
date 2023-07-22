local l = {
    [ "/startup.lua" ] = "https://raw.githubusercontent.com/XDuskAshes/dasl/main/startup.lua",
    [ "/dasl/.config" ] = "https://raw.githubusercontent.com/XDuskAshes/dasl/main/dasl/.config",
    [ "/dasl/dasl.lua" ] = "https://raw.githubusercontent.com/XDuskAshes/dasl/main/dasl/dasl.lua",
    [ "/dasl/info.txt" ] = "https://raw.githubusercontent.com/XDuskAshes/dasl/main/dasl/info.txt"
}

if fs.exists("/dasl/") then
    for k,v in pairs(l) do
        shell.run("wget",v,k)
    end
else
    fs.makeDir("/dasl/")
        for k,v in pairs(l) do
            shell.run("wget",v,k)
        end
end

print("dasl installed.")