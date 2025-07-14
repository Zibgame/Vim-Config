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
