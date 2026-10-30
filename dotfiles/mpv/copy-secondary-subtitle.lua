function shell_escape(str)
    -- Escape double quotes and backslashes
    str = str:gsub('"', '\\"')
    str = str:gsub('\\', '\\\\')
    -- Escape single quotes (for extra safety)
    str = str:gsub("'", "'\\''")
    return str
end

function copy_secondary_subtitle()
    local subtext = mp.get_property("secondary-sub-text")
    if subtext and subtext ~= "" then
	-- mp.commandv("run", "echo", subtext, "|", "wl-copy")
	os.execute("echo '" .. shell_escape(subtext) .. "' | wl-copy")
	print("Secondary subtitle copied to clipboard")
    else
	print("No secondary subtitle available")
    end
end

mp.add_key_binding("Ctrl+s", "copy_secondary_subtitle", copy_secondary_subtitle)
