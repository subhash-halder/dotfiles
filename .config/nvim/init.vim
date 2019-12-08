" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
call plug#end()

let mapleader = ' '
" ---------- coc.nvim config start ------------"
" coc config
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <S-F8> <Plug>(coc-diagnostic-prev)
nmap <silent> <F8> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" Remap for do codeAction of current line
nmap <F7>  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <F6> <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

augroup fmt
  autocmd!
  autocmd BufWritePre *{.go,.rs,.c,.cpp} Format
  autocmd BufWritePre *{.go,.rs,.c,.cpp} OR
augroup END


" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set laststatus=2
"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
"set statusline+=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'gitchanges', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineGitBranch',
  \   'gitchanges': 'LightlineGitChanges',
  \   'cocstatus': 'coc#status',
  \ }
\ }

function! LightlineGitBranch() 
  let status = get(g:, 'coc_git_status', '')
  return  status
endfunction

function! LightlineGitChanges()
  let status = get(b:, 'coc_git_status', '')
  return  status
endfunction

" ---------- coc.nvim config end ------------"

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
" nmap <silent> <leader>k :Explore<cr>
" NerdTree config
 let NERDTreeShowHidden=1
 let NERDTreeMinimalUI=1
 let NEDTreeDirArrows=1
" Toggle NERDTree
 nmap <silent> <leader>o :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
 nmap <silent> <leader>y :NERDTreeFind<cr>
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
" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

fun! FZFFileFiender()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

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


nmap <C-p> :call FZFFileFiender()<cr>
nmap <leader>b :Buffer<cr>
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

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : '☒',
    \ "Unknown"   : "?"
    \ }
" let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=['.git$[[dir]]', '.swp', '.DS_Store', '\~$']
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:indentLine_char = '|'

set completeopt-=preview "Disable the preview window
set background=dark
colorscheme dracula
set termguicolors

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
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE
