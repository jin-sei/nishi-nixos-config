{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		brightnessctl
		mcontrolcenter # msi driver
	];
	
	# required for MSI control center
	boot.extraModulePackages = with config.boot.kernelPackages; [
		msi-ec
	];
	boot.kernelModules = [ "msi-ec" ];
	
	# bluetooth
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
		settings = {
			General = {
				Experimental = true;
				FastConnectable = false;
			};
			Policy = {
				AutoEnable = true;
			};
		};
	};
}
