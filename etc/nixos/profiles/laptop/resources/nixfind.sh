#!/usr/bin/env bash
echo && echo "select category" && echo "1. Nix Packages" && echo "2. Nix Options" && echo "3. Home Options" && echo
read -p "enter your choice (1-3):" choice
case $choice in
    1)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        nix search nixpkgs "$1" | less
        ;;
    2)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
				man configuration.nix 2> /dev/null | awk "/$1/,/\<nixpkgs\/nixos\//" | less
        ;;
    3)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        man home-configuration.nix 2> /dev/null | awk "/$1/,/\<home-manager\/modules\//" | less
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac


