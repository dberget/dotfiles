" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

"screen flashing
set visualbell
set t_vb=

" Load plugins here (pathogen or vundle)
execute pathogen#infect()

" Turn on syntax highlighting
syntax on

" Set dir to current dir
:set autochdir

" Creates a new line w/o entering insert mode
map <Enter> o<ESC>k
map <S-Enter> O<ESC>j

" For plugins to load correctly
filetype plugin indent on

" Leader commands
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>S :split<CR>

" Paste text to new line
nnoremap <leader>o o<ESC>p
nnoremap <leader>O O<ESC>p

" Switch Panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Testing 
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Security
set modelines=0

" Show line numbers
set relativenumber
set number

" Elixir Syntastic
let g:syntastic_enable_elixir_checker = 1 
let g:syntastic_elixir_checkers = ['elixir']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show file stats
set ruler

" Switch between last two files
nnoremap <leader><leader> <c-^> 

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ctrlP
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|beam|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=80
set colorcolumn=+1
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
    
" Elixir Matchit Functionality
autocmd FileType elixir let b:match_words = '\<\%(case\|cond\|if\|unless\|try\|loop\|receive\|fn\|' .
      \ 'defmodule\|defimpl\|defmacro\|defdelegate\|defexception\|defcallback\|defoverridable\|defp\|def\|test\)\>=\@!:' .
      \ '\<\%(else\|elsif\|catch\|after\|rescue\)\>:' .
      \ '\<end\>,{:},\[:\],(:)'

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" delimitMate 
let delimitMate_expand_cr = 1

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized
