" Initializing plugins

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'klen/python-mode'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'benmills/vimux'
call plug#end()

set background=light

" Plugin Settings

" Clang Complete
let g:clang_library_path="/usr/lib/llvm-3.4/lib"
let g:clang_complet_auto=1
let g:clang_user_options="-std=c++11"

" Syntastic
let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_compiler_options="-std=c++11"

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Begin Mapping

" Nerdtree
map <C-c> :NERDTreeToggle<CR>

" Basic key mapping
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
map <F8> :%!astyle<CR>
nnoremap <leader>s :w!<CR>
nnoremap <leader>q :wq!<CR>
nnoremap <leader>f :set spell!<CR>
set pastetoggle=<leader>p

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

"Allow copy pasting across monitors
set clipboard=unnamed

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
