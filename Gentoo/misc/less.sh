#!/bin/bash
echo "Please select a package manager:" && echo "1. Pacman" && echo "2. AUR" && echo "3. Nix" && echo "4. Flatpak"
read -p "Enter your choice (1-4): " choice
case $choice in
    1)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        aura -Ss "$1" | less
        ;;
    2)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        aura -As "$1" | less
        ;;
    3)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        nix search nixpkgs "$1" | less
        ;;
    4)
        if [ "$#" -ne 1 ]; then
            echo "Usage: $0 <search_term>"
            exit 1
        fi
        flatpak search "$1" | less
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac
