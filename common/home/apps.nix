{ config, pkgs, pkgs-unstable, inputs, ... }:

{
	# packages (stable)
	home.packages = (with pkgs; [
		hyprpolkitagent
		hyprlock
		hyprpaper
		swaynotificationcenter

		hyprpicker
		hyprshot
		wl-clipboard
		gdu
		wiremix
		localsend
		syncplay
		android-tools

		yt-dlp
		ffmpeg
		mkvtoolnix
		imagemagick

		fortune
		cowsay
		cmatrix
		
		nautilus
			ffmpegthumbnailer
			papers	
		zathura
		keepassxc
		ente-desktop

		ungoogled-chromium
		signal-desktop
		deezer-desktop
		filen-desktop
		discord

		proton-vpn
		proton-pass
		qbittorrent

	# packages (unstable)
  	]) ++ (with pkgs-unstable; [
		# some unstable package
	]);

	imports = [
		# importing some extra/unstable modules options
		# inputs.home-manager-unstable.modules.programs.something.nix
		inputs.areofyl-fetch.homeManagerModules.default
	];

	# enable autostarts 
	xdg.autostart.enable = true;

	# nix helper (nh)
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 7d --keep 10";
		flake = "${config.home.homeDirectory}/nishi-nixos-config"; # sets NH_OS_FLAKE variable
	};

	# fastfetch
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "OSX";
				padding = {right=5;left=3;};
			};
			display = {
				color = "blue";
				separator = ": ";
				key = {width=14;};
			};
			modules = [
				"title"
       				{
					type = "separator";
					string = "─";
				}
       				"os"
       				"kernel"
       				"packages"
       				"shell"
       				"wm"
       				"host"
       				"cpu"
       				"gpu"
       				"memory"
       				"disk"
       				"terminal"
       				"break"
       				"colors"	
			];
		};
	};
	
	# fetch
	programs.fetch = {
		enable = true;
		labelColor = "blue";
		separator = "─";
		info = [
			"os"
			"kernel"
			"packages"
			"shell"
			"wm"
			"host"
			"cpu"
			"gpu"
			"memory"
			"disk"
			"terminal"
			"colors"
		];
		size = 1.0;
		speed = 1.0;
    		spin = "y";
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
			core.editor = "vim";
		};
	};

	# btop
	programs.btop = {
		enable = true;
		settings = {
			color_theme = "TTY";
			theme_background = false;

		};
	};
	
	# obsidian
	home.file."Vault/jinsei-obsidian/.obsidian/themes/OLED.Black" = {
		source = inputs.self + "/miscellaneous/themes/obsidian" ;
		recursive = true;
	};
	programs.obsidian = {
		enable = true;
		vaults."jinsei-obsidian" = {
			target = "${config.home.homeDirectory}/Vault/jinsei-obsidian";
			settings.appearance = {
				accentColor = "#e3e3e3";
				textFontFamily = "";
				cssTheme = "OLED.Black";
			};
		};
	};
		
	# mpv
	xdg.configFile."mpv/scripts".source = inputs.self + "/miscellaneous/dotfiles/mpv";
	programs.mpv = {
		enable = true;
		# scripts = [ pkgs.mpvScripts.mpvacious ];
		config = {
			save-position-on-quit = true;
			profile = "gpu-hq";
			hwdec = "auto-safe";
		};
	};
	
	# keepassxc
	# programs.keepassxc = {
	# 	enable = true;
	# 	autostart = true;
	# 	# all options:
	# 	# https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
	# 	settings = {
	# 		Browser.Enabled = true;
	# 		GUI = {
	# 			MinimizeOnClose = true;
	# 			MinimizeToTray = true;
	# 			MinimizeOnStartup = true;
	# 			ShowTrayIcon = true;
	# 			ApplicationTheme = "dark";
	# 		};
	# 		Security = {
	# 			ClearClipboardTimeout = 30;
	# 			LockDatabaseIdleSeconds = 1800;
	# 		};
	# 	};
	# };
}
