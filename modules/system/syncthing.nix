{ config, pkgs, ... }:
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
				"arshi-laptop" = { id = "N5GQ422-KVEUTOM-ZZXBVYL-POG5IG7-7WOBWDO-SHU3GHX-ZE6QCTR-NVAHZQN"; }; # à supprimer
				# "nishi-laptop" = { id = "DEVICE-ID-GOES-HERE"; };
				# "graphene-phone" = { id = "DEVICE-ID-GOES-HERE"; };
			};
			folders = {
				"Documents" = {
					path = "/home/jinsei/Documents";
					devices = [ "arshi-laptop" ];
			  	};
				"Pictures" = {
					path = "/home/jinsei/Pictures";
					devices = [ "arshi-laptop" ];
				};
				"Music" = {
					path = "/home/jinsei/Music";
					devices = [ "arshi-laptop" ];
				};
				"Vault" = {
					path = "/home/jinsei/Vault";
					devices = [ "arshi-laptop" ];
				};
				"Code" = {
					path = "/home/jinsei/Code";
					devices = [ "arshi-laptop" ];
				};
				"Desktop" = {
					path = "/home/jinsei/Desktop";
					devices = [ "arshi-laptop" ];
				};
			};
		};
	};
}
