{ config, pkgs, ... }:
{

# git
programs.git = {
	enable = true;
	settings = {
		user = {
			name = "Jin Sei";
			email = "nils.rivaillon@protonmail.com";
		};
		init.defaultBranch = "main";
	};
};

# hyprland
wayland.windowManager.hyprland = {
	enable = true;
	settings = {};
	extraConfig = ''

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

	'';
};

home.username = "jinsei";
home.homeDirectory = "/home/jinsei";
home.stateVersion = "26.05";
}
