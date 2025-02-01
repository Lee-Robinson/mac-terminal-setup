#!/bin/bash

# mac-terminal-setup
# Automated script for setting up a customized macOS terminal environment
# Repository: https://github.com/Lee-Robinson/mac-terminal-setup

# Print colorful messages
print_message() {
    echo -e "\n\033[1;34m>>> $1\033[0m"
}

print_success() {
    echo -e "\033[1;32m✓ $1\033[0m"
}

print_error() {
    echo -e "\033[1;31m✗ $1\033[0m"
}

# Check if Homebrew is installed
check_homebrew() {
    print_message "Checking for Homebrew..."
    if ! command -v brew &> /dev/null; then
        print_message "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        print_success "Homebrew is already installed"
    fi
}

# Install Warp Terminal
install_warp() {
    print_message "Installing Warp Terminal..."
    if ! brew list --cask warp &> /dev/null; then
        brew install --cask warp
        print_success "Warp Terminal installed"
    else
        print_success "Warp Terminal is already installed"
    fi
}

# Setup Catppuccin themes
setup_catppuccin() {
    print_message "Setting up Catppuccin themes..."
    
    # Create themes directory
    mkdir -p "$HOME/.warp/themes"
    
    # Download all theme variants
    for variant in mocha macchiato frappe latte; do
        if [ ! -f "$HOME/.warp/themes/catppuccin_${variant}.yml" ]; then
            curl -s -o "$HOME/.warp/themes/catppuccin_${variant}.yml" \
                "https://raw.githubusercontent.com/catppuccin/warp/main/themes/catppuccin_${variant}.yml"
            print_success "Downloaded ${variant} theme"
        else
            print_success "${variant} theme already exists"
        fi
    done
}

# Install Hack Nerd Font
install_font() {
    print_message "Installing Hack Nerd Font..."
    if ! brew list --cask font-hack-nerd-font &> /dev/null; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        print_success "Hack Nerd Font installed"
    else
        print_success "Hack Nerd Font is already installed"
    fi
}

# Install and configure Starship
setup_starship() {
    print_message "Setting up Starship..."
    
    # Install Starship
    if ! command -v starship &> /dev/null; then
        brew install starship
        print_success "Starship installed"
    else
        print_success "Starship is already installed"
    fi
    
    # Create config directory
    mkdir -p ~/.config
    
    # Install Gruvbox Rainbow preset
    starship preset gruvbox-rainbow -o ~/.config/starship.toml
    print_success "Starship Gruvbox Rainbow preset installed"
    
    # Optional: Download custom configuration
    read -p "Do you want to use the typecraft starship configuration instead? (y/N) " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        curl -o ~/.config/starship.toml \
            https://raw.githubusercontent.com/typecraft-dev/dotfiles/master/starship/.config/starship.toml
        print_success "Custom Starship configuration installed"
    fi
}

# Configure shell
configure_shell() {
    print_message "Configuring shell..."
    
    # Determine shell type
    SHELL_CONFIG=""
    if [ "$SHELL" = "/bin/zsh" ]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [ "$SHELL" = "/bin/bash" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
    else
        print_error "Unsupported shell: $SHELL"
        return 1
    fi
    
    # Add Starship init to shell config if not already present
    if ! grep -q "starship init" "$SHELL_CONFIG" 2>/dev/null; then
        echo 'eval "$(starship init '$(basename "$SHELL")')"' >> "$SHELL_CONFIG"
        print_success "Added Starship init to $SHELL_CONFIG"
    else
        print_success "Starship init already configured in $SHELL_CONFIG"
    fi
}

# Main installation process
main() {
    print_message "Starting macOS Terminal Setup..."
    
    check_homebrew
    install_warp
    setup_catppuccin
    install_font
    setup_starship
    configure_shell
    
    print_message "Setup complete! Please restart your terminal."
    print_message "Don't forget to:"
    echo "1. Open Warp and set Hack Nerd Font in preferences"
    echo "2. Select your preferred Catppuccin theme in Warp settings (⌘ + ,)"
}

# Run the script
main
