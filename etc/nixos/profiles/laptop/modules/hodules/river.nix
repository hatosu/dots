{ config, pkgs, ... }: {

  #properly enable river
  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
    xwayland.enable = true;
  };

}
