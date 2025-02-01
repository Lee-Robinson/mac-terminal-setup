# mac-terminal-setup
This script automates how I like my Terminal on Mac OSx - Installs HomeBrew, INstalls Warp Terminal, deploys Catppuccin,  Nerd Hack Font, INstalls and configures Starship, configures Zsh

# mac-terminal-setup

🚀 Automated script for setting up a beautiful and functional macOS terminal environment.

## Overview

This repository contains a script that automates the setup of a customized macOS terminal environment. It includes:
- 🖥️ Warp Terminal - A modern, Rust-based terminal
- 🎨 Catppuccin Theme - A soothing pastel theme
- 🔤 Hack Nerd Font - A fantastic font for development
- ⭐ Starship Prompt - A minimal, blazing-fast prompt

## Quick Start

Download and run the script directly:
```bash
curl -O https://raw.githubusercontent.com/Lee-Robinson/mac-terminal-setup/main/setup.sh
chmod +x setup.sh
./setup.sh
```

Or download the ZIP:
1. Click the green "Code" button above
2. Select "Download ZIP"
3. Extract the ZIP
4. Open Terminal to the extracted folder
5. Run:
```bash
chmod +x setup.sh
./setup.sh
```

## Features

- ✨ Automated installation of all required components
- 🔄 Interactive prompts for configuration choices
- 🛡️ Error handling and status feedback
- 🔁 Idempotent installation (safe to run multiple times)

## Components

The script installs and configures:

1. **Homebrew**
   - Package manager for macOS

2. **Warp Terminal**
   - Modern, Rust-based terminal
   - GPU-accelerated
   - Supports themes and customization

3. **Catppuccin Theme**
   - All variants included (Mocha, Macchiato, Frappe, Latte)
   - Soothing pastel color scheme

4. **Hack Nerd Font**
   - Developer-focused font
   - Includes icons and ligatures

5. **Starship Prompt**
   - Cross-shell prompt
   - Gruvbox Rainbow preset included
   - Optional Typecraft configuration

## Post-Installation Steps

After running the script:

1. Open Warp Terminal
2. Set Hack Nerd Font in preferences:
   - ⌘ + , to open settings
   - Navigate to "Appearance" → "Font"
   - Select "Hack Nerd Font"

3. Select your preferred Catppuccin theme:
   - ⌘ + , to open settings
   - Navigate to "Appearance" → "Theme"
   - Choose your preferred Catppuccin variant

## Troubleshooting

If you encounter any issues:

1. **Fonts not showing correctly**
   - Restart Warp Terminal
   - Verify font installation in Font Book

2. **Theme not appearing**
   - Check `~/.warp/themes/` for theme files
   - Restart Warp Terminal

3. **Starship prompt not working**
   - Verify shell configuration in `~/.zshrc` or `~/.bashrc`
   - Restart your terminal

## Resources

- [Warp Terminal Documentation](https://docs.warp.dev/)
- [Catppuccin Theme Repository](https://github.com/catppuccin/warp)
- [Nerd Fonts Website](https://www.nerdfonts.com/)
- [Starship Documentation](https://starship.rs/)

## License

This project is released under the MIT License. See the LICENSE file for details.

## Contributing

Contributions are welcome! Feel
