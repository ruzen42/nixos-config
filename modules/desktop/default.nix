{ pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "dvorak";
    options = "grp:caps_toggle";
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sugar-dark";
    };
    defaultSession = "niri";
  };
  
  console.useXkbConfig = true;

  programs.niri.enable = true;

  security.rtkit.enable = true;

  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "95"; }
  ];
  
  boot.kernelPackages = pkgs.linuxPackages_zen; 
  boot.kernelParams = [ 
    "threadirqs"
    "preempt=full"            
    "amd_pstate=passive"       
    "usbcore.autosuspend=-1"    
  ];

  powerManagement.cpuFreqGovernor = "performance";
  
  programs.gamemode.enable = true;


}
