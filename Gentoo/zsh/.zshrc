#just dont touch this
export ZSH="$HOME/.oh-my-zsh"

#enable the z package
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#source files THAT belong at top of file
source ~/.oh-my-zsh/jovial.zsh-theme
source ~/.zshenv
source ~/.zshalias

#autorun
fastfetch

#plugins
plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

#functions
update() {
    aura check
    aura -Syyu && sudo sh -c "aura -Syu && aura -Au"
    flatpak update
    nix-channel --update unstable
    nix-env --upgrade
    echo | noti -t "SYSTEM UPDATE" -m "Successfully updated all apps, and the entire system."
}
heal() {
    flatpak uninstall --unused
    nix-collect-garbage
    sudo rm -rf .cache/nix/*
    aura check
    aura -Cy
    aura -Oj
    yes | aura -Cc 2
    echo | noti -t "SYSTEM UPDATE" -m "Successfully cleared cache & app garbage, and executed a few system health commands."
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
weather()
{   
    # change Berlin to your default location
    local request="wttr.in/${1-Sanjose}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request" | less
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

#custom color variables, see https://user-images.githubusercontent.com/15135943/143198898-2cf1225c-47e4-4860-95db-2dc29ad1436e.png
JOVIAL_PALETTE=(
    host '%F{217}'
    user '%F{188}'
    root '%B%F{203}'
    path '%B%F{228}%}'
    git '%F{159}'
    venv '%F{159}'
    time '%F{254}'
    elapsed '%F{222}'
    exit.mark '%F{246}'
    exit.code '%B%F{203}'
    conj. '%F{102}'
    typing '%F{252}'
    normal '%F{252}'
    success '%F{040}'
    error '%F{203}'
)

#source files THAT belong at end of file
source $ZSH/oh-my-zsh.sh
