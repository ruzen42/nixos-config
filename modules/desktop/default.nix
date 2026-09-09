{ ... }:
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
    };
    autoLogin = {
      enable = true;
      user = "ruzen42";
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
  
  programs.gamemode.enable = true;
}
