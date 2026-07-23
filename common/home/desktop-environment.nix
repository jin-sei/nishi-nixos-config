{ config, lib, pkgs, inputs, isLaptop ? false, ... }:

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
				height = 30;
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
					format = "{initialTitle}";
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
					on-click-right = "swaync-client -t";
					format = "{:%H時%M分}";
					format-alt = "{:%d日%m月%Y年}";
					tooltip = false;
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					calendar = {
						format = {
							today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
						};
					};
				};
			
				backlight = {
					format = "輝度:{percent}%";
					tooltip = false;
				};
				
				battery = {
					states = {
						warning = 30;
						critical = 15;
					};
					tooltip = false;
					format = "電池:{capacity}%";
					format-full = "電池:{capacity}%";
					format-charging = "電池(充電):{capacity}%";
					format-plugged = "電池(有線):{capacity}%";
				};
				
				"battery#bat2" = {
					bat = "BAT2";
				};
				
				network = {
					format-wifi = "ワイファイ:{ipaddr}/{cidr}";
					format-ethernet = "イーサネット:{ipaddr}/{cidr}";
					format-linked = "リンク";
					format-disabled = "ブロック";
					format-disconnected = "オフライン";
					format-alt = "{ifname}:{ipaddr}/{cidr}";
					tooltip = false;
					on-click-right = "alacritty -e nmtui";
				};
				
				pulseaudio = {
					format = "音量:{volume}%";
					tooltip = false;
					on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
					on-click-right = "alacritty -e wiremix";
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
