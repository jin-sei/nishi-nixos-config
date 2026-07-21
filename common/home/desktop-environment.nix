{ config, pkgs, inputs, ... }:

{
	# services: hyprpolkitagent
	systemd.user.services.hyprpolkitagent = {
		Unit = {
			Description = "Hyprland Polkit Agent";
			After = [ "graphical-session.target" ]; 
		};
		Service = {
			Type = "simple";
			ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
		Install = {
			WantedBy = [ "graphical-session.target" ];
		};
	};
	
	# rofi
	programs.rofi = {
		enable = true;
		theme = inputs.self + "/miscellaneous/themes/rofi/squared-dark.rasi";
		extraConfig = {
			show-icons = false;
		};
	};
	
	# waybar
	xdg.configFile."waybar" = {
		source = inputs.self + "/miscellaneous/dotfiles/waybar";
	 	target = "waybar";
	};
	
	# swaync (notifications)
	xdg.configFile."swaync" = {
		source = inputs.self + "/miscellaneous/dotfiles/swaync";
	 	target = "swaync";
	};

	# hyprland
	xdg.configFile."hyprland" = {
		source = inputs.self + "/miscellaneous/dotfiles/hypr/hyprland.lua";
	 	target = "hypr/hyprland.lua";
	};

	# hyprlock
	xdg.configFile."hyprlock" = {
		source = inputs.self + "/miscellaneous/dotfiles/hypr/hyprlock.conf";
		target = "hypr/hyprlock.conf";
	};
	xdg.configFile."hyprlock-wallpaper" = {
		target = "hypr/hyprlock-wallpaper.conf";
		text = 
		''
		background {
			monitor =
			path = ${ inputs.self + "/miscellaneous/wallpapers/grey-undertow.jpeg" }
		}
		'';
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
	      			path = "${ inputs.self + "/miscellaneous/wallpapers/grey-undertow.jpeg" }";
	    			}
			];
		};
	};

	# gtk theme
	gtk = {
		enable = true;
		colorScheme = "dark";
		theme = {
			name = "WhiteSur-Dark-solid";
			package = pkgs.whitesur-gtk-theme;
		};
		iconTheme = {
			name = "WhiteSur-dark";
			package = pkgs.whitesur-icon-theme;
		};
	};

	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true; 
		name = "WhiteSur-cursors";
		package = pkgs.whitesur-cursors;
		size = 24;
	};
	
	# qt theme (follows gtk)
	qt = {
		enable = true;
		platformTheme.name = "gtk";
		style.name = "gtk";
	};
}
