if status is-interactive
    # Commands to run in interactive sessions can go here

	# OPTIONS FOR BOBTHEFISH (Theme)
		set -g theme_display_git yes
		set -g theme_display_git_dirty no
		set -g theme_display_git_untracked no
		set -g theme_display_git_ahead_verbose yes
		set -g theme_display_git_dirty_verbose yes
		set -g theme_display_git_stashed_verbose yes
		set -g theme_display_git_default_branch yes
		set -g theme_git_default_branches master main
		set -g theme_git_worktree_support yes
		set -g theme_use_abbreviated_branch_name yes
		set -g theme_display_vagrant yes
		set -g theme_display_docker_machine no
		set -g theme_display_k8s_context yes
		set -g theme_display_hg yes
		set -g theme_display_virtualenv no
		set -g theme_display_nix no
		set -g theme_display_ruby no
		set -g theme_display_node yes
		set -g theme_display_user ssh
		set -g theme_display_hostname ssh
		set -g theme_display_vi no
		set -g theme_display_date no
		set -g theme_display_cmd_duration yes
		set -g theme_title_display_process yes
		set -g theme_title_display_path no
		set -g theme_title_display_user yes
		set -g theme_title_use_abbreviated_path no
		set -g theme_date_format "+%a %H:%M"
		set -g theme_date_timezone America/Los_Angeles
		set -g theme_avoid_ambiguous_glyphs yes
		set -g theme_powerline_fonts no
		set -g theme_nerd_fonts yes
		set -g theme_show_exit_status yes
		set -g theme_display_jobs_verbose yes
		set -g default_user your_normal_user
		set -g theme_color_scheme dark
		set -g fish_prompt_pwd_dir_length 0
		set -g theme_project_dir_length 1
		set -g theme_newline_cursor yes
		set -g theme_newline_prompt '$ '

	# Alias needed inside interactive

	# My custom alias
		alias force_delete='sudo rm -rf' # Delete Folder/Files with included Folder/Files 

		alias llama_start='ollama serve' # Start the LLama server
		alias llama3='ollama run llama3' # Start the LLama Chat

		alias icat='kitty +kitten icat'  # Show picture in Terminal
		alias edit_fish_config='nano $HOME/.config/fish/config.fish' # Open the fish Config in Text editor
		alias edit_sway_config='nano $HOME/.config/sway/config' # Open the fish Config in Text editor

		alias python='python3'
		alias py='python3'

		alias tasks='btop'

        alias git_update='$HOME/.config/fish/scripts/git-update.sh'

		alias remount='sudo mount -a'
		alias available_mounts='smbclient -L 192.168.0.1 -U Honney'
		alias mount_all='$HOME/.config/fish/scripts/mount.sh'
		alias umount_all='$HOME/.config/fish/scripts/umount.sh'
		alias mount_config='sudo nano /etc/fstab'

		alias uninstall='sudo apt purge -y'
		alias server_shutdown='$HOME/.config/fish/scripts/shutdown-server.sh'
		
		# Python Virtual Environment
		alias mkvenv='python3 -m venv'

		zoxide init fish | source
		alias zd='z'

		alias print_cam='ssh honney@192.168.1.187'

		alias updateall='sudo pacman -Syu && paru -Sua && yay -Syu && flatpak update'

        alias own='sudo chown -R "$USER":"$USER" themes'
        alias right='sudo chmod -R 755'

		alias reload='clear && omf reload'

	# Garuda Alias
		# Replace ls with eza
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
		alias big 'expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
		alias dir 'dir --color=auto'
		alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
		alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
		alias grep 'ugrep --color=auto'
		alias egrep 'ugrep -E --color=auto'
		alias fgrep 'ugrep -F --color=auto'
		alias grubup 'sudo update-grub'
		alias hw 'hwinfo --short'                          # Hardware Info
		alias ip 'ip -color'
		alias psmem 'ps auxf | sort -nr -k 4'
		alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
		alias rmpkg 'sudo pacman -Rdd'
		alias tarnow 'tar -acf '
		alias untar 'tar -zxvf '
		alias upd '/usr/bin/garuda-update'
		alias vdir 'vdir --color=auto'
		alias wget 'wget -c '

		alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
		alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
		alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
		alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

		# Get the error messages from journalctl
		alias jctl 'journalctl -p 3 -xb'

		# Recent installed packages
		alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

		# Cleanup local orphaned packages
			function cleanup
			    while pacman -Qdtq
				sudo pacman -R (pacman -Qdtq)
			    end
			end

	# Runs Fastfetch
		fastfetch
end

# all the other alias

	# Replace some more things with better alternatives
	# alias cat 'bat --style header --style snip --style changes --style header'

set -x QT_QPA_PLATFORMTHEME qt6ct

# Fish done Configuration
set -U __done_allow_nongraphical 1
set -U __done_min_cmd_duration 5000 # 5000  # default: 5000 ms  # 5 seconds
set -U __done_notify_sound 1
set -U __done_sway_ignore_visible 0

fish_add_path /home/honney/.millennium/ext/bin
