let mapleader = ' '

set encoding=UTF-8
set mouse=a
" Json file to show the quotes
let g:vim_json_syntax_conceal = 0
set scrolloff=10
" Reads when file changes
set autoread 
" Map leader to ,
set foldmethod=indent
set foldlevelstart=99
" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
" wrapping of lint
set wrap linebreak nolist
set undolevels=1000
set undoreload=10000

"nmap <leader>n :lnext<cr>
"nmap <leader>p :lprevious<cr>
nmap <leader>v :call ToggleAllSplits()<cr>
nmap <C-s> :w<cr>
nmap <C-q> :q<cr>
imap <C-s> <Esc>:w<cr>
nnoremap <Leader>s :%s/\v<<C-r><C-w>>/
nnoremap / /\v\c
vnoremap / /\v\c

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" sometime required for autocompletion to work
" command! LanguageClientRestart :execute ':LanguageClientStop' | :execute ':LanguageClientStart'

map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" Strict mode to make vim habit better
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No Right for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>

inoremap <Left> <C-o>:echo "No left for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>

" Using tab shortcut
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>
nnoremap <C-x> :bdelete<CR>


set completeopt-=preview "Disable the preview window
set cursorline       "hilight the line of the cursor
set timeoutlen=500 
" Tab control
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set clipboard=unnamedplus
set colorcolumn=80

"Setting relative line numbering
set number relativenumber
set nonumber norelativenumber  " turn hybrid line numbers off
set number! relativenumber!    " toggle hybrid line numbersk
" for transparancy
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

if has('nvim')
  "terminal
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
  " issue when terminal has vi keybinding
  " tnoremap <C-[> <c-\><c-n><cr>
   " Change split focus
  nnoremap <C-h> <c-w>h
  nnoremap <C-j> <c-w>j
  nnoremap <C-k> <c-w>k
  nnoremap <C-l> <c-w>l
endif

set noshowmode

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


let s:toggleAllSplitsStatus=0

fun! ToggleAllSplits()
  if s:toggleAllSplitsStatus
    let s:toggleAllSplitsStatus=0
    :exe "normal \<C-w>=\<cr>"
  else
    let s:toggleAllSplitsStatus=1
    :exe "normal \<C-w>_\<cr>"
    :exe "normal \<C-w>|\<cr>"
  endif
endfun


