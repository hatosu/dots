{ config, pkgs, inputs, ... }: {

  #create symlinks for programs that need it, with folders & files in resources
  home.file = {
    ".config/river/" = { source = ../../resources/river; target = ".config/river/"; };
  };

}
