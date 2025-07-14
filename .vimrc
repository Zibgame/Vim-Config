" =======================
" Options générales
" =======================
set nocompatible               " Mode non compatible vi, pour utiliser Vim complet
filetype plugin indent on      " Activation des plugins et indent automatique selon le type de fichier
syntax on                      " Activation de la coloration syntaxique
set mouse=a                   " Souris active partout (normal, insert, visual...)
set clipboard=unnamedplus      " Utiliser le presse-papiers système
set termguicolors              " Couleurs 24-bit si terminal supporte
set noshowmode                 " Désactive le message -- INSERT -- natif

set encoding=UTF-8            " Encodage UTF-8

" =======================
" Variables perso
" =======================
let g:user42 = 'zcadinot'
let g:mail42 = 'zcadinot@student.42.fr'

" =======================
" Plugins avec vim-plug
" =======================
call plug#begin('~/.vim/plugged')

" Thèmes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
" Plug 'folke/tokyonight.nvim' " Pour NeoVim uniquement

" Icônes
Plug 'ryanoasis/vim-devicons'

" Explorateur de fichiers
Plug 'preservim/nerdtree'

" Barre de statut (choix entre lightline ou airline, ici lightline)
Plug 'itchyny/lightline.vim'
Plug 'dracula/lightline'


" Gestion de code : surround, commentaires, git
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

" Syntaxe améliorée
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Pour NeoVim uniquement

" Autocompletion intelligente
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" =======================
" Configs spécifiques
" =======================

" Utiliser tab pour naviguer les suggestions
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set cmdheight=1
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <C-n> :NERDTreeToggle<CR>

" Sauvegarder avec Ctrl+S en mode normal et insert
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Sauvegarder avec Ctrl+Z en mode normal et insert
nnoremap <C-z> :u<CR>
inoremap <C-z> <Esc>:u<CR>a


colorscheme dracula
