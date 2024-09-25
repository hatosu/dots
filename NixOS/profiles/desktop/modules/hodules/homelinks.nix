{ config, pkgs, inputs, ... }: {

  #create symlinks for programs that need it, with folders & files in resources
  home.file = {

    #ags symlinks
    ".config/ags/" = { source = ../../resources/ags; target = ".config/ags/"; };

  };

  xdg = {
    enable = true;

    #vesktop symlink
    configFile."vesktop/settings/settings.json" = {
      source = ../../resources/vesktop/settings.json;
    };

  };

}
