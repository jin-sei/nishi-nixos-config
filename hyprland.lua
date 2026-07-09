-- NISHI: NIXOS HYPRLAND LUA CONFIG

------------------
---- MONITORS ----
------------------

hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "alacritty"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
