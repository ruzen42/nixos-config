{ config, ...}:
{
  boot.loader.grub = {
    enable = false;
    zfsSupport = false;
    efiSupport = false;
  };

  boot.loader = {
    systemd-boot.enable = true; 
    efi.canTouchEfiVariables = true;
  };

  boot.zfs.extraPools = [ "storage" ];
  networking.hostId = "8425e349";
  boot.zfs.forceImportRoot = false;
}
