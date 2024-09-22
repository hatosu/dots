{ config, pkgs, ... }: {

  #setup kitty as terminal emulator
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    themeFile = "Pnevma";
  };

  programs.zsh = {

    #enable zsh and some default plugins
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    #the zshrc
    initExtra = ''
      #idk what to put here yet
    '';

    #configuring custom history options
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rebuild"
        "pkill *"
        "clear"
        "exit"
        "c"
        "e"
        "p"
        "s"
        "b"
      ];
    };

    #ohmyzsh stuff
    oh-my-zsh = {
      enable = true;
      package = pkgs.oh-my-zsh;
      theme = "avit";
      plugins = [
        "git"
      ];
    };

  };

  #zoxide for "z" command
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
  };

}
