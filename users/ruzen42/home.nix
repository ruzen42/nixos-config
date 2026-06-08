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
    inputs.niri-flake.homeModules.niri 
  ];

  home.packages = with pkgs; [
    quickshell
    nerd-fonts.jetbrains-mono
    niri
    waybar
    wofi
    swaybg
    alacritty
    firefox
    discord
    telegram-desktop
    unityhub
    zsh
    font-awesome
    thunar
    fastfetch
  ];

  programs.git.settings = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };

  home.stateVersion = "26.05";

  programs.niri.settings = {
  spawn-at-startup = [
    { command = [ "swaybg" "-i" "/etc/nixos/background.png" "-m" "fill" ]; }
    { command = [ "waybar" ]; }
  ];


  input = {
    keyboard = {
      xkb = {
        layout = "us,ru";
        variant = "dvorak,";
        options = "grp:caps_toggle";
      };
    };
  };

  binds = {
    "Mod+Shift+T".action.spawn = [ "alacritty" ];
    "Mod+Shift+C".action.close-window = [];

    "Mod+R".action.spawn = [ "wofi" "--show" "drun" ];
    "Mod+Left".action.focus-column-left = [];
    "Mod+Right".action.focus-column-right = [];

    "Mod+Shift+Right".action.move-column-right = [];
    "Mod+Shift+Left".action.move-column-left = [];
    
    "Mod+L".action.focus-workspace-up = [];
    "Mod+D".action.focus-workspace-down = [];
    "Mod+Shift+E".action.quit = [];
    "Mod".action.open-overview = [];
  };

  layout = {
    gaps = 8;
    center-focused-column = "never";
    default-column-width = { proportion = 0.5; };

    tab-indicator = {
      enable = true;
      corner-radius = 8;
    };

    focus-ring = {
      width = 2;
      active.color = "#A7C080";
      inactive.color = "#7A8478";
    };
  };
  };

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
