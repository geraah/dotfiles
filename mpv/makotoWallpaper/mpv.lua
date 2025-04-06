local function loop(event)
    local currentFile = mp.get_property("playlist-pos")
    if currentFile == "1" then
        mp.command("no-osd set loop-file inf")
    else
        mp.command("no-osd set loop-file no")
    end
end

mp.register_event("file-loaded", loop)