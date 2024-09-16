{ pkgs, lib, ... }: {

  #setup fonts of choice
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
    fira
    fira-mono
    fira-code
    fira-code-symbols
    source-code-pro
    font-awesome
  ];

}
