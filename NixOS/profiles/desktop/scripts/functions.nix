{ lib, ... }: {

  #functions that are too long to be kept as aliases
  environment = {
    interactiveShellInit = ''

      rebuild() {
        clear
        nix-channel --update unstable
        sudo nixos-rebuild switch --flake ~/.nix/#primary
        noti -t 'NIXOS REBUILD COMMAND' -m 'system successfully updated according to your personal nix configuration files >:3'
      }

      heal() {
        sudo nix-collect-garbage
        sudo rm -rf .cache/nix/*
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
