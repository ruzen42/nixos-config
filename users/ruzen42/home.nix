{ config, pkgs, ...}:
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  home.packages = with pkgs; [
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

  xdg.configFile."niri/config.kdl".text = ''
    spawn-at-startup "swaybg" "-i" "/etc/nixos/background.jpg" "-m" "fill"
    spawn-at-startup "waybar" 
    
    input {
      keyboard {
        xkb {
          layout "us,ru"
          variant "dvorak,"
          options "grp:caps_toggle"
        }
      }
    }

    binds {
      "Mod+Shift+T" { spawn "alacritty"; }
      "Mod+Shift+C" { close-window; }

      "Mod+R" { spawn "wofi" "--show" "drun"; }
      "Mod+Left" { focus-column-left; }
      "Mod+Right" { focus-column-right; }

      "Mod+Shift+Right" { move-column-right; }
      "Mod+Shift+Left" { move-column-left; }
      
      "Mod+L"   { focus-workspace-up;   }
      "Mod+D"   { focus-workspace-down; }
      "Mod+Shift+E" { quit; }

    }

    layout {
      gaps 8
      center-focused-column "never"
      default-column-width { proportion 0.5; }

      focus-ring {
        width 2 
        active-color "#A7C080"
        inactive-color "#7A8478"
      }
    }


  '';

  xdg.configFile."waybar/style.css".text = ''
    * {
      font-family: "Terminus";
      font-size: 13px;
      border: none;
      border-radius: 0;
    }
    
    window#waybar { 
      background-color: rgba(30, 30, 46, 0.9);
      color: #A7C080
      border-bottom: 2px solid #1E2326
    }

    #workspaces button {
      padding: 0 5px;
      color: #6c7086;
    }

    
  '';

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
}
