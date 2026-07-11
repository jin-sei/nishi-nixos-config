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
xdg.configFile."hyprland" = {
  source = ./dotfiles/hypr/hyprland.lua;
  target = "hypr/hyprland.lua";
};

home.username = "jinsei";
home.homeDirectory = "/home/jinsei";
home.stateVersion = "26.05";
}
