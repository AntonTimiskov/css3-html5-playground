execute pathogen#infect() 
syntax on
filetype plugin indent on

map <F4> <ESC>:w<CR>
map <F5> <ESC>:!./%<CR>
map <F7> <ESC>:nohlsearch<CR>
map <F8> <ESC>:e<CR>
map <F2> <ESC>:bn<CR>
map <F3> <ESC>:bp<CR>

colorscheme slate

set nocompatible

set showfulltag
set showmode
set expandtab
set shiftwidth=2
set softtabstop=2
set showcmd
set incsearch
set hlsearch

set autochdir

set autoindent
set smartindent
set virtualedit=all
set ruler
set autoread
set wrap

inoremap <Bar> <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  echom 'Next Step!'
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

filetype plugin indent on

Bundle "pangloss/vim-javascript"
Bundle "tpope/vim-sensible"
