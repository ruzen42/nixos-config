{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
  

  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
  };

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  powerManagement.cpuFreqGovernor = "performance";

  boot.zfs.extraPools = [ "storage" ];
  networking.hostId = "8425e349";
  boot.zfs.forceImportRoot = false;

  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.kernelParams = [ 
    "threadirqs"
    "preempt=full"            
    "amd_pstate=active"       
    "split_lock_detect=off"
    "usbcore.autosuspend=-1"    
    "zfs.zfs_arc_max=1610612736"
    "zfs.zfs_arc_min=536870912"
  ];

  zramSwap.enable = true;
  zramSwap.memoryPercent = 75;

}
