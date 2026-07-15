{
	description = "NISHI: NixOS config";
	
	inputs = {
		nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = {self, nixpkgs, nixpkgs_unstable, home-manager, ...}@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations = {
			nishi-virtual = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./common/base.nix
					./hosts/virtual/default.nix
					./hosts/virtual/hardware-configuration.nix
				];
			};
		};
		
		homeConfigurations = {
			"jinsei@nishi-virtual" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
				modules = [
					./common/home.nix
					# ajouter des fichiers de config home-manager spécifiques à chaque host: 
					# ./hosts/desktop/home-desktop.nix
				];
			};
		};
	};
}
