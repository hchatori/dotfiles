# dotfiles

dotfiles automates the set up and maintenance of a computer for development.

This is intended for use on:
* Any Debian-based Linux distribution (including Windows Subsystem for Linux)

In general, this installs:
* C/C++ (GCC)
* Zsh shell with Oh My Zsh
* Homebrew
* Git (with .gitconfig and .gitignore)
* GDB
* Vim (with .vimrc)
* Go
* Rust

The preferences applied include:
* Nord color scheme
* Fira Code font w/ligatures
* Visual Studio Code + a decently configured Vim
* Use tabs instead of spaces, but display them as 4 spaces

## Usage

1. Download this repo: https://github.com/hchatori/dotfiles/archive/master.zip
2. From the `dotfiles` directory, run: `./install.sh`.

## Maintenance (for my use only)

1. Run `./update.sh` to update `dotfiles` with local changes and updates.
2. Push updated files to `dotfiles/master`.