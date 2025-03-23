
cp .bashrc ~/
sudo apt update
sudo apt install -y tmux
sudo apt install -y neovim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install -y eza 
sudo apt install -y zoxide
sudo apt install -y jq

mkdir ~/.config
mkdir ~/.config/nvim
cp init.lua ~/.config/nvim
cp .tmux.conf ~/

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

echo 'export PATH="$HOME/.fzf/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
