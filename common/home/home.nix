{ config, pkgs, ... }:

{
	# packages
	home.packages = with pkgs; [
		hyprpolkitagent
		hyprlock
		hyprpaper
		waybar
		swaynotificationcenter

		hyprpicker
		hyprshot
		wl-clipboard
		gdu
		wiremix

		fortune
		cowsay
		
		neovim
		nautilus
		mpv
		zathura
		keepassxc

		ungoogled-chromium
		signal-desktop
		deezer-desktop
		filen-desktop
		discord
		
		(anki.withAddons [
    			ankiAddons.passfail2
			ankiAddons.anki-connect
  		])

		proton-vpn
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
