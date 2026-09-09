{ pkgs, modulesPath, lib, ... }: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  boot.supportedFilesystems = [ "vfat" "zfs" ];
  nixpkgs.config.allowUnfree = true;

  documentation.enable = false;
  documentation.nixos.enable = false;

  isoImage.squashfsCompression = "xz -Xbcj x86 -b 1M";
  networking.networkmanager.enable = lib.mkDefault false;
  
  environment.defaultPackages = [];

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget2
  ];
}
