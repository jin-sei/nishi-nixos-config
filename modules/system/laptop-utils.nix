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
}
