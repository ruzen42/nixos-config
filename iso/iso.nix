{ pkgs, modulesPath, lib, ... }: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.supportedFilesystems = [ "btrfs" "vfat" "xfs" "zfs" ];
  nixpkgs.config.allowUnfree = true;

  isoImage.squashfsCompression = "zstd -Xcompression-level 19"; 
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];
}
