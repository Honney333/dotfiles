if status is-interactive

        

	# My custom alias

		

		




		# Get the error messages from journalctl
		
		# Recent installed packages
		

		# Cleanup local orphaned packages
			function cleanup
			    while pacman -Qdtq
				sudo pacman -R (pacman -Qdtq)
			    end
			end

        alias mc_server 'cd Server/Minecraft/Prominence_II_RPG_v3.0.6_Server_Pack/ && ./start.sh'

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

fish_add_path /home/honney/.spicetify
