{ pkgs, ... }: 
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; 
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true; 
  };

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "ruzen42";
    };
    defaultSession = "gamescope";
  };

  system.nixos.label = "SteamOS-Mode";

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "dvorak";
    options = "grp:caps_toggle";
  };

  services.seatd.enable = true;
}
