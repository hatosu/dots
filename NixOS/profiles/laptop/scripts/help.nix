{ pkgs, ... }:

let

  help = pkgs.writeShellScriptBin "help" ''

    #!/usr/bin/env bash
    echo && echo "select desired tool" && echo "1. Man" && echo "2. Tldr" && echo "3. Navi" && echo
    read -p "enter your choice (1-3):" choice
    case $choice in
        1)
            if [ "$#" -ne 1 ]; then
                echo "Usage: $0 <search_term>"
                exit 1
            fi
            man "$1"
            ;;
        2)
            if [ "$#" -ne 1 ]; then
                echo "Usage: $0 <search_term>"
                exit 1
            fi
            tldr "$1" | less
            ;;
        3)
            if [ "$#" -ne 1 ]; then
                echo "Usage: $0 <search_term>"
                exit 1
            fi
            navi --finder 'skim' --cheatsh "$1"
            ;;
        *)
            echo "Invalid selection."
            exit 1
            ;;
    esac

  '';

in {
  environment.systemPackages = [ help ];
}
