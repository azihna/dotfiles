" Alihan Zihna
" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Search
Plug 'ctrlpvim/ctrlp.vim'

" Movement
Plug 'easymotion/vim-easymotion'  

" Text Manipulation
Plug 'joom/vim-commentary'  " To comment stuff out/in
Plug 'tpope/vim-sensible'  " Better vim defaults
Plug 'tpope/vim-surround'  " Surround stuff with other stuff

" GUI Enchancements
Plug 'itchyny/lightline.vim'  " StatusBar
Plug 'scrooloose/nerdtree'  " File Explorer
Plug 'tpope/vim-fugitive'  " Git Interface
Plug 'mbbill/undotree'  " Show edit past

" Syntactic language support
Plug 'dense-analysis/ale'
" Plug 'vim-python/python-syntax'  " Better support for Python 3
Plug 'nvie/vim-flake8'  " PEP8 checks for Python
Plug 'stephpy/vim-yaml'  " YAML support
Plug 'elzr/vim-json'  " Better JSON Support
Plug 'mechatroner/rainbow_csv'  " CSV color coding

" tmux integration
Plug 'esamattis/slimux'  " Better tmux integration to use with JNs

" color
Plug 'patstockwell/vim-monokai-tasty'

" Auto-completer
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


call plug#end()

let mapleader=" "  " maps leader to space

set nocompatible  " no backward compat to vi
filetype plugin indent on    " enables automatic indentation
syntax on

" Colors
" the highligh and call method below shows when a line of code
" exceed to 80 columns by marking 81th column with magenta
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
colorscheme vim-monokai-tasty

" Spaces and Tabs
syntax enable     " enable syntax processing
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in TAB when editing
set shiftwidth=4  " controls the depth of autoindentation
set expandtab     " tabs are spaces

" Compat and Paths
set nocompatible
set path+=**  " makes the current wd and subfolders searchable by wildmenu

" UI Config
set relativenumber        " show line numbers
set showcmd       " show commandbar in the bottom
set nocursorline    " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu      " visual autocomplete for command menu
set lazyredraw    " redraw the scene only when you need to
set showmatch     " highlight matching brackets

" Searching & Pasting
set incsearch     " search as characters are entered
set hlsearch      " highlight matches
" set clipboard=unnamed " use the system clipboard
set clipboard+=unnamedplus " use the system clipboard

" Folding
set foldenable    " enable folding
set foldlevelstart=10 " any fold smaller than 10 lines will stay open
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" Python options
au FileType py set encoding=utf-8   " make sure you use utf-8
au FileType py set autoindent   " will indent the next line
au FileType py set smartindent  " will indent the lines after colons

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Plugin Specific
" NERDTree
map <F3> :NERDTreeToggle<CR>

" python-syntax plugin
let python_highlight_all=1 " enable all Python syntax highlighting features

" Undo Tree
nnoremap <F5> :UndotreeToggle<cr>

" Deoplete
let g:deoplete#enable_at_startup=1
" Virtual environment config for Deoplete
let g:python3_host_prog = '/usr/bin/python3'

" Slimux
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

" lightline
set noshowmode  " Unncessary due to lightline
let g:lightline = {'colorscheme': 'jellybeans'}

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" add custom snippets files
let g:neosnippet#snippets_directory='~/.vim/custom_snips'

" ALE
let g:ale_python_pylint_executable = 'pylint3'   " or 'python' for Python 2
" local customization in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

