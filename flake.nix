{
	description = "Nishi: NixOS config";
	
	inputs = {
		nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  		zen-browser = {
    			url = "github:0xc000022070/zen-browser-flake";
    			inputs = {
      				nixpkgs.follows = "nixpkgs_unstable";
      				home-manager.follows = "home-manager";
    			};
  		};
	};
	
	outputs = {self, nixpkgs, nixpkgs_unstable, home-manager, ...}@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations = {
			# DESKTOP	
			nishi-desktop = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./common/system/base.nix
					./common/system/nvidia.nix
					./hosts/desktop/default.nix
					./hosts/desktop/hardware-configuration.nix
					./modules/system/steam.nix
					./modules/system/syncthing.nix
				];
			};
			# LAPTOP
			nishi-laptop = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./common/system/base.nix
					./common/system/nvidia.nix
					./modules/system/nvidia-prime.nix
					./hosts/laptop/default.nix
					./hosts/laptop/hardware-configuration.nix
					./modules/system/syncthing.nix
				];
			};
		};
		
		homeConfigurations = {
			"jinsei" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {inherit inputs;};
				modules = [
					./common/home/home.nix
					./common/home/shell.nix
					./common/home/desktop-environment.nix
					./common/home/apps.nix
					./modules/home/zen-browser.nix
					./modules/home/art-stuff.nix
					./modules/home/heroic.nix
				];
			};
		};
	};
}
