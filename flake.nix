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
			# VIRT MANAGER MACHINE
			nishi-virtual = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./common/system/base.nix
					./hosts/virtual/default.nix
					./hosts/virtual/hardware-configuration.nix
				];
			};
			# DESKTOP	
			nishi-desktop = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./common/system/base.nix
					./common/system/nvidia.nix
					./hosts/desktop/default.nix
					./hosts/desktop/hardware-configuration.nix
				];
			};

		};
		
		homeConfigurations = {
			"jinsei" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
				modules = [
					./common/home/home.nix
					./modules/home/zen-browser.nix
					# ajouter des fichiers de config home-manager spécifiques à chaque host: 
					# ./hosts/desktop/home-desktop.nix
				];
			};
		};
	};
}
