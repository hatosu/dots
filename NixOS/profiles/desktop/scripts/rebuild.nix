{ lib, pkgs, ... }: {

  #activation script on rebuild (IT RUNS FROM ROOT, BEWARE)
  system.activationScripts.rebuild.text = ''

    #creates a blank config file to get rid of neovide error message
    DIRECTORY="/home/hatosu/.config/neovide"
    if [[ ! -d "$DIRECTORY" ]]; then
      mkdir "$DIRECTORY"
    fi

    #remind self what has to be done manually
    echo
    echo 'run this command yourself:'
    echo '- sudo waydroid init && protonup --dir "/home/hatosu/.local/share/Steam/compatibilitytools.d/" && protonup'
    echo
    echo 'remaining things to setup manually:'
    echo '- add  powerManagement.cpuFreqGovernor = "performance";  to your hardware file'
    echo '- add this to your steam launch options... gamemoderun gamescope -e -f -W 2560 -H 1080 -- env MANGOHUD=1 %command%'
    echo '- configure the rest of git, firefox, fcitx5, vencord, virt-manager, and steam'
    echo

  '';
}
