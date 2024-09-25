{ lib, ... }: {

  environment={
    interactiveShellInit=''

      alias power="shutdown -h now"
      alias hist="history | grep"
      alias vcheat="nvim /etc/nixos/misc/.vim"
      alias lcheat="nvim /etc/nixos/misc/.linux"
      alias features="nvim /etc/nixos/misc/.laptopfeatures"
      alias c="clear"
      alias e="exit"
      alias s="playerctl next"
      alias p="playerctl play-pause"
      alias b="playerctl previous"
      alias try="nix-shell -p"
      alias opt="image_optim"
      alias img="magick"
      alias ff="fastfetch --logo-color-1 red --logo-color-2 '90:'"
      alias fastfetch="fastfetch --logo-color-1 red --logo-color-2 '90:'"
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

      sync-laptop() {
        cd ~/Github/dots
        sudo git rm -r ~/Github/dots/*
        sudo rm -r /tmp/dots
        git clone https://github.com/hatosu/dots /tmp/dots
        sudo cp -r /tmp/dots/* ~/Github/dots
        sudo rm -r ~/Github/dots/NixOS/profiles/laptop
        sudo rm -r ~/Github/dots/NixOS/misc
        sudo git rm -r ~/Github/dots/NixOS/profiles/laptop
        sudo git rm -r ~/Github/dots/NixOS/misc
        sudo cp -r /etc/nixos/profiles/laptop ~/Github/dots/NixOS/profiles/
        sudo cp -r /etc/nixos/misc ~/Github/dots/NixOS/
        git add .
        git add -A
        git commit -am "visit hatosu.com >x3"
        git push dots
        cd
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
