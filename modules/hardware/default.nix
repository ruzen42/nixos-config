{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true; 
    efi.canTouchEfiVariables = true;
  };

  boot.zfs.extraPools = [ "storage" ];
  networking.hostId = "8425e349";
  boot.zfs.forceImportRoot = false;

  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.kernelParams = [ 
    "threadirqs"
    "preempt=full"            
    "amd_pstate=passive"       
    "usbcore.autosuspend=-1"    
    "zfs.zfs_arc_max=1610612736"
    "zfs.zfs_arc_min=536870912"
  ];

  zramSwap.enable = true;
  zramSwap.memoryPercent = 75;
}
