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
    font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free";
    font-size: 13px;
    border: none;
    border-radius: 0;
  }

  window#waybar {
    background-color: rgba(30, 30, 46, 0.9);
    color: #cdd6f4;
    border-bottom: 2px solid #313244;
  }

  #workspaces button {
    padding: 0 5px;
    color: #6c7086;
  }

  #workspaces button.focused {
    color: #7fc8ff;
    border-bottom: 2px solid #7fc8ff;
  }

  #workspaces button.active {
    color: #7fc8ff;
  }

  #clock, #cpu, #memory, #network, #pulseaudio, #tray {
    padding: 0 10px;
    margin: 4px 2px;
    background-color: #313244;
    border-radius: 6px;
  }

  #clock {
    background-color: transparent;
    font-weight: bold;
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

  xdg.configFile."waybar/config".text = ''
    {
    "layer": "top",
    "position": "top",
    "exclusive": false,
    "spacing": 0,
    "height": 26,
    "start_hidden": true,

    "modules-left": ["clock"],
    "modules-center": ["niri/workspaces"],
    "modules-right": ["tray", "network", "pulseaudio", "battery"],

    "niri/workspaces": {
        "all-outputs": true,
        "format": "{name}"
    },

    "clock": {
        "format": "{:%A %I:%M %p}",
        "format-alt": "{:%d %B W%V %Y}",
        "tooltip": false
    },

    "network": {
        "format-icons": ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"],
        "format": "{icon}",
        "format-wifi": "{icon}",
        "format-ethernet": "󰀂",
        "format-disconnected": "󰖪",
        "tooltip-format-wifi": "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}",
        "tooltip-format-ethernet": "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}",
        "tooltip-format-disconnected": "Disconnected",
        "interval": 3,
        "nospacing": 1
    },

    "battery": {
        "interval": 5,
        "format": "{icon}",
        "format-discharging": "{icon}",
        "format-charging": "{icon}",
        "format-plugged": "󰚥",
        "format-full": "󰁹",
        "format-icons": {
            "charging": ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"],
            "default": ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
        },
        "tooltip-format-discharging": "{power:>1.0f}W↓ {capacity}%",
        "tooltip-format-charging": "{power:>1.0f}W↑ {capacity}%",
        "tooltip-format-plugged": "{capacity}%",
        "tooltip-format-full": "{capacity}%",
        "states": {
            "warning": 20,
            "critical": 10
        }
    },

    "pulseaudio": {
        "format": "",
        "format-muted": "󰝟",
        "scroll-step": 5,
        "on-click": "pavucontrol",
        "tooltip-format": "Playing at {volume}%"
    },

    "tray": {
        "spacing": 13
    }
}

  '';
}
