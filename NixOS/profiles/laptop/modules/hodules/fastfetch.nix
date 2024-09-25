{ config, pkgs, ... }: {

  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          top = 1;
        };
      };
      display = {
        size.binaryPrefix = "si";
        color = "red";
        separator = " ";
      };
      modules = [
        {
          type = "os";
          format = "{2} {9}";
          key = "╭────";
        }
        {
          type = "kernel";
          format = "{1} {2}";
          key = "│ ";
        }
        {
          type = "packages";
          key = "│ ";
        }
        {
          type = "wm";
          key = "│ ";
        }
        {
          type = "terminal";
          key = "│ ";
        }
        {
          type = "cpu";
          key = "│ ";
        }
        {
          type = "command";
          text = "printf 'NVIDIA GeForce RTX 4060 Max-Q / Mobile [Discrete]'";
          key = "│ ";
        }
        {
          type = "disk";
          key = "│ ";
        }
        {
          type = "command";
          text = "printf '\\0'";
          key = "╰────────────────────";
        }
      ];
    };
  };

}
