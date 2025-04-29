#
# In ~/.config/fish/config.fish
#

if test "$TERM" = "xterm-kitty"
    alias icat='kitty +kitten icat'
end

alias fish_config='nano $HOME/.config/fish/config.fish' # Open the fish Config in Text editor

# Easier Ollama Commands
alias llama_start='ollama serve' # Start the LLama server
alias llama3='ollama run llama3' # Start the LLama Chat

alias force_delete='sudo rm -rf' # Delete Folder/Files with included Folder/Files

alias tasks='btop'

alias python='python3'
alias py='python3'

alias uni_play='mpv --vo=tct'   # Plays a video in terminal with Unicode
alias asci_play='mpv --vo=caca' # Plays a video in terminal with ASCII

alias remount='sudo mount -a'

alias mount_config='sudo nano /etc/fstab'

alias mkvenv='python3 -m venv' # Python Virtual Environment

alias own='sudo chown -R "$USER":"$USER" themes'
alias right='sudo chmod -R 755'

alias reload='clear && omf reload'

# LS to eza Commands
alias ls 'eza -a --color=always --group-directories-first --icons' # preferred listing
alias lr 'eza -al --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias lf 'eza -aD --color=always --group-directories-first --icons' # show only folder

# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'

alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'

alias ip 'ip -color'

alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'

alias tarnow 'tar -acf '
alias untar 'tar -zxvf '

alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'

alias wget 'wget -c '

alias jctl 'journalctl -p 3 -xb'
