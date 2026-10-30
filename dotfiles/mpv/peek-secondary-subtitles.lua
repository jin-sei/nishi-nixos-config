-- peek_sec_sub.lua
-- Hides secondary subtitles and reveals them on key hold or top-screen mouse hover.

local mp = require 'mp'

local options = {
    -- The top percentage of the screen that triggers the hover (0.25 = top 25%)
    hover_zone_height = 0.25, 
    
    -- Key to HOLD down to reveal subtitles (peek)
    peek_key = "alt+d",
    
    -- Key to TOGGLE subtitles permanently on/off
    toggle_key = "alt+b",
}

local state = {
    peek_active = false,
    toggle_active = false,
    mouse_active = false,
}

-- Re-evaluates whether the subtitle should be visible
function update_visibility()
    local visible = state.peek_active or state.toggle_active or state.mouse_active
    mp.set_property_bool("secondary-sub-visibility", visible)
end

-- Mouse Hover Logic
function on_mouse_move(name, mouse)
    if not mouse or type(mouse) ~= "table" then return end

    local osd_h = mp.get_property_number("osd-height")
    if not osd_h or osd_h == 0 then return end

    local in_zone = false
    -- Check if mouse is hovering over the window and in the top X% of the screen
    if mouse.hover and mouse.y then
        if mouse.y < (osd_h * options.hover_zone_height) then
            in_zone = true
        end
    end

    -- Only update property if state actually changed (prevents spamming the property)
    if in_zone ~= state.mouse_active then
        state.mouse_active = in_zone
        update_visibility()
    end
end

-- Hold-to-Peek Logic
function on_peek_key(table)
    if table.event == "down" then
        state.peek_active = true
        update_visibility()
    elseif table.event == "up" then
        state.peek_active = false
        update_visibility()
    end
end

-- Permanent Toggle Logic
function on_toggle_key()
    state.toggle_active = not state.toggle_active
    update_visibility()
    if state.toggle_active then
        mp.osd_message("Secondary Subs: Pinned ON")
    else
        mp.osd_message("Secondary Subs: Auto/Peek")
    end
end

-- Initialization
-- Hide secondary subs as soon as the script loads
mp.set_property_bool("secondary-sub-visibility", false)

-- Event listeners
mp.observe_property("mouse-pos", "native", on_mouse_move)
mp.add_key_binding(options.peek_key, "peek-sec-sub", on_peek_key, {complex = true})
mp.add_key_binding(options.toggle_key, "toggle-sec-sub", on_toggle_key)
