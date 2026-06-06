{ config, pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "dvorak";
    options = "grp:caps_toggle";
  };
  
  console.useXkbConfig = true;

  programs.niri.enable = true;
}
