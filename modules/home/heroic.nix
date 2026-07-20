{ config, pkgs, inputs,... }:
{
	# packages
	home.packages = with pkgs; [
		heroic
	];
}
