{ config, pkgs, user, ... }:
let
	all_hosts = [ "nishi-desktop" "nishi-laptop" ];
in
{
	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		user = user;
		group = "users";
		dataDir = "/home/${user}";
		configDir = "/home/${user}/.config/syncthing";
		settings = {
			gui = {
				user = user;
				theme = "black";
			};
			devices = {
				"nishi-laptop" = { id = "DS5CAWF-LBJV4IG-LUYX4RY-GTST3NT-ZBANZOR-6WPEWCB-YIX2EOS-R6JLKQY"; };
				"nishi-desktop" = { id = "5NLDEEF-5M4YY3D-IXQGK5P-QIMPYLN-A44TCEU-57BTIVS-6UCN63T-W32YXQB"; };
				"graphene-phone" = { id = "YEOR3EY-7X3E36O-JRHRTWK-I4OYLUW-6MB3D2A-I45LM6S-7KEEGX4-KQIQFQS"; };
			};
			folders = {
				"Documents" = {
					path = "/home/${user}/Documents";
					devices = all_hosts;
			  	};
				"Pictures" = {
					path = "/home/${user}/Pictures";
					devices = all_hosts;
				};
				"Music" = {
					path = "/home/${user}/Music";
					devices = all_hosts;
				};
				"Vault" = {
					path = "/home/${user}/Vault";
					devices =all_hosts ++ [ "graphene-phone" ];
				};
				"Code" = {
					path = "/home/${user}/Code";
					devices =all_hosts;
				};
				"Desktop" = {
					path = "/home/${user}/Desktop";
					devices =all_hosts;
				};

			};
		};
	};
}
