{ config, pkgs, inputs,... }:
{
	# packages
	home.packages = with pkgs; [
		krita
		inkscape
		# pureref
	];
}
