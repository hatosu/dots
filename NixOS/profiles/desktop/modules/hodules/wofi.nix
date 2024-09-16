{ config, pkgs, ... }: {

  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      location = "center";
      hide_scroll = true;
      width = "45%";
      lines = 11;
      line_wrap = "word";
      term = "kitty";
      allow_markup = true;
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      sort_order = "default";
      gtk_dark = true;
      image_size = 20;
      display_generic = false;
      key_expand = "tab";
      insensitive = false;
      single_click = true;
    };
    style = ''
      * {
        font-family: JetBrainsMono, SpaceMono;
        color: #e5e9f0;
        /* background: transparent; */
      }
      
      #window {
        background: rgba(41, 46, 66, 0.5);
        margin: auto;
        padding: 10px;
        border-radius: 20px;
        border: 1px solid #0a0a0a;
        background-color: #151515;
        opacity: 0.9;
      }
      
      #input {
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
      }
      
      #outer-box {
        padding: 20px;
      }
      
      #img {
        margin-right: 6px;
      }
      
      #entry {
        padding: 10px;
        border-radius: 10px;
      }
      
      #entry:selected {
        background-color: #EDA6A4;
      }
      
      #text {
        margin: 2px;
      }
    '';
  };

}
