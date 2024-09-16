{ config, pkgs, ... }: {

  #properly setup hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    extraConfig = "
      monitor=HDMI-A-1,2560x1080@165,auto,auto
      xwayland {
        force_zero_scaling = true
      }
    ";
    settings = {
      cursor = {
        enable_hyprcursor = false;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
      };
      exec-once = [
        "mpvpaper -o 'no-audio loop' HDMI-A-1 ~/.nix/profiles/primary/resources/wallpaper.mp4"
        "vesktop --disable-renderer-backgrounding"
        "dunst"
        "firefox"
        "fcitx5"
        "waybar"
      ];
      misc = {
        enable_swallow = true;
        swallow_regex = "^(Alacritty|kitty|footclient)$";
      };
      windowrulev2 = [
        "opacity 0.90 0.90,floating:0"
        "opacity 0.90 0.90,floating:1"
        "suppressevent maximize, class:.*"

      ];
      decoration = {
        rounding = 7;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          ignore_opacity = true;
        };
      };
      general = {
        gaps_in = 9;
        gaps_out = 11;
        border_size = 1;
        "col.active_border" = "rgba(f78f88d9) rgba(f5c0bcd9)";
        "col.inactive_border" = "0x00000000";
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
        new_status = "master";
      };
      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 3, smoothOut, slide"
          "windowsMove, 1, 3, default"
          "border, 1, 3, default"
          "fade, 1, 3, smoothIn"
          "fadeDim, 1, 3, smoothIn"
          "workspaces, 1, 3, default, fade"
        ];
      };
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, X, togglefloating"
        "$mainMod, T, exec, wofi --show drun"
        "$mainMod, G, exec, wofi --show drun" 
        "$mainMod, L, exec, kitty" 
        "$mainMod, Z, killactive," 
        "$mainMod, B, exec, firefox" 
        "$mainMod, O, exec, hyprpicker -a"
        "$mainMod, C, exec, sh -c 'flameshot gui'"
        "$mainMod, a, movefocus, l" 
        "$mainMod, f, movefocus, r" 
        "$mainMod, d, movefocus, u" 
        "$mainMod, s, movefocus, d" 
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
        "$mainMod, r, resizeactive, 30 0" 
        "$mainMod, q, resizeactive, -30 0" 
        "$mainMod, e, resizeactive, 0 -30" 
        "$mainMod, w, resizeactive, 0 30" 
        "$mainMod SHIFT, a, movewindow, l" 
        "$mainMod SHIFT, f, movewindow, r" 
        "$mainMod SHIFT, d, movewindow, u" 
        "$mainMod SHIFT, s, movewindow, d" 
        "$mainMod SHIFT, p, movetoworkspacesilent, special" 
        "$mainMod, p, togglespecialworkspace" 
        "$mainMod, mouse:272, movewindow" 
        "$mainMod, mouse:273, resizeactive" 
      ];
    };
  };

}
