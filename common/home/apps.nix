{ config, pkgs, inputs, ... }:

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
			core.editor = "vim";
		};
	};

	# alacritty
	programs.alacritty = {
		enable = true;
		settings.general = {
			import = [ (inputs.self + "/miscellaneous/themes/alacritty/iv-spade.toml") ];
			working_directory = "None";
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
			target = "/home/jinsei/Vault/jinsei-obsidian";
			settings.appearance = {
				accentColor = "#e3e3e3";
				textFontFamily = "";
				cssTheme = "OLED.Black";
			};
		};
	};
		
	# mpv
	xdg.configFile."mpv/scripts".source = inputs.self + "/miscellaneous/dotfiles/mpv";
	# programs.mpv = {
	# 	enable = true;
	# 	scripts = [ pkgs.mpvScripts.mpvacious ];
	# };
	
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
