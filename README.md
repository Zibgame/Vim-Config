# 💤 Zibgame Custom Vim Config

Welcome to my personalized Vim configuration!  
This setup is designed to improve productivity and comfort by providing a clean and powerful Vim environment with my favorite plugins and settings. 💻✨

---

## 🎯 Why This Config?

This config includes essential plugins for file navigation, syntax highlighting, Git integration, commenting, and smart autocompletion.  
It’s tailored for efficient coding and ease of use.

---

## 🛠 Installation Guide

To install this config, copy and paste the following block in your terminal:

```bash
# Clone the repo
git clone https://github.com/Zibgame/Vim-Config.git

# Copy the .vimrc to your home directory
cp Vim-Config/.vimrc ~/

# Install vim-plug (plugin manager) if not installed
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove the cloned repo folder
rm -rf Vim-Config

# Open Vim and install plugins
vim +'PlugInstall --sync' +qa
