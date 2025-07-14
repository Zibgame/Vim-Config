#!/bin/bash

set -e

REPO_URL="https://github.com/Zibgame/Vim-Config.git"
CLONE_DIR="$HOME/Vim-Config-Setup"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

echo "=== Setup Vim Config depuis GitHub ==="

# Cloner le repo si pas déjà cloné
if [ -d "$CLONE_DIR" ]; then
  echo "Le dossier $CLONE_DIR existe déjà, mise à jour du repo..."
  git -C "$CLONE_DIR" pull
else
  echo "Clonage du repo dans $CLONE_DIR..."
  git clone "$REPO_URL" "$CLONE_DIR"
fi

# Installer Node.js si besoin
if command_exists node; then
  echo "Node.js est déjà installé : $(node -v)"
else
  echo "Installation de Node.js (v18)..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# Installer clang si besoin
if command_exists clang; then
  echo "clang est déjà installé : $(clang --version | head -n1)"
else
  echo "Installation de clang..."
  sudo apt-get install -y clang
fi

# Installer vim-plug si besoin
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  echo "Installation de vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "vim-plug déjà installé."
fi

# Copier la config vimrc depuis le dossier cloné
echo "Copie de la configuration vim depuis le repo..."
cp "$CLONE_DIR/vimrc" ~/.vimrc

# Installer les plugins vim
echo "Installation des plugins Vim..."
vim +PlugInstall +qall

echo "=== Setup terminé ! ==="
echo "Tu peux maintenant lancer vim et profiter de ta configuration."

