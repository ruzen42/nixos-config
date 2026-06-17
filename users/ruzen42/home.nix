{ inputs, config, pkgs, ...}:
let 
  everforest = {
    bg_dim     = "#1e2326";
    bg0        = "#272e33";
    bg1        = "#2e383e";
    bg2        = "#374145";
    fg         = "#d3c6aa";
    red        = "#e67e80";
    orange     = "#e69875";
    yellow     = "#dbbc7f";
    green      = "#a7c080";
    blue       = "#7fbbb3";
    purple     = "#d699b6";
    aqua       = "#83c092";
    gray       = "#859289";
  };
in
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  imports = [ 
    ./niri
  ];

  home.packages = with pkgs; [
    inputs.mclauncher.packages."x86_64-linux".default
    nerd-fonts.jetbrains-mono
    niri
    swaybg
    alacritty
    discord
    telegram-desktop
    zsh
    font-awesome
    thunar
    fastfetch
    xwayland-satellite
    audacious
    thunderbird
    qpwgraph
    ardour
    guitarix
    walker
    elephant
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium; 

    extraOpts = {
      "BrowserSignin" = 0;                  
      "SyncDisabled" = true;               
      "PasswordManagerEnabled" = false;   
      "SafeBrowsingProtectionLevel" = 0;   
      "PrivacySandboxAdTopicsEnabled" = false; 
      "SearchSuggestEnabled" = false;       
      "MetricsReportingEnabled" = false;   
    };

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" 
    ];
  };

  programs.git.settings = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };

  home.stateVersion = "26.05";

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "display": {
    "separator": " ➜ ",
    "color": {
      "keys": "magenta",
      "title": "cyan"
    }
  },
  "modules": [
    {
      "type": "title",
      "format": "{user-name-colored}@{host-name-colored}"
    },
    {
      "type": "separator"
    },
    {
      "type": "os",
      "key": "OS",
      "keyColor": "magenta"
    },
    {
      "type": "kernel",
      "key": "Kernel",
      "keyColor": "magenta"
    },
    {
      "type": "wm",
      "key": "WM",
      "keyColor": "magenta"
    },
    {
      "type": "shell",
      "key": "Shell",
      "keyColor": "magenta"
    },
    {
      "type": "terminal",
      "key": "Terminal",
      "keyColor": "magenta"
    },
    {
      "type": "packages",
      "key": "Packages",
      "keyColor": "magenta"
    },
    {
      "type": "uptime",
      "key": "Uptime",
      "keyColor": "magenta"
    },
    {
      "type": "memory",
      "key": "Memory",
      "keyColor": "magenta"
    },
    {
      "type": "disk",
      "key": "Disk",
      "keyColor": "magenta"
    },
    {
      "type": "colors",
      "symbol": "circle"
    }
  ]
}
  '';

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
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };
  
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;

}
