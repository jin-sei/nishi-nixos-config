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

  outputs = {self, nixpkgs, nixpkgs_unstable, ...}@inputs: 
  {
    nixosConfigurations.nishi = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
	./hardware-configuration.nix
      	inputs.home-manager.nixosModules.default
      ];
    };
  };
}
