{ lib, ... }: {

  #export session variables
  environment.sessionVariables = {

    #applications
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";

    #input-method
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";

    #graphical
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland;xcb";

    #allow all nix-commands to use unfree packages
    NIXPKGS_ALLOW_UNFREE = "1";

  };

}
