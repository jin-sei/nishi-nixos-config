{ config, pkgs, ... }:
let
	all_hosts = [ "nishi-desktop" ]; #  "nishi-laptop" ];
in
{
	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		user = "jinsei";
		group = "users";
		dataDir = "/home/jinsei";
		configDir = "/home/jinsei/.config/syncthing";
		settings = {
			gui = {
				user = "jinsei";
				theme = "black";
			};
			devices = {
				# "nishi-laptop" = { id = "DEVICE-ID-GOES-HERE"; };
				"nishi-desktop" = { id = "5NLDEEF-5M4YY3D-IXQGK5P-QIMPYLN-A44TCEU-57BTIVS-6UCN63T-W32YXQB"; };
				# "graphene-phone" = { id = "DEVICE-ID-GOES-HERE"; };
			};
			folders = {
				"Documents" = {
					path = "/home/jinsei/Documents";
					devices = all_hosts;
			  	};
				"Pictures" = {
					path = "/home/jinsei/Pictures";
					devices = all_hosts;
				};
				"Music" = {
					path = "/home/jinsei/Music";
					devices = all_hosts;
				};
				"Vault" = {
					path = "/home/jinsei/Vault";
					devices =all_hosts; # all_hosts ++ [ "graphene-phone" ];
				};
				"Code" = {
					path = "/home/jinsei/Code";
					devices =all_hosts;
				};
				"Desktop" = {
					path = "/home/jinsei/Desktop";
					devices =all_hosts;
				};
				"Videoclub" = {
					path = "/home/jinsei/Videos/Videoclub";
					devices =all_hosts;
				};

			};
		};
	};
}
