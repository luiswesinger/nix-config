#!/bin/bash

# --- Kitty & Zsh Setup Script for Linux Mint --- #
# Ported from NixOS configuration

set -e

echo "Starting Terminal Setup..."

# 1. Install Dependencies
echo "Installing packages..."
sudo apt update
sudo apt install -y kitty zsh curl git fastfetch imagemagick chafa

# 2. Install Starship
if ! command -v starship &> /dev/null; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# 3. Install Modern Replacements (eza, bat, ripgrep, btop)
echo "Installing modern CLI tools..."
sudo apt install -y eza bat ripgrep btop
# Fix for 'bat' being 'batcat' on Ubuntu/Mint
mkdir -p ~/.local/bin
ln -sf /usr/bin/batcat ~/.local/bin/bat

# 4. Install Nerd Font (0xProto / ProtoNerd)
echo "Installing Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
if [ ! -f "$FONT_DIR/0xProtoNerdFont-Regular.tty" ]; then
    curl -fLo "$FONT_DIR/0xProto.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip
    unzip -o "$FONT_DIR/0xProto.zip" -d "$FONT_DIR"
    rm "$FONT_DIR/0xProto.zip"
    fc-cache -f
fi

# 5. Configure Kitty
echo "Configuring Kitty..."
KITTY_CONF="$HOME/.config/kitty/kitty.conf"
mkdir -p "$HOME/.config/kitty"

cat > "$KITTY_CONF" <<EOF
# --- Font ---
font_family      ProtoNerd Font Mono
font_size        13.0

# --- Colors (Catppuccin Mocha) ---
foreground           #cdd6f4
background           #1e1e2e
selection_foreground #1e1e2e
selection_background #89b4fa
url_color            #94e2d5
cursor               #89b4fa
cursor_text_color    #1e1e2e

active_border_color   #89b4fa
inactive_border_color #181825
bell_border_color     #f38ba8

active_tab_foreground   #1e1e2e
active_tab_background   #89b4fa
inactive_tab_foreground #585b70
inactive_tab_background #181825
tab_bar_background      #1e1e2e

color0 #1e1e2e
color1 #f38ba8
color2 #a6e3a1
color3 #f9e2af
color4 #89b4fa
color5 #cba6f7
color6 #94e2d5
color7 #cdd6f4
color8 #45475a
color9 #f38ba8
color10 #a6e3a1
color11 #f9e2af
color12 #89b4fa
color13 #cba6f7
color14 #94e2d5
color15 #b4befe

# --- Window Layout ---
background_opacity         0.90
dynamic_background_opacity yes
background_blur            20
enabled_layouts            splits
window_padding_width       12 16
window_border_width        1.5
draw_minimal_borders       no

# --- Tab Bar ---
tab_bar_edge         top
tab_bar_style        powerline
tab_powerline_style  slanted
tab_bar_min_tabs     1
tab_title_template   " {index}: {title} "

# --- Keybindings ---
map ctrl+shift+t     new_tab_with_cwd
map ctrl+shift+w     close_tab
map ctrl+shift+right next_tab
map ctrl+shift+left  previous_tab
map ctrl+shift+d     launch --location=hsplit --cwd=current
map ctrl+shift+minus launch --location=vsplit --cwd=current
map ctrl+shift+h     neighboring_window left
map ctrl+shift+l     neighboring_window right
map ctrl+shift+k     neighboring_window up
map ctrl+shift+j     neighboring_window down
map f2               launch --cwd=current nvim .

# --- Behavior ---
confirm_os_window_close 0
enable_audio_bell       no
shell_integration       enabled
EOF

# 6. Configure Starship
echo "Configuring Starship..."
mkdir -p "$HOME/.config"
cat > "$HOME/.config/starship.toml" <<EOF
[character]
success_symbol = "[›](bold green)"
error_symbol = "[›](bold red)"

[aws]
symbol = "🅰 "

[gcloud]
format = "on [\$symbol\$active(\(\$region\))](\$style) "
symbol = "🅶 ️"
EOF

# 7. Configure Zsh
echo "Configuring Zsh..."
cat > "$HOME/.zshrc" <<EOF
# --- Plugins & Integration ---
eval "\$(starship init zsh)"

# Enable completion
autoload -Uz compinit
compinit

# --- Aliases ---
alias ll="eza -la"
alias tr="eza -T"
alias l="eza -lh --icons"
alias y="yazi"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias cat="bat"
alias grep="rg"
alias top="btop"
alias _="sudo"
alias ga="git add ."
alias gst="git status"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gl="git log --oneline --graph --decorate --all"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ff="fastfetch"
alias untar="tar -xvf"
alias mkd="mkdir -p"

# --- Keybindings ---
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
EOF

# 8. Configure Fastfetch
echo "Configuring Fastfetch..."
mkdir -p "$HOME/.config/fastfetch"
mkdir -p "$HOME/.config/fastfetch/logos"

# Gengar Logo
cat > "$HOME/.config/fastfetch/logos/gengar.txt" <<'EOF'
⠀⠀⠀⠀⠀⢸⠓⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⠀⠀⠑⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠙⢤⡷⣤⣦⣀⠤⠖⠚⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣠⡿⠢⢄⡀⠀⡇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠸⠷⣶⠂⠀⠀⠀⣀⣀⠀⠀⠀
⢸⣃⠀⠀⠉⠳⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⢉⡭⠋
⠀⠘⣆⠀⠀⠀⠁⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀
⠀⠀⠘⣦⠆⠀⠀⢀⡎⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⡀⣠⠔⠋⠀⠀⠀⠀
⠀⠀⠀⡏⠀⠀⣆⠘⣄⠸⢧⠀⠀⠀⠀⢀⣠⠖⢻⠀⠀⠀⣿⢥⣄⣀⣀⣀⠀⠀
⠀⠀⢸⠁⠀⠀⡏⢣⣌⠙⠚⠀⠀⠠⣖⡛⠀⣠⠏⠀⠀⠀⠇⠀⠀⠀⠀⢙⣣⠄
⠀⠀⢸⡀⠀⠀⠳⡞⠈⢻⠶⠤⣄⣀⣈⣉⣉⣡⡔⠀⠀⢀⠀⠀⣀⡤⠖⠚⠀⠀
⠀⠀⡼⣇⠀⠀⠀⠙⠦⣞⡀⠀⢀⡏⠀⢸⣣⠞⠀⠀⠀⡼⠚⠋⠁⠀⠀⠀⠀⠀
⠀⢰⡇⠙⠀⠀⠀⠀⠀⠀⠉⠙⠚⠒⠚⠉⠀⠀⠀⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢧⡀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠙⣶⣶⣿⠢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠀⠀⠀⠙⢿⣳⠞⠳⡄⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠹⣄⣀⡤⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

cat > "$HOME/.config/fastfetch/config.jsonc" <<EOF
{
  "\$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "logo": {
    "source": "$HOME/.config/fastfetch/logos/gengar.txt",
    "padding": {
      "top": 2,
      "right": 4
    }
  },
  "display": {
    "color": {
      "keys": "green",
      "title": "blue"
    },
    "separator": " 󰁔 "
  },
  "modules": [
    "title",
    "os",
    "kernel",
    "packages",
    "shell",
    "display",
    "cpu",
    "gpu",
    "memory",
    "wm",
    "terminal",
    "font"
  ]
}
EOF

echo "Setup Complete. Please restart your terminal or execute 'zsh'."
echo "To set Zsh as the default shell: chsh -s \$(which zsh)"
