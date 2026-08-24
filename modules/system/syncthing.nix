{ config, pkgs, ... }:
let
	all_hosts = [ "nishi-desktop" "nishi-laptop" ];
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
				"nishi-laptop" = { id = "DS5CAWF-LBJV4IG-LUYX4RY-GTST3NT-ZBANZOR-6WPEWCB-YIX2EOS-R6JLKQY"; };
				"nishi-desktop" = { id = "5NLDEEF-5M4YY3D-IXQGK5P-QIMPYLN-A44TCEU-57BTIVS-6UCN63T-W32YXQB"; };
				"graphene-phone" = { id = "YEOR3EY-7X3E36O-JRHRTWK-I4OYLUW-6MB3D2A-I45LM6S-7KEEGX4-KQIQFQS"; };
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
					devices =all_hosts ++ [ "graphene-phone" ];
				};
				"Code" = {
					path = "/home/jinsei/Code";
					devices =all_hosts;
				};
				"Desktop" = {
					path = "/home/jinsei/Desktop";
					devices =all_hosts;
				};

			};
		};
	};
}
