#/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
scripts_repo="$HOME/scripts"


# upgrade existing packages
sudo apt update -y &&\
    sudo apt upgrade -y

# install packages
sudo apt update -y &&\
    sudo apt install -y \
	 apt-transport-https \
	 bash \
	 ca-certificates \
	 curl \
	 emacs25 \
	 git \
	 gnupg-agent \
	 software-properties-common \
	 zsh

# docker & docker-compose install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update -y &&\
    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

sudo usermod -aG docker $USER

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# oh-my-zsh setup
sudo chsh -s $(which zsh) ubuntu
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf "$scripts_repo/zsh/zshrc.dotfile" "$HOME/.zshrc"
ln -sf "$scripts_repo/zsh/sunrise.zsh-theme" "$HOME/.oh-my-zsh/themes/sunrise.zsh-theme"

# git setup
ln -sf "$scripts_repo/git/gitconfig" "$scripts_repo/.gitconfig"
