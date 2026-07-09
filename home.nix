{ config, pkgs, ... }:
let
	mod = "SUPER";
  	terminal = "alacritty";
	# some colors ?
in
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
wayland.windowManager.hyprland.enable = true;
xdg.configFile."hypr/hyprland.lua".text = ''
	${builtins.readFile ./hyprland.lua}
'';

home.stateVersion = "26.05";
}
