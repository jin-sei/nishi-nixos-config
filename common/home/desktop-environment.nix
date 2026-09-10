{ config, lib, pkgs, inputs, isLaptop ? false, ... }:
let
	waybarEtiquetteColor = "#5A5555";
in
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

	# alacritty
	programs.alacritty = {
		enable = true;
		settings = {
			general = {
				import = [ (inputs.self + "/miscellaneous/themes/alacritty/iv-spade.toml") ];
				working_directory = "None";
			};
			window = {
				padding = {
					x = 7;
					y = 7;
				};
			};
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
	
	# waybar
	xdg.configFile."waybar/style.css" = {
		source = inputs.self + "/miscellaneous/dotfiles/waybar/style.css";
	 	target = "waybar/style.css";
	};
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "bottom";
				
				margin-top = 3;
				margin-bottom = 3;
				margin-left = 3;
				margin-right = 3;

				height = 35;
				spacing = 0;
				
				modules-left = [
					"hyprland/workspaces"
					"hyprland/window"
				];
				modules-center = [ ];
				modules-right = [
					"tray"
					"network"
					"pulseaudio"
				] ++ lib.optionals isLaptop [
					"backlight"
					"battery"
				] ++ [
					"clock"
				];
				
				"hyprland/window" = {
					tooltip = false;
					format = "{title}";
				};
				
				"hyprland/workspaces" = {
					format = "{icon}";
					on-click = "activate";
					format-icons = {
						"1" = "一";
						"2" = "二";
						"3" = "三";
						"4" = "四";
						"5" = "五";
						"6" = "六";
						"7" = "七";
						"8" = "八";
						"9" = "九";
						"10" = "十";
					};
					sort-by-number = true;
				};
				
				tray = {
					spacing = 17;
				};
				
				clock = {
					on-click = "swaync-client -t";
					format ="{0:%d}<span color='${waybarEtiquetteColor}'>日</span>{0:%m}<span color='${waybarEtiquetteColor}'>月</span>{0:%Y}<span color='${waybarEtiquetteColor}'>年</span> {0:%H}<span color='${waybarEtiquetteColor}'>時</span>{0:%M}<span color='${waybarEtiquetteColor}'>分</span>";# "{:%d日%m月%Y年 %H時%M分}";
					# format-alt = "{:%d日%m月%Y年}";
					tooltip = false;
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					calendar = {
						format = {
							today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
						};
					};
				};
			
				backlight = {
					format = "<span color='${waybarEtiquetteColor}'>輝度:</span>{percent}%";
					tooltip = false;
				};
				
				battery = {
					states = {
						warning = 30;
						critical = 15;
					};
					tooltip = false;
					format = "<span color='${waybarEtiquetteColor}'>電池:</span>{capacity}%";
					format-full = "<span color='${waybarEtiquetteColor}'>電池:</span>{capacity}%";
					format-charging = "<span color='${waybarEtiquetteColor}'>充電:</span>{capacity}%";
					format-plugged = "<span color='${waybarEtiquetteColor}'>有線:</span>{capacity}%";
				};
				
				"battery#bat2" = {
					bat = "BAT2";
				};
				
				network = {
					format-wifi = "<span color='${waybarEtiquetteColor}'>接続:</span>{essid}";
					format-ethernet = "<span color='${waybarEtiquetteColor}'>イーサネット:</span>{ipaddr}/{cidr}";
					format-linked = "<span color='${waybarEtiquetteColor}'>リンク</span>";
					format-disabled = "<span color='${waybarEtiquetteColor}'>ブロック</span>";
					format-disconnected = "<span color='${waybarEtiquetteColor}'>オフライン</span>";
					format-alt = "<span color='${waybarEtiquetteColor}'>接続:</span>{ipaddr}";
					tooltip = false;
					on-click-right = "alacritty --class WaybarSpawned -e nmtui";
				};
				
				pulseaudio = {
					format = "<span color='${waybarEtiquetteColor}'>音量:</span>{volume}%";
					format-bluetooth = "<span color='${waybarEtiquetteColor}'>無線:</span>{volume}%";
					tooltip = false;
					on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
					on-click-right = "alacritty --class WaybarSpawned -e wiremix";
				};
			};
		};
	};

	# gtk theme
	gtk = {
		enable = true;
		colorScheme = "dark";
		theme = {
			name = "Nightfox-Grey-Dark-Compact-Carbonfox";
			package = pkgs.nightfox-gtk-theme.override {
				themeVariants = [ "grey" ];
				colorVariants = [ "dark" ];
				sizeVariants = [ "compact" ];
				tweakVariants = [ "carbonfox" "black" "macos" ];
			};
		};
		iconTheme = {
			name = "WhiteSur-dark";
			package = pkgs.whitesur-icon-theme;
		};
		gtk3.bookmarks = [
			"file://${config.home.homeDirectory}/Downloads"
			"file://${config.home.homeDirectory}/Desktop"
			"file://${config.home.homeDirectory}/Documents"
			"file://${config.home.homeDirectory}/Code"
			"file://${config.home.homeDirectory}/Videos"
			"file://${config.home.homeDirectory}/Pictures"
			"file://${config.home.homeDirectory}/Music"
			"file://${config.home.homeDirectory}/Vault"
			"file://${config.home.homeDirectory}/nishi-nixos-config"
		];
	};
		
	dconf.settings = {
		"org/gnome/nautilus/preferences" = {
			default-folder-viewer = "icon-view";
			show-image-thumbnails = "always";
			thumbnail-limit = lib.gvariant.mkUint64 100;
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
