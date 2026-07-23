------------------
---- MONITORS ----
------------------

hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = "1",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
end)

---------------------
---- MY PROGRAMS ----
---------------------

local terminal 	= "alacritty"
local files 	= "nautilus -w"
local launcher 	= "rofi -show drun"

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- cursors
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "WhiteSur-Cursors")
hl.env("HYPRCURSOR_SIZE", "24")

-- nvidia
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo   = true,
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local altMod = "ALT"

-- launching programs
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- controlling programs
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind("F3", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("F1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- actions on windows
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Move/resize windows with mainMod (+ALT) + dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + " .. altMod .. " + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- move active window to workspace +1 or -1 with maindMod + ALT + LEFT or RIGHT
hl.bind(mainMod .. " + " .. altMod ..  " + left",     hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + " .. altMod ..  " + right",     hl.dsp.window.move({ workspace = "+1" }))

-- switch workspaces with mainMod + [0-9]
-- move active window to a workspace with mainMod + altMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + code:" .. key+9,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + " .. altMod ..  " + code:" .. key+9,     hl.dsp.window.move({ workspace = i }))
end

-- special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + " .. altMod .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	name = "float-on-magic",
	match = {
		workspace = "s[true]"
	},
	float = true;
})

hl.window_rule({
	name = "floating-magic-terminal",
	match = {
		workspace = "s[true]",
		class = "Alacritty"
	},
	center = true,
	size = {800, 500};
})

hl.window_rule({
	name = "floating-magic-protonvpn",
	match = {
		workspace = "s[true]",
		class = "proton.vpn.app.gtk"
	},
	move = {1377, 203},
	size = {450, 700};
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout  = "fr",
		kb_variant = "",
		kb_model   = "",
		kb_options = "",
		kb_rules   = "",
		
		follow_mouse = 1,
		
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		
		touchpad = {
			natural_scroll = false,
		},
	},
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in  = 1,
		gaps_out = 1,
		
		border_size = 1,
		
		col = {
			active_border   = "rgba(595959aa)",
			inactive_border = "rgba(595959aa)",
		},
		
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		
		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
		
		layout = "dwindle",
	},
	
	decoration = {
		rounding = 1,
		
		active_opacity   = 1.0,
		inactive_opacity = 1.0,
		
		shadow = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = 0xee1a1a1a,
		},
		
		blur = {
			enabled   = true,
			size      = 3,
			passes    = 1,
			vibrancy  = 0.1696,
		},
	},
	
	animations = {
		enabled = true,
	},
})

-- curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0}  } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
