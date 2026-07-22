{ config, pkgs, inputs, ... }:

{
	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	# Use latest kernel.
	# boot.kernelPackages = pkgs.linuxPackages_latest;
	
	boot.initrd.luks.devices."luks-b1875c1b-14a3-49f3-8251-432758c05041".device = "/dev/disk/by-uuid/b1875c1b-14a3-49f3-8251-432758c05041";
	networking.hostName = "nishi-laptop";
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	
	  # This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "26.05"; # Did you read the comment?
}
