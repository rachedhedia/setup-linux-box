cp .bashrc ~/
sudo apt update
sudo apt install -y tmux
sudo apt install -y neovim
sudo apt install -y btop
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install -y eza
sudo apt install -y zoxide
sudo apt install -y jq

git clone https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim

mkdir ~/.config
mkdir ~/.config/nvim
cp init.lua ~/.config/nvim
cp .tmux.conf ~/

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

curl -Lo pet.tar.gz "https://github.com/knqyf263/pet/releases/download/v1.0.1/pet_1.0.1_linux_386.tar.gz"
tar xf pet.tar.gz pet
sudo install pet -D -t /usr/local/bin/

echo 'export PATH="$HOME/.fzf/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
