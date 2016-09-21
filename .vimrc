" Use 256 colors
" set t_Co=256
set termguicolors
set t_ut=

" Initializing plugins

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'klen/python-mode'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'benmills/vimux'
Plug 'flazz/vim-colorschemes'
call plug#end()

" Sets the colorscheme to solarized
syntax on
set background=dark
colorscheme atom

" Plugin Settings

" YouCompleteMe
"let g:ycm_confirm_extra_conf = 0

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-c> :NERDTreeToggle<CR>

" NerdCommenter
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" Basic key mapping
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
map <F8> :%!astyle<CR>
nnoremap <C-s> :w!<CR>
nnoremap <leader>q :wq!<CR>
nnoremap <leader>f :set spell!<CR>
nnoremap <leader>y "+Y
nnoremap <leader>p "+p
vmap <leader>y "+y

"Vimux
nnoremap <leader>t :VimuxPromptCommand<CR>
nnoremap <leader>r :VimuxRunLastCommand<CR>

"Close annoying buffer window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Set number line
set nu

"Set highlighting
set nohlsearch

"Set indents
set expandtab
set shiftwidth=2
set softtabstop=2

"Set folding
set foldmethod=indent
set nofoldenable

"Needed for Airline to work
set laststatus=2

"Enable mouse scrolling
:set mouse=a

"Enable spellcheck
set nospell spelllang=en_us

"Enable '.' in visual mode
vnoremap . :norm.<CR>

"Set backspace to normal use
set backspace=2

"Set nowrap
set nowrap

"Autload changes
set autoread

