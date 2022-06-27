" General
set shell=bash
set encoding=utf-8
set mouse=a
set wildignore=*.o,*/.git/*

set autoread
set autowrite
au FocusGained,BufEnter * checktime

syntax enable 
filetype on
filetype plugin on

set smartcase
set magic


" Plug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Start NERDTree, unless a file or session is specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Ui
set title
set number
set scrolloff=7
colorscheme delek

set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

set foldenable
set foldmethod=syntax


" Mappings
let mapleader="\<Space>"

inoremap jk <esc>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :wq<cr>

xnoremap < <gv
xnoremap > >gv

nnoremap <silent><leader>h :noh<cr>

nnoremap ; $a;<esc>

nnoremap <leader>t :NERDTreeToggle<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
