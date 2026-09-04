{ config, pkgs, user, ... }:

{
	# home manager (self-management)
	programs.home-manager.enable = true;

	# allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# other home manager infos
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "26.05";
}
