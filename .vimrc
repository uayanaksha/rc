" Options
syntax on
filetype on
filetype plugin indent on
set cot=menuone,fuzzy
set dict=~/.vim/dictionary.txt
set encoding=utf-8
set et is sb sc si sm smd  spr sta title nu rnu wmnu
set nocp nohls noswf 
set so=8 sw=4 ts=4 sts=4 hi=1000 ls=2
set wig=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wim=full
set wop=pum,tagfile

" Net setting
let g:netrw_banner=0
let g:netrw_liststyle=3

" Plugins
call plug#begin('~/.vim/plugged')
  " Plug 'flazz/vim-colorschemes'
  Plug 'arzg/vim-colors-xcode'
  Plug 'junegunn/fzf'
  Plug 'lervag/vimtex'
  Plug 'neoclide/coc.nvim'
  Plug 'tpope/vim-fugitive'
call plug#end()

" vim ~7.3 enable undofile.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" coc tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" coc select from popup
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Status line
set stl=
set stl+=\ %F\ %M\ %Y\ %R
set stl+=\[%b\ =>\ 0x%B\]\ \[%l_%c\]\ %p%%\
set laststatus=1

" Disable Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Colorscheme
set background=dark
if exists("syntax_on")
    syntax reset
    colo xcodehc
endif
hi Folded guibg=#888888 guifg=#080808

" Keymaps
let mapleader = " "

"remap split navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"adjust split sizes easier
noremap <silent> <C-Left>   :vertical resize +3<CR>
noremap <silent> <C-Right>  :vertical resize -3<CR>
noremap <silent> <C-Up>     :resize +3<CR>
noremap <silent> <C-Down>   :resize -3<CR>

"change split windows from vertical to horizontal or vice versa
map <leader>z   :Lexplore 20<CR>
map <leader>th  <C-w>t<C-w>H
map <leader>tk  <C-w>t<C-w>K

" automatically close brackets, parethesis, double quotes, and single quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap /* /**/<left><left>
