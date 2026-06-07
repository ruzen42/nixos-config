{ config, pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "dvorak";
    options = "grp:caps_toggle";
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

  environment.sessionVariables = let
    makePluginPath = format:
      (pkgs.lib.makeSearchPath format [
        "$HOME/.nix-profile/lib"
        "/run/current-system/sw/lib"
        "/etc/profiles/per-user/$USER/lib"
      ]) + ":$HOME/.${format}";
  in {
    LV2_PATH = makePluginPath "lv2";
    VST3_PATH = makePluginPath "vst3";
    CLAP_PATH = makePluginPath "clap";  
  };
}
