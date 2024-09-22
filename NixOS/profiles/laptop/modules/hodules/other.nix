{ config, pkgs, ... }: {

  #for enabling things as a little nudge to get them to work

  #properly enable river
  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
    xwayland.enable = true;
  };

}
