{ lib, ... }: {

  environment={
    interactiveShellInit=''

      alias power="shutdown -h now"
      alias hist="history | grep"
      alias vcheat="nvim /etc/nixos/profiles/laptop/resources/information/vim.txt"
      alias lcheat="nvim /etc/nixos/profiles/laptop/resources/information/linux.txt"
      alias features="nvim /etc/nixos/profiles/laptop/resources/information/features.txt"
      alias c="clear"
      alias e="exit"
      alias s="playerctl next"
      alias p="playerctl play-pause"
      alias b="playerctl previous"
      alias try="nix-shell -p"
      alias opt="image_optim"
      alias img="magick"
      alias ff="fastfetch --logo-color-1 red --logo-color-2 '90:'"
      alias anime="ani-cli -q 1080p"
      alias light="brightnessctl"
      alias ask="tgpt"
      alias phind="tgpt --provider phind"
      alias color="okolors"
      alias disk="ncdu"
      alias sound="ponymix"
      alias tasks="glances"
      alias drag="ripdrag -r"
      alias v="nvim"
      alias y="yazi"
      alias m="mpv"
  
      rebuild() {
        clear
        sudo nixos-rebuild boot --flake /etc/nixos#laptop
        sudo nixos-rebuild switch --flake /etc/nixos#laptop
        noti -t 'REBUILD COMMAND' -m 'system successfully rebuilt according to your personal nix configuration files >:3'
      }

      update() {
        sudo nix flake update /etc/nixos
        noti -t 'UPDATE COMMAND' -m 'system update completed successfully'
      }

      heal() {
        sudo nix-collect-garbage
        sudo rm -rf ~/.cache/*
        noti -t "HEAL COMMAND" -m "Successfully cleared cache & app garbage, and executed a few system health commands."
      }

      pushdots() {
        cd ~/Github/dots
        git switch main
        git add .
        git add -A
        git commit -am "mlem..."
        git push dots
      }

      run() {
        number=$1
        shift
        for i in `seq $number`; do
          $@
        done
      }

      newest() {
        find . -type f \( ! -regex '.*/\..*' \) -print0 | xargs -0 stat -c "%Y:%n" | sort -n| tail -n 10 | cut -d ':' -f2-
      }

      ex() {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xvjf $1                  ;;
            *.tar.gz)    tar xvzf $1                  ;;
            *.bz2)       bunzip2 $1                   ;;
            *.rar)       unrar x $1                   ;;
            *.gz)        gunzip $1                    ;;
            *.tar)       tar xvf $1                   ;;
            *.tbz2)      tar xvjf $1                  ;;
            *.tgz)       tar xvzf $1                  ;;
            *.zip)       unzip $1                     ;;
            *.Z)         uncompress $1                ;;
            *.7z)        7z x $1                      ;;
            *)           echo "can't extract '$1'..." ;;
          esac
        else
          echo "'$1' is not a valid file!"
        fi
      }

    '';
  };

}
