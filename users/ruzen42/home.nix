{ inputs, pkgs, ...}:
let 
  devDeps = with pkgs; [
    python314
    jdk25
    zed-editor
    jetbrains-toolbox
    dotnetCorePackages.dotnet_10.sdk
    flutter
  ];
in
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
    vesktop
    niri
    swaybg
    fuzzel
    alacritty
    ungoogled-chromium
    #telegram-desktop
    ayugram-desktop
    font-awesome
    thunar
    fastfetch
    xwayland-satellite
    mpv
    mako 
    #thunderbird
    qpwgraph
    #ardour
    guitarix
    quickshell
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
