{ config, pkgs, inputs, ... }: {

  #create symlinks for programs that need it, with folders & files in resources
  home.file = {

    #river symlinks
    ".config/river/" = { source = ../../resources/river; target = ".config/river/"; };

  };

  xdg = {
    enable = true;

    configFile."LMAO/init.cum" = {
      source = ../../resources/temp/init.cum;
    };

  };

}
