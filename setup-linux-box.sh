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

# install TPM
TPM_DIR="$HOME/.tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm $TPM_DIR

echo "TPM installed successfully!"
echo "Now opening tmux session and installing plugins..."

tmux new-session -d -s tpm_install_session

# I use C-s as my prefix for tmux. if you don't have that. change this line
tmux send-keys -t tpm_install_session C-s "I" C-m

tmux attach -t tpm_install_session

exit 0

