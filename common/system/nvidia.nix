{ config, pkgs, ... }:
{
	# Enable OpenGL
	hardware.graphics = {
		enable = true;
	};
	
	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = ["nvidia"];
	
	hardware.nvidia = {
	
		# Modesetting is required.
		modesetting.enable = true;
		
		# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
		powerManagement.enable = false;
		
		# Fine-grained power management. Turns off GPU when not in use.
		powerManagement.finegrained = false;
		
		# Use the NVidia open source kernel module (not to be confused with nouveau)
		open = true;
		
		# Enable the Nvidia settings menu, accessible via `nvidia-settings`.
		nvidiaSettings = true;
		
		# Specify package 
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
  
}
