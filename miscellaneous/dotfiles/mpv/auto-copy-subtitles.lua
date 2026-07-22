local enabled = false

local function clean_subtitle(text)
    if not text then return "" end
    local cleaned = text:gsub("{[^}]*}", ""):gsub("^%s*(.-)%s*$", "%1")
    return cleaned
end

local function copy_to_clipboard(text)
    local clean_text = clean_subtitle(text)
    if clean_text == "" then return end

    mp.command_native({
        name = "subprocess",
        playback_only = false,
        detach = true,
        args = {"wl-copy", clean_text}
    })
end

local function on_sub_text_change(name, value)
    if enabled and value and value ~= "" then
        copy_to_clipboard(value)
    end
end

local function toggle_auto_copy()
    enabled = not enabled
    local status = enabled and "ON" or "OFF"
    
    mp.osd_message("Subtitle Auto-Copy: " .. status, 2)

    end

mp.observe_property("sub-text", "string", on_sub_text_change)
mp.add_key_binding("a", "toggle-sub-autocopy", toggle_auto_copy)
