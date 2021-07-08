#!/bin/sh

msg() {
	echo "***************************************************"
	echo -e "\n$1\n"
	echo "***************************************************"
}

echo "Checking for things to install..."

# Check PATH (echo $PATH) to make sure full PATH is in WSL
# chmod u+x /mnt/c/Users/hchat/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe
# chmod u+x /mnt/c/Users/hchat/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code
# ln -s /mnt/c/Users/hchat/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code code

msg "Installing essentials..."
sudo apt update && sudo apt upgrade
sudo apt install build-essential curl file git wget zsh


DIR=~/.oh-my-zsh
if [ ! -d "$DIR" ]; then
	msg "Installing Oh My Zsh and making zsh the default shell..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo chsh -s $(which zsh)
fi

if [ ! -f "`which brew`" ]; then
	msg "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/$(echo $USER)/.zprofile
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if ! brew ls --versions git > /dev/null; then
	msg "Installing Git..."
	brew install git
fi

if ! brew ls --versions gdb > /dev/null; then
	msg "Installing GDB..."
	brew install gdb
fi

if ! brew ls --versions vim > /dev/null; then
	msg "Installing Vim..."
	brew install vim
fi

if ! brew ls --versions go > /dev/null; then
	msg "Installing Go..."
	brew install go
fi

if ! rustup -V > /dev/null; then
	msg "Installing Rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [ ! -e ~/.gitconfig ]; then
	msg "Setting up .gitconfig..."
	echo "Enter your first and last name:"
	read firstname lastname
	echo "Enter your email address:"
	read email
	git config --global user.name "$firstname $lastname"
	git config --global user.email "$email"
	git config --global core.editor "code --wait"
	git config --global core.excludesfile ~/.gitignore
	git config --global credential.helper store
fi

msg "Copying over dotfiles..."
cp .gitignore ~/
cp .vimrc ~/

msg "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Done!"