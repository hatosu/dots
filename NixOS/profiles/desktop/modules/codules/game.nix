{ pkgs, ... }: {

  #enables steam & allows you to use gamescope launch option
  programs.steam = {
    enable = true;
  };

  #allows you to use gamemode launch option in steam
  programs.gamemode.enable = true;

  #support for xbox controller usb dongle
  hardware.xone.enable = true;

}
