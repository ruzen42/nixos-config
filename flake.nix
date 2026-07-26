{
  description = "ruzen42 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake.url = "github:sodiboo/niri-flake";
    musnix.url = "github:musnix/musnix";
    mclauncher = {
      url = "github:ElyPrismLauncher/Launcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url   = "github:nix-community/nixvim"; 
    wall-set.url = "github:ruzen42/wall-set";
    chaotic.url = "github:chaotic-cx/nyx";
  };

  outputs = { self, nixpkgs, home-manager, wall-set, chaotic, musnix, mclauncher, nixvim, ... }@inputs: {
    nixosConfigurations = {
      ruzenhome = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/ruzenhome
          chaotic.nixosModules.default 
          inputs.musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	          home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.ruzen42 = import ./users/ruzen42/home.nix;
          }
        ];
      };

      ruzengame = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/ruzenhome/hardware.nix
          ./modules/hardware/default.nix
          ./modules/games
          ./modules/games/scope.nix
          ./modules/core/services.nix
          ./modules/core
          ./users/ruzen42
        ];
      };
    };
  };
}
