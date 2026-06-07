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
    ./kitty.nix
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
    { command = [ "quickshell" ]; } 
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
  };

  layout = {
    gaps = 8;
    center-focused-column = "never";
    default-column-width = { proportion = 0.5; };

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

  xdg.configFile."quickshell/shell.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Wayland

    ShellRoot {
        VariantsWindow {
            // Привязка к панелям Wayland (работает в Niri)
            WlrLayerSurface {
                anchors.top: true
                anchors.left: true
                anchors.right: true
                exclusionMode: WlrLayerSurface.ExclusionMode.Exclusive
                layer: WlrLayerSurface.Layer.Top
                
                // Высота панели
                height: 32
            }

            Rectangle {
                anchors.fill: parent
                color: "${everforest.bg0}" // Цвет фона панели

                // Бордер снизу для акцента
                border.color: "${everforest.bg2}"
                border.width: 1

                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 15

                    Text {
                        text: "󰣇" // Иконка NixOS (нужен Nerd Font)
                        color: "${everforest.blue}"
                        font.pixelSize: 16
                    }
                    
                    Text {
                        text: "niri"
                        color: "${everforest.fg}"
                        font.bold: true
                    }
                }

                Text {
                    anchors.centerIn: parent
                    color: "${everforest.green}"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 14
                    
                    // Простейший таймер для обновления времени
                    text: new Date().toLocaleTimeString(Qt.locale(), "hh:mm")
                    Timer {
                        interval: 60000; running: true; repeat: true
                        onTriggered: parent.text = new Date().toLocaleTimeString(Qt.locale(), "hh:mm")
                    }
                }

                // Справа: Статус (Пример статического текста, можно расширить)
                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10

                    Text { text: "󰕾 80%"; color: "${everforest.orange}" }
                    Text { text: "󰂄 100%"; color: "${everforest.aqua}" }
                }
            }
        }
    }
'';

}
