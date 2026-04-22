{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      monitor = ",preferred,auto,auto";

      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";

      exec-once = [
	"waybar"
      ];

      env = [
	"XCURSOR_SIZE,24"
	"HYPRCURSOR_SIZE,24"
      ];

      general = {
	gaps_in = 5;
	gaps_out = 5;
	border_size = 1;
	resize_on_border = true;
	allow_tearing = false;
	layout = "dwindle";
      };

      decoration = {
	rounding = 10;
	rounding_power = 2;
	active_opacity = 1.0;
	inactive_opacity = 1.0;
	shadow = {
	  enabled = true;
	  range = 4;
	  render_power = 3;
	};
	blur = {
	  enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy = 0.1696;
	};
      };

      animations = {
	enabled = true;
	bezier = [
	  "easeOutQuint,   0.23, 1,    0.32, 1"
	  "easeInOutCubic, 0.65, 0.05, 0.36, 1"
	  "linear,         0,    0,    1,    1"
	  "almostLinear,   0.5,  0.5,  0.75, 1"
	  "quick,          0.15, 0,    0.1,  1"
	];
	animation = [
	  "global,        1, 10,  default"
	  "border,        1, 5,   easeOutQuint"
	  "windows,       1, 5,   easeOutQuint"
	  "windowsIn,     1, 4,   easeOutQuint, popin 87%"
	  "windowsOut,    1, 1,   linear,       popin 87%"
	  "fadeIn,        1, 2,   almostLinear"
	  "fadeOut,       1, 1,   almostLinear"
	  "fade,          1, 3,   quick"
	  "layers,        1, 4,   easeOutQuint"
	  "layersIn,      1, 4,   easeOutQuint, fade"
	  "layersOut,     1, 1,   linear,       fade"
	  "fadeLayersIn,  1, 2,   almostLinear"
	  "fadeLayersOut, 1, 1,   almostLinear"
	  "workspaces,    1, 2,   almostLinear, fade"
	  "workspacesIn,  1, 1,   almostLinear, fade"
	  "workspacesOut, 1, 2,   almostLinear, fade"
	  "zoomFactor,    1, 7,   quick"
	];
      };

      dwindle = {
	pseudotile = true;
	preserve_split = true;
      };

      master = {
	new_status = "master";
      };

      misc = {
      };

      input = {
	kb_layout = "us";
	kb_variant = "";
	kb_model = "";
	kb_options = "";
	kb_rules = "";
	follow_mouse = 1;
	sensitivity = 0;
	touchpad = {
	  natural_scroll = false;
	};
      };

      gesture = "3, horizontal, workspace";

      device = {
	name = "epic-mouse-v1";
	sensitivity = -0.5;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod,F, fullscreen"
	"$mainMod, RETURN, exec, $terminal"
	"$mainMod, Q, killactive"
	"$mainMod SHIFT, F, togglefloating" 
	"$mainMod, SPACE, exec, $menu"
	"$mainMod, P, pseudo" #Change
	"$mainMod, h,  movefocus, l"
	"$mainMod, l, movefocus, r"
	"$mainMod, k,    movefocus, u"
	"$mainMod, j,  movefocus, d"
	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	"$mainMod, 0, workspace, 10"
	"$mainMod SHIFT, 1, movetoworkspace, 1"
	"$mainMod SHIFT, 2, movetoworkspace, 2"
	"$mainMod SHIFT, 3, movetoworkspace, 3"
	"$mainMod SHIFT, 4, movetoworkspace, 4"
	"$mainMod SHIFT, 5, movetoworkspace, 5"
	"$mainMod SHIFT, 6, movetoworkspace, 6"
	"$mainMod SHIFT, 7, movetoworkspace, 7"
	"$mainMod SHIFT, 8, movetoworkspace, 8"
	"$mainMod SHIFT, 9, movetoworkspace, 9"
	"$mainMod SHIFT, 0, movetoworkspace, 10"
	"$mainMod, S, togglespecialworkspace, magic"
	"$mainMod SHIFT, S, movetoworkspace, special:magic"
	"$mainMod, mouse_down, workspace, e+1"
	"$mainMod, mouse_up,   workspace, e-1"
      ];

      bindel = [
	",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
	",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
	", XF86AudioNext,  exec, playerctl next"
	", XF86AudioPause, exec, playerctl play-pause"
	", XF86AudioPlay,  exec, playerctl play-pause"
	", XF86AudioPrev,  exec, playerctl previous"
      ];

      bindm = [
	"$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
      ];

    };
  };
}
