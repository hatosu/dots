{ config, pkgs, ... }: {

  #setup fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-hangul
      fcitx5-pinyin-zhwiki
    ];
  };

}
