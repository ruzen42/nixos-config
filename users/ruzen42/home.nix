{ config, pkgs, ...}:
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  home.packages = with pkgs; [
    niri
    waybar
    alacritty
    firefox
    discord
    telegram-desktop
    unityhub
  ];

  programs.git = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  }

  home.stateVersion = "26.05";
}
