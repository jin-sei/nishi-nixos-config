{ config, pkgs, ... }:

{
	# packages
	home.packages = with pkgs; [
		hyprpaper
		hyprpicker
		hyprshot
		wl-clipboard

		fortune
		cowsay
		
		neovim
  	];
	
	# nix helper (nh)
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 7d --keep 10";
		flake = "/home/jinsei/nishi-nixos-config"; # sets NH_OS_FLAKE variable for you
	};	
	
	# zsh
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
  			ll = "ls -l";
			gt = "git status && tree";
			cow = "fortune | cowsay";
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
		settings = {

			format = "$username$hostname$directory$git_branch$git_status$line_break$character";
			add_newline = true;

			character = {
				success_symbol = "[\\$>](bold green)";
				error_symbol = "[\\$>](bold red)"; 
			};

			username = {
				show_always = true;
				format = "[$user]($style)";
			};
			
			hostname = {
				ssh_only = false;
				format = "@[$hostname]($style) "; 
			};
			
			directory = {
				format = "[$path]($style)";
				truncation_length = 1;
      				truncation_symbol = "";
      				truncate_to_repo = false;
				read_only = "(RO) "; 
			};
			
			git_branch = {
				symbol = ""; 
				format = ":[$branch]($style) ";
			};
			
			git_status = {
				format = "([$all_status$ahead_behind]($style) )";
				conflicted = "=";
				ahead = ">";
				behind = "<";
				diverged = "<>";
				untracked = "?";
				modified = "!";
				staged = "+";
				renamed = "r";
				deleted = "x";
				stashed = "$";
			};
			
			# disables the package module which usually injects a box icon
			package.disabled = true; 
		};
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
		settings.general = {
			import = [ ../miscellaneous/themes/alacritty/iv-spade.toml ];
			working_directory = "None";
		};
	};

	# btop
	programs.btop = {
		enable = true;
		settings = {
			color_theme = "adapta";
			theme_background = false;

		};
	};

	# rofi
	programs.rofi = {
		enable = true;
		theme = ../miscellaneous/themes/rofi/squared-dark.rasi; 
		extraConfig = {
			show-icons = false;
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

	# gtk theme
	gtk = {
		enable = true;
		colorScheme = "dark";
		theme = {
			name = "WhiteSur-gtk-theme";
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

	# home manager (self-management)
	programs.home-manager.enable = true;

	# other home manager infos
	home.username = "jinsei";
	home.homeDirectory = "/home/jinsei";
	home.stateVersion = "26.05";
}
