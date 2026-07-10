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

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

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

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

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

	'';
};

home.username = "jinsei";
home.homeDirectory = "/home/jinsei";
home.stateVersion = "26.05";
}
