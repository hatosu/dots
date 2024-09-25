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
          type = "title";
          format = "{6}";
          key = "╭────";
        }
        {
          type = "os";
          format = "{2} {9}";
          key = "├──";
        }
        {
          type = "kernel";
          format = "{1} {2}";
          key = "│ ";
        }
        {
          type = "wm";
          key = "│󰨇 ";
        }
        {
          type = "shell";
          key = "│ ";
        }
        {
          type = "host";
          format = "{1}";
          key = "├──";
        }
        {
          type = "cpu";
          key = "│ ";
        }
        {
          type = "gpu";
          key = "│󱒄 ";
        }
        {
          type = "memory";
          key = "│ ";
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
