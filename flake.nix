{
	description = "Nishi: NixOS config";
	
	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager-unstable = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
  		zen-browser = {
    			url = "github:0xc000022070/zen-browser-flake";
    			inputs = {
      				nixpkgs.follows = "nixpkgs-unstable";
      				home-manager.follows = "home-manager-unstable";
    			};
  		};
		areofyl-fetch = {
			url = "github:areofyl/fetch";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
	};
	
	outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, ...}@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

		# MY USERNAMES
		personal-user-01 = "jinsei";
		work-user-01	 = "nils";
	in
	{
		nixosConfigurations = {
			# DESKTOP	
			nishi-desktop = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs; 
					user = personal-user-01;
				};
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
				specialArgs = {
					inherit inputs;
					user = personal-user-01;
				};
				modules = [
					./common/system/base.nix
					./common/system/nvidia.nix
					./modules/system/nvidia-prime.nix
					./modules/system/syncthing.nix
					./modules/system/laptop-utils.nix
					./hosts/laptop/default.nix
					./hosts/laptop/hardware-configuration.nix
				];
			};
		};
		
		homeConfigurations = {
			"${personal-user-01}@nishi-desktop" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit inputs;
					user = personal-user-01;
					isLaptop = false;
				};
				modules = [
					./common/home/home-manager.nix
					./common/home/anki.nix
					./common/home/shell.nix
					./common/home/neovim.nix
					./common/home/desktop-environment.nix
					./common/home/apps.nix
					./modules/home/zen-browser.nix
					./modules/home/art-stuff.nix
					./modules/home/heroic.nix
				];
			};
			"${personal-user-01}@nishi-laptop" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit inputs;
					user = personal-user-01; 
					isLaptop = true;
				};
				modules = [
					./common/home/home-manager.nix
					./common/home/anki.nix
					./common/home/shell.nix
					./common/home/neovim.nix
					./common/home/desktop-environment.nix
					./common/home/apps.nix
					./modules/home/zen-browser.nix
					# ./modules/home/art-stuff.nix
					# ./modules/home/heroic.nix
				];
			};
			"${work-user-01}@vpi" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {
					inherit pkgs-unstable;
					inherit inputs;
					user = work-user-01; 
				};
				modules = [
					./common/home/home-manager.nix
					./common/home/shell.nix
					./common/home/neovim.nix
				];
			};
		};
	};
}
