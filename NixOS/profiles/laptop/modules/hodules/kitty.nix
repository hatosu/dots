{ pkgs, lib, ... }: {

  #setup kitty as terminal emulator
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    theme = "Wryan";
  };

}
