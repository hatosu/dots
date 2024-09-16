{ pkgs, lib, ... }: {

  #activation script on computer startup (RUNS FROM ROOT)
  systemd.services.startup = {
    enable = true;
    wantedBy = ["default.target" "multi-user.target" ];
    path = with pkgs; [
      coreutils
      systemd
    ];
    serviceConfig = {
      User = "root";
      Group = "wheel";
    };
    script = ''
      #idk how to make this work yet
    '';
  };

}
