# In ~/.config/fish/config.fish

# Fixing some Programs that do not know Kitty or Alacritty

# Check if the local terminal supports color (kitty, alacritty, etc.)
if test "$TERM" = "xterm-kitty" -o "$TERM" = "alacritty"
    # If we're in a non-standard terminal, force TERM=xterm-256color for SSH
    alias ssh 'env TERM=xterm-256color ssh'
end

if test -f $HOME/.config/fish/alias.fish
source $HOME/.config/fish/alias.fish
end
zoxide init fish | source
alias cd='z'