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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-expand-region'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'BufOnly.vim'
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kshenoy/vim-signature'
Plugin 'unblevable/quick-scope'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'

" Theme
Plugin 'altercation/vim-colors-solarized'

" Python
Plugin 'nvie/vim-flake8'

" Go
Plugin 'fatih/vim-go'

" Clojure
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'raymond-w-ko/vim-niji'

call vundle#end()

runtime macros/matchit.vim

filetype plugin indent on

" Load theme
syntax enable
set background=dark
colorscheme solarized

" Visual stuff
set number
set relativenumber
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
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor --ignore .git -g ""'

set runtimepath^=~/.dotfiles/bundle/ctrlp

nnoremap <silent> <c-p> :ClearCtrlPCache<cr>\|:CtrlP<cr>

" ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'

" vim-go
let go_highlight_space_tab_error = 0
let go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
