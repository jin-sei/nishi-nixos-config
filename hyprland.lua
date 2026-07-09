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

local terminal = ${terminal}

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = ${mod}

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
