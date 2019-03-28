
execute pathogen#infect()

inoremap jk <ESC>
filetype plugin indent on
syntax on
set encoding=utf-8
set number! relativenumber!
set autoindent
set showmatch
vnoremap . :norm.<CR>
set ruler
set showmode
set showcmd
set title
set wildmenu
" incremental search
set incsearch
" For regular expressions turn magic on
set magic
set wrap
set background=light
let g:solarized_termcolors=256
" colorscheme solarized 
colorscheme mojave
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
set listchars=tab:!·,trail:·
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap h <NOP>
noremap l <NOP>
" airline config
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ctrl-p optimization, use the_silver_searcher and cache results
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore=node_modules/'
 endif

 " vim take a long time to open ruby files : 
if !empty($MY_RUBY_HOME)
   let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" FZF
nmap <C-P> :FZF<CR>
nmap ; :Buffers<CR>

" setting ack to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" settings for ctrl-space
set nocompatible
set hidden
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" shortcut for search and replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" copying to clipboard binding
vnoremap <C-c> :w !pbcopy<enter><enter>

" diffchar.vim
let g:DiffUnit="Char"
if &diff
    colorscheme evening
endif
set tabstop=2
set shiftwidth=2
set expandtab
" remove trailing whitespaces`
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.js %s/\s\+$//e

" ruby foldable blocks
"let g:ruby_fold_lines_limit = 100

" notes
"let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Notes']
let test#ruby#minitest#options = '--fail-fast'

" annoying beeps when you keep Shift pressed for too long, and end up pressing
" W instead of w for save
command! W  write
:command WQ wq
:command Wq wq

" TODO: commentary
" TODO: remap esc to caps lock


" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

runtime macros/matchit.vim

" Rails routes to controller action
"function! RouteController(path)
"  let cwd = getcwd()
"  let path = a:path
"  :new "" . cwd . "app/controllers/" . path . "_controller.rb"
"endfunction

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" file jumping
set path+=**

" tag jumping
command! MakeTags !ctags -R .

" show the commands you type
set showcmd

nnoremap ,jit :-1read $HOME/.vim/.jestit.js<CR>3wi
nnoremap ,jd :-1read $HOME/.vim/.jest.js<CR>3wi
nnoremap ,rtl :-1read $HOME/.vim/.react-testing-library.js<CR>:5<CR>ci'

