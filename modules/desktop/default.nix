{ config, pkgs, ... }:
let 
  sddm-everforest-theme = pkgs.stdenv.mkDerivation {
    name = "sddm-everforest-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "v1.2";
      sha256 = "C3qB9hFUeuT5+Dos2zFj5SyQegnghpoFV9wHvE9VoD8=";
    };
    
    installPhase = ''
      mkdir -p $out/share/sddm/themes/everforest
      cp -r * $out/share/sddm/themes/everforest
      
      cat <<EOF > $out/share/sddm/themes/everforest/theme.conf
      [General]
      Background="Background.jpg"
      ScaleImage=cropped
      ScreenWidth=1920
      ScreenHeight=1080
      ThemeColor="#2d353b"
      AccentColor="#a7c080"
      MainColor="#d3c6aa"
      Font="JetBrainsMono Nerd Font"
      FontSize=11
      EOF

    '';
  };
in
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
      theme = "everforest";
      autoLogin.user = "ruzen42";
      autoLogin.enable = true; 
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

  environment.systemPackages = [
    sddm-everforest-theme
  ];

  services.displayManager.sessionPackages = [ pkgs.niri ];

  musnix.enable = true;
  #musnix.kernel.realtime = true;

}
