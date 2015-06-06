" Removes vi compatibility
set nocompatible

" Vundle
filetype off

set encoding=utf-8

set rtp+=~/.dotfiles/bundle/Vundle.vim
call vundle#begin()

" Essentials
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fholgado/minibufexpl.vim'

" Theme
Plugin 'Wombat'
Plugin 'wombat256.vim'

" Python
Plugin 'nvie/vim-flake8'
Plugin 'mitsuhiko/vim-jinja'

" Go
Plugin 'fatih/vim-go'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

filetype plugin indent on

" Load Wombat theme
if has("gui_running")
    colorscheme wombat
else
    set t_Co=256
    syntax on
    colorscheme wombat256mod
endif

" Set font
if has("mac")
    set gfn=Inconsolata:h13
else
    set gfn=Inconsolata\ Medium\ 10
endif

" Visual stuff
set number
set title
set laststatus=2

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.
autocmd filetype go set nolist

" Buffer
set hidden

" Indentation
set nowrap
set tabstop=4
set shiftwidth=4
set shiftround
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set pastetoggle=<F2>

filetype indent plugin on

" Searching
set showmatch
set smartcase
set hlsearch
set incsearch

" Alerts
set noerrorbells
set visualbell

" Backups and history
set nobackup
set undolevels=1000
set noswapfile

" Ignore
set wildignore+=node_modules/,__pycache__

" Mouse
set mouse=a

" Keyboard
set backspace=indent,eol,start

" Tabs
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>

" NERDTree
nmap <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.DS_Store$']
let NERDTreeShowHidden=1

" Powerline
let g:Powerline_symbols = 'compatible'

" Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Highlighting for various file types
au BufRead,BufNewFile *.twig set filetype=jinja
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.html set filetype=jinja
au BufRead,BufNewFile *.html set filetype=htmljinja
au BufRead,BufNewFile Vagrantfile set filetype=ruby

" Command aliases
cnoreabbrev nt NERDTree

" Fix for syntax highlighting to appear correctly
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * :syntax sync minlines=99999

" Disabled arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remapped split pane movement bindings
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Remapped save to Ctrl+s
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|pycache|classes)|(\.(git|hg))$'

set runtimepath^=~/.dotfiles/bundle/ctrlp

" vim-go
let go_highlight_space_tab_error = 0
let go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"

" vim-markdown
let g:vim_markdown_folding_disabled = 1
