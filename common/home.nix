{ config, pkgs, ... }:

{
	# packages
	home.packages = with pkgs; [
		hyprpaper
  	];
	
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
		source = ../dotfiles/hypr/hyprland.lua;
	 	target = "hypr/hyprland.lua";
	};
	
	# hyprpaper
	services.hyprpaper = {
		enable = true;
		settings = {
	  		splash = false;
	  		wallpaper = [
	    			{
	      			fit_mode = "cover";
	      			monitor = "";
	      			path = "${../miscellaneous/wallpapers/gray-undertow.jpeg}";
	    			}
			];
		};
	};
	
	# home manager (self-management)
	programs.home-manager.enable = true;

	home.username = "jinsei";
	home.homeDirectory = "/home/jinsei";
	home.stateVersion = "26.05";
}
