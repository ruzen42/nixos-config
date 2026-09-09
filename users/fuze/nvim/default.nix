{ inputs, pkgs, ... }: 
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins 
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.pkgs = pkgs;
  };
}
