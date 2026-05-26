{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
	position = "top";
        height = 32;
        spacing = 0;

        "modules-left" = [
          "custom/menu"
          "custom/separator"
          "hyprland/workspaces"
          "custom/separator"
          "hyprland/language"
          "idle_inhibitor"
          "custom/updates"
          "custom/separator"
          "hyprland/window"
        ];

        "modules-center" = [];

        "modules-right" = [
          "group/tray-expander"
          "custom/separator"
          "pulseaudio"
          "backlight"
          "custom/separator"
          "network"
          "battery"
          "power-profiles-daemon"
          "custom/separator"
          "clock"
          "custom/notification"
          "custom/separator"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          disable-scroll = false;
          format = "{icon}";
          format-icons = {
            empty = "";
            active = "󰮯";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "US";
          format-es = "LA";
        };

        "hyprland/window" = {
          format = " {title}";
          max-length = 40;
          separate-outputs = false;
          rewrite = {
             "(.*) " = " ";
             "(.*)Mozilla Firefox" = " Firefox";
             "(.*) ~(.*)" = "󰆍 Kitty";
             "(.*) - Nvim" = " Neovim";
             "(.*)Discord" = "󰙯 Discord";
	  };
          tooltip = false;
        };

        "custom/notification" = { #TODO set up notifications
          tooltip = false;
          format = "{icon} ";
          format-icons = {
            notification = "";
            none = "";
            dnd-notification = "";
            dnd-none = "";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          escape = true;
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
        };

        idle_inhibitor = {
          format = "{icon} ";
          signal = 10;
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "group/tray-expander" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "tray-group-item";
          };
          modules = [
            "custom/expand-icon"
            "custom/bluetooth"
            "custom/screenshot"
            "tray"
          ];
        };

        "custom/expand-icon" = {
          format = " ";
          tooltip = false;
        };

        tray = {
          icon-size = 16;
          spacing = 13;
        };

        clock = {
          format = "{:%b %d  %I:%M %p}";
	  tooltip-format = "<tt><small>{calendar}</small></tt>";
	  calendar = {
            mode = "month";
	    on-scroll = 1;
	    format = with config.lib.stylix.colors.withHashtag; {
              months   = "<span color='${base0A}'><b>{}</b></span>";
              days     = "<span color='${base05}'>{}</span>";
              weekdays = "<span color='${base0D}'><b>{}</b></span>";
              today    = "<span color='${base08}'><b><u>{}</u></b></span>";
            };
	  };
        };

        backlight = {
          format = " {percent}%";
          #on-click = "alacritty --class float -e nvim ~/.config/hypr/settings/monitors.conf"; TODO
          scroll-step = 5;
          tooltip = false;
        };

        battery = {
          states = {
            warning = 12;
            critical = 6;
          };
          format = "{icon}";
          format-charging = " {icon}";
          format-plugged = " {icon}";
          format-icons = [
            "󰂎" "󰁺" "󰁻" "󰁼" "󰁽"
            "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
          ];
          interval = 3;
          #on-click-right = "alacritty --class float -e sudo nano /sys/class/power_supply/BAT*/charge_control_end_threshold";
          tooltip-format = "Battery: {capacity}%";
        };

        power-profiles-daemon = { #TODO
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "󰓅";
            performance = "󰓅";
            balanced = "󰾅";
            power-saver = "󰾆";
          };
        };

        "custom/updates" = {
          format = "󰒙 {}";
          return-type = "json";
          format-icons = {
            has-updates = "󱍷";
            updated = "󰂪";
          };
          #on-click = "alacritty --class float -e bash ~/.config/hypr/scripts/update_system.sh"; TODO
          exec-if = "which waybar-module-pacman-updates";
          exec = "waybar-module-pacman-updates --interval-seconds 5 --network-interval-seconds 300";
        };

        network = {
          format = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = " {ifname} via {gwaddr}"; #TODO check icons
          format-linked = " {ifname} (No IP)";
          format-disconnected = "󰤮 ";
          tooltip = false;
          #on-click = "alacritty --class float -e nmtui"; TODO
          format-icons = [
            "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "
          ];
        };

        pulseaudio = {
          scroll-step = 5;
          format = " {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-bluetooth-muted = "󰂰 0%";
          format-muted = " 0%";
          format-source = " {volume}%";
          format-source-muted = " ";
          # on-click = "pamixer --toggle-mute"; TODO
          # on-click-right = "pavucontrol"; TODO
          tooltip-format = "{volume}%";
          tooltip = false;
        };

        "custom/bluetooth" = {
          format = "";
          #on-click = "alacritty --class float -e bluetuith"; TODO
          tooltip = false;
        };

        "custom/screenshot" = {
          format = "󰆐";
          #on-click = "bash ~/.config/hypr/scripts/cropscreenshot.sh"; TODO
          tooltip = false;
        };

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        cpu = {
          format = "  {usage}%";
          #on-click = "alacritty -e btop";
          tooltip = false;
        };

        memory = {
          format = "  {}%";
          #on-click = "alacritty -e btop";
        };

        "custom/menu" = {
          format = "";
          #on-click = "alacritty --class float -e nvim ~/.config/hypr/settings/keybindings.conf";
          tooltip = false;
        };

        "custom/power" = {
          format = " ";
          #on-click = "wlogout"; TODO replace with my own lock or log out
          tooltip = false;
        };
      };
    };

    style = 
    let
    font = config.stylix.fonts.monospace.name;
    in
    ''
* {
  font-size: inherit;
  font-family: inherit;
  font-weight: inherit;
}

button {
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
  border: 0;
}

window#waybar {
  background-color: transparent;
  transition-property: background-color;
  transition-duration: .5s;
  margin: 0;
  padding: 0;
}

window#waybar>box {
  margin: 0px;
  margin-bottom: 0px;
  border-radius: 0px;
  padding: 0px 0px;
  opacity: 1;
  background: Black;
  border: none;
}

/* Modules styling */
#custom-menu,
#custom-separator,
#workspaces,
#language,
#idle_inhibitor,
#custom-updates,
#window,
#group-tray-expander,
#custom-expand-icon,
#pulseaudio,
#backlight,
#network,
#power-profiles-daemon,
#battery,
#clock,
#custom-notification,
#custom-bluetooth,
#custom-screenshot,
#custom-power {
  margin: 0px 1px;
  padding: 0px 5px;
  font-size: 15px;
  font-family: '${font}', sans-serif;
  font-weight: 400;
  border-radius: 0px;
  border: none;
  background: transparent;
  opacity: 1;
  color: white;
}

#custom-separator {
  opacity: .15;
  font-size: .9rem;
  margin: 0px;
  padding: 0px 4px;
}

/* Tray modules */
#custom-bluetooth,
#custom-screenshot,
#tray {
  margin: 0px 3px
}

/* Fixes */
#clock {
  letter-spacing: -1px;
}

#custom-expand-icon {
  background: transparent;
  margin: 0;
  padding: 0;
  margin-right: 3px;
}

#network {
  padding-right: 3px;
}

#group-tray-expander {
  margin: 0;
  padding: 0;
}

#language {
  margin-left: 4px
}

#custom-menu {
  padding-left: 11px;
  padding-right: 7px;
}

#idle_inhibitor {
  padding-left: 6px;
  padding-right: 4px
}

#power-profiles-daemon {
  padding-right: 8px;
}

#custom-power {
  padding-right: 15px
}

#custom-notification {
  padding-right: 2px;
}

#window {
  opacity: .5
}

/* Styling */
#custom-menu,
#language,
#idle_inhibitor,
#custom-updates,
#pulseaudio,
#backlight,
#network,
#battery,
#power-profiles-daemon,
#clock,
#custom-notification,
#custom-power {
  transition: opacity .12s ease;
}

#custom-menu:hover,
#language:hover,
#idle_inhibitor:hover,
#custom-updates:hover,
#pulseaudio:hover,
#backlight:hover,
#network:hover,
#battery:hover,
#power-profiles-daemon:hover,
#clock:hover,
#custom-notification:hover,
#custom-power:hover {
  opacity: .75
}

/* Battery states */
#battery.warning:not(.charging),
#battery.critical:not(.charging) {
  color: #ff8080
}

#battery.plugged:not(.charging) {
  color: #ffb588
}

#battery.charging {
  color: #88ff88
}

/* Hyprland/workspaces styling */
#workspaces {
  padding: 0;
  margin: 0;
}

#workspaces button {
  padding: 0px 5px;
  margin: 0px 0px;
  border: none;
  color: inherit;
  letter-spacing: -1px;
  box-shadow: none;
  background: transparent;
  opacity: .5;
  transition: color .08s ease, background .08s ease, opacity .08s ease;
}

#workspaces button.urgent {
  color: #ff8080
}

#workspaces button.empty {
  opacity: .25
}

#workspaces button.visible {
  opacity: 1;
}

#workspaces button:hover:not(.visible) {
  opacity: .8
}

tooltip {
  border-radius: 6px;
  background: black;
}'';
  };
}
