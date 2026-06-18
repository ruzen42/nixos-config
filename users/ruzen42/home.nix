{ inputs, pkgs, ...}:
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  imports = [ 
    ./niri
    ./nvim
  ];

  home.packages = with pkgs; [
    inputs.mclauncher.packages."x86_64-linux".default
    inputs.wall-set.packages."x86_64-linux".default
    nerd-fonts.jetbrains-mono
    niri
    swaybg
    fuzzel
    alacritty
    discord
    ungoogled-chromium
    github-cli
    telegram-desktop
    nushell
    font-awesome
    thunar
    fastfetch
    xwayland-satellite
    audacious
    thunderbird
    qpwgraph
    ardour
    guitarix
    quickshell
  ];

  programs.git.settings = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };

  gtk = {
    enable = true;
    
    theme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-gtk-theme;
    };

    iconTheme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-gtk-theme;
    };

    font = {
      name = "IBM Plex Mono";
      size = 11;
    };
  };
  
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel/fuzzel.ini;
  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
  xdg.configFile."fastfetch/config.jsonc".source = ./fastfetch/config.jsonc;
  xdg.configFile."quickshell/shell.qml".source = ./quickshell/shell.qml;

  home.stateVersion = "26.05";
}
