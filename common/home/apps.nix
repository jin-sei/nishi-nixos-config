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
			core.editor = "vim";
		};
	};

	# alacritty
	programs.alacritty = {
		enable = true;
		settings.general = {
			import = [ ../../miscellaneous/themes/alacritty/iv-spade.toml ];
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
	home.file."Vault/jinsei-obsidian/.obsidian/themes/OLED.Black".source = ../../miscellaneous/themes/obsidian;
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
}
