{ config, pkgs, ... }:

{
	# packages
	home.packages = with pkgs; [
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
  	];

	# nix helper (nh)
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 7d --keep 10";
		flake = "/home/jinsei/nishi-nixos-config"; # sets NH_OS_FLAKE variable for you
	};	
	
	# home manager (self-management)
	programs.home-manager.enable = true;

	# enable autostarts 
	xdg.autostart.enable = true;
	
	
	# allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# other home manager infos
	home.username = "jinsei";
	home.homeDirectory = "/home/jinsei";
	home.stateVersion = "26.05";
}
