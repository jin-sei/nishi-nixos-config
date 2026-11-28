{ config, pkgs, ... }:
{
	services.actual = {
		enable = true;
		settings = {
			port = 5006;
			hostname = "127.0.0.1";
		};
	};
}
