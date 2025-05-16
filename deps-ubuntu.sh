sudo add-apt-repository ppa:neovim-ppa/unstable
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - >~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
source ~/.bashrc
sudo apt update
sudo apt upgrade
nvm install 14
sudo apt install build-essential fd-find fzf ripgrep python3-venv python3-pip unzip
