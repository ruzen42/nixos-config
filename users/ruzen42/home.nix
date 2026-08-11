{ inputs, pkgs, ...}:
let 
  devDeps = with pkgs; [
    #jetbrains-toolbox
    #dotnetCorePackages.dotnet_10.sdk
    #godot-mono
    #flutter
    android-tools
  ];
in
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  imports = [ 
    ./niri
    ./nvim
    ./fonts
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  home.packages = with pkgs; [
    inputs.mclauncher.packages."x86_64-linux".default
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    nerd-fonts.jetbrains-mono
    libnotify
    ibm-plex
    vesktop
    nerd-fonts.jetbrains-mono
    libnotify
    ibm-plex
    vesktop
    niri
    tmux
    swaybg
    fuzzel
    alacritty
    ungoogled-chromium
    #telegram-desktop
    ayugram-desktop
    font-awesome
    thunar
    thunar-volman
    fastfetch
    xwayland-satellite
    mpv
    mako 
    #thunderbird
    qpwgraph
    ardour
    guitarix
    quickshell
    osu-lazer-bin
  ] ++ devDeps;

  programs.git.settings = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };
  
  programs.quickshell.enable = true;

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
  xdg.configFile."mako/config".source = ./mako/config;

  home.stateVersion = "26.05";
}
