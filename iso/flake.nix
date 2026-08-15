{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.customIso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./iso.nix
      ];
    };
  };
}
