
execute pathogen#infect()

inoremap jk <ESC>
filetype plugin indent on
syntax on
set encoding=utf-8
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set showmatch
vnoremap . :norm.<CR>
set ruler
set showmode
set showcmd
set title
set wildmenu
set background=dark
colorscheme thamaturge 
set ignorecase
set smartcase
set smartindent
set grepprg=ack
let mapleader = ","
set hlsearch
let laststatus=2
let g:airline#extensions#tabline#enabled = 1
let mapleader = "\<Space>"
set clipboard=unnamed

" ctrl-p optimization, use the_silver_searcher and cache results
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 endif

 " vim take a long time to open ruby files : 
if !empty($MY_RUBY_HOME)
   let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif
