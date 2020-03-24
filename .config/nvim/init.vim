" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
"Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rust-lang/rust.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx' ] }
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
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

let g:coc_snippet_next = '<tab>'

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
" stop interfering vim-go with coc
nmap <S-k> <Nop>
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
  autocmd BufWritePre *{.go,.rs,.c,.cpp} :call CocActionAsync('format')
  autocmd BufWritePre *{.go,.rs,.c,.cpp} OR
augroup END


" ---------- coc.nvim config end ------------"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0

let g:prettier#autoformat = 0

" Show syntax highlighting groups for word under cursor
nnoremap <silent> <leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

set background=dark
set termguicolors
" colorscheme dracula
colorscheme one
let g:one_allow_italics = 1
 
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
  function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction
  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

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
