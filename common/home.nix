{ config, pkgs, ... }:

{
	# packages
	home.packages = with pkgs; [
		hyprpaper
  	];
	
	# zsh
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
  			ll = "ls -l";
			gt = "git status && tree";
  			# update = "sudo nixos-rebuild switch";
		};
		history.size = 10000;
		
		# plugin management with oh-my-zsh
		oh-my-zsh = {
    			enable = true;
    			# plugins = [ "git" "thefuck" ];
    			# theme = "robbyrussell";
  		};
	};

	# starship
	programs.starship = {
		enable = true;
		enableZshIntegration = true;
	};
	
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

	# alacritty
	programs.alacritty = {
		enable = true;
		settings = {
			general.import = [ ../miscellaneous/themes/alacritty/iv-spade.toml ];
			general.working_directory = "None";
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

	# other home manager infos
	home.username = "jinsei";
	home.homeDirectory = "/home/jinsei";
	home.stateVersion = "26.05";
}
