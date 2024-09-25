{ config, pkgs, inputs, ... }: {

  #create symlinks for programs that need it, with folders & files in resources
  home.file = {

    #river symlinks
    ".config/river/" = { source = ../../resources/river; target = ".config/river/"; };

  };

  xdg = {
    enable = true;

    #vesktop symlink
    configFile."vesktop/settings/settings.json" = {
      source = ../../resources/vesktop/settings.json;
    };

  };

}
