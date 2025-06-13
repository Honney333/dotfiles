#
# ~/.config/fish/configs/arch_config.fish
#

alias sway_config='nano $HOME/.config/sway/config' # Open the fish Config in Text editor

alias git_update='$HOME/.config/fish/scripts/git-update.sh'

alias mount_all='$HOME/.config/fish/scripts/mount.sh'
alias umount_all='$HOME/.config/fish/scripts/umount.sh'

alias print_cam='ssh honney@192.168.1.184'

alias updateall='sudo pacman -Syu && paru -Sua --sudoloop && flatpak update'

alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

alias big='expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

function cleanup
    while pacman -Qdtq
	    sudo pacman -R (pacman -Qdtq)
    end
end

function scenedetectenv
    source ~/.venvs/scenedetect-env/bin/activate.fish
    set -gx PATH ~/.venvs/scenedetect-env/bin $PATH
end
