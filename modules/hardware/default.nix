{ pkgs, ... }:
{
  boot.loader = {
    limine.enable = true; 
    efi.canTouchEfiVariables = true;
  };

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
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Input = {
        ClassicBoundedOnly = false;
        UserspaceHID = false;
      };
    };
  };
}
