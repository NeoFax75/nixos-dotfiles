{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
          # {
            #  home-manager.useGlobalPkgs = true;
            #  home-manager.useUserPackages = true;
            #  home-manager.users.neofax = import ./hosts/default/home.nix;
            #  home-manager.extraSpecialArgs = {inherit inputs self user;};
          # }
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
