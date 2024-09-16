{ pkgs, lib, inputs, ... }: {

  #enable keyd as hotkey service
  services.keyd.enable = true;
  services.keyd.keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          rightshift = "overload(rightshift, rightshift)";
          rightalt = "layer(meta)";
          leftmeta = "layer(alt)";
        };
        rightshift = {
          w = "up";
          a = "left";
          s = "down";
          d = "right";
        };
      };
  };

}
