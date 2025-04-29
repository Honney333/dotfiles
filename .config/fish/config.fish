# source ~/.config/fish/configs/aliases.fish

# if test -f $HOME/.config/fish/alias.fish ]
# source $HOME/.config/fish/alias.fish
# end

set distro (cat /etc/os-release | grep ^ID= | cut -d '=' -f 2 | tr -d '"')

if status is-interactive
	# Commands to run in interactive sessions can go here

	# Load the theme
	if test -f $HOME/.config/fish/configs/theme.fish
		source $HOME/.config/fish/configs/theme.fish
	end

	# Load the aliases
	if test -f $HOME/.config/fish/configs/alias_custom-script.fish
		source $HOME/.config/fish/configs/alias_custom-script.fish
	end
	if test -f $HOME/.config/fish/configs/alias_fixing.fish
		source $HOME/.config/fish/configs/alias_fixing.fish
	end
	if test -f $HOME/.config/fish/configs/alias_useful.fish
		source $HOME/.config/fish/configs/alias_useful.fish
	end

	# ~/.config/fish/config.fish

	# Get the distribution name and version
	

	switch $distro
		case 'fedora'
			if test -f $HOME/.config/fish/configs/fedora_config.fish
				source $HOME/.config/fish/configs/fedora_config.fish
			end
		case 'arch'
			if test -f $HOME/.config/fish/configs/arch_config.fish
				source $HOME/.config/fish/configs/arch_config.fish
			end
		case 'ubuntu'
			if test -f $HOME/.config/fish/configs/ubuntu_config.fish
				source $HOME/.config/fish/configs/ubuntu_config.fish
			end
		case '*'
			if test -f $HOME/.config/fish/configs/default_config.fish
				source $HOME/.config/fish/configs/default_config.fish
			end
	end


	fastfetch
end

set -x QT_QPA_PLATFORMTHEME qt6ct

# Fish done Configuration
set -U __done_allow_nongraphical 1
set -U __done_min_cmd_duration 5000 # 5000  # default: 5000 ms  # 5 seconds
set -U __done_notify_sound 1
set -U __done_sway_ignore_visible 0

fish_add_path /home/honney/.millennium/ext/bin

fish_add_path /home/honney/.spicetify