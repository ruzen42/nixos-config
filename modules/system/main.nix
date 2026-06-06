{ config, lib, pkgs, ... }:

{
  networking.hostName = "ruzenhome"; 

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Almaty";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };


  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.ruzen42 = {
  	isNormalUser = true;
  	extraGroups = [ "docker" "wheel" "nixbld" ]; 
      packages = with pkgs; [
	neovim
	niri
      ];
   };

  programs.firefox.enable = true;
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
      vim 
      wget2
   ];

  services.openssh.enable = true;

  system.copySystemConfiguration = true;

  boot.loader.grub = {
      enable = true;
      zfsSupport = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      mirroredBoots = [
	{ devices = [ "nodev" ]; path = "/boot"; }
      ];
  };

  boot.zfs.extraPools = [ "storage" ];
 
  networking.hostId = "8425e349";

  boot.zfs.forceImportRoot = false;

}



