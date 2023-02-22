" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
syntax on
set rnu
set nu
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set autoindent
set scrolloff   =5
" set cindent
" set number
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
nnoremap  <C-L>   <C-W><C-L>
nnoremap  <C-H>   <C-W><C-H>
nnoremap  <C-J>   <C-W><C-J>
nnoremap  <C-K>   <C-W><C-K>
nnoremap  <C-P>   :Ex<CR>
