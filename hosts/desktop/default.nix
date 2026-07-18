{ config, pkgs, inputs, ... }:

{
	# Bootloader
  	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;
  	boot.initrd.luks.devices."luks-2ef9f8bc-c173-433f-ac87-74dd74155df1".device = "/dev/disk/by-uuid/2ef9f8bc-c173-433f-ac87-74dd74155df1";
	
	# network hostname
 	 networking.hostName = "nishi-desktop"; 

	 # This value determines the NixOS release from which the default
	 # settings for stateful data, like file locations and database versions
 	 # on your system were taken. It‘s perfectly fine and recommended to leave
 	 # this value at the release version of the first install of this system.
 	 # Before changing this value read the documentation for this option
 	 # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
 	 system.stateVersion = "25.11"; # Did you read the comment?
}
