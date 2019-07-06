" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'kadekillary/subtle_solo'
"Plug 'aradunovic/perun.vim'
"Plug 'morhetz/gruvbox'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'lifepillar/vim-solarized8'
"Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
"Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
"Plug 'cloudhead/neovim-fuzzy'
"Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" HTML plugins
Plug 'mattn/emmet-vim'
" JavaScript plugins
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'elzr/vim-json', { 'for': 'json' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'jiangmiao/auto-pairs'


Plug 'Shougo/echodoc'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'wokalski/autocomplete-flow'
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm i -g flow-bin' } 
"Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ruanyl/vim-fixmyjs'
Plug 'sbdchd/neoformat'
"Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
Plug 'jaawerth/neomake-local-eslint-first'
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Initialize plugin system
call plug#end()


let g:LanguageClient_serverCommands = {
    \ 'javascript': ['npx', 'flow', 'lsp'],
    \ 'javascript.jsx': ['npx', 'flow', 'lsp'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ 'c': ['/usr/bin/clangd'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'go': ['$HOME/Documents/work/go/bin/gopls'],
    \ }
 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

set encoding=UTF-8
set mouse=a
"set guifont=Ubuntu_Mono_Nerd_Font_Complete:h11
" Json file to show the quotes
let g:javascript_plugin_flow = 1
let g:vim_json_syntax_conceal = 0
let g:prettier#config#tab_width = 2
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#config#trailing_comma = 'es5'
let g:neoformat_enabled_javascript = ['prettier']
let g:prettier#exec_cmd_async = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
set scrolloff=10
" Reads when file changes
set autoread 
"let g:spacevim_enable_guicolors=0
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#formatter='unique_tail'
" Map leader to ,
let mapleader = ' '
" imap jj <ESC>
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
  tnoremap <C-[> <c-\><c-n><cr>
   " Change split focus
  nnoremap <C-h> <c-w>h
  nnoremap <C-j> <c-w>j
  nnoremap <C-k> <c-w>k
  nnoremap <C-l> <c-w>l
endif

" make YCM compatible with UltiSnips 
"let g:ycm_key_list_select_completion = ['<C-n>']
"let g:ycm_key_list_previous_completion = ['<C-p>']

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:echodoc#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#snippets_directory='$HOME/.config/nvim/snippets'
" Use tern_for_vim.
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]
" neosnippet disable runtime snippest
"let g:neosnippet#disable_runtime_snippets = 1
set noshowmode
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" neo snippets end

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<C-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

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
nmap <leader>n :lnext<cr>
nmap <leader>p :lprevious<cr>
nmap <leader>v :call ToggleAllSplits()<cr>
nmap <C-s> :w<cr>
nmap <C-q> :q<cr>
imap <C-s> <Esc>:w<cr>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


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
let g:airline_theme = "hybrid"
let g:airline_powerline_fonts = 1
let g:indentLine_char = '|'

" Start autocompletion after 2 chars
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window 
set completeopt-=preview "Disable the preview window
"let g:ycm_add_preview_to_completeopt = 0
let g:airline_theme='onedark'
set background=dark
"colorscheme hybrid_material
"colorscheme subtle_dark
"colorscheme perun
"colorscheme gruvbox
"colorscheme PaperColor
"colorscheme monokai_pro
" colorscheme solarized8
colorscheme dracula
"colorscheme onedark
"colorscheme pink-moon
"colorscheme vimterial
set termguicolors

set cursorline       "hilight the line of the cursor
set timeoutlen=500 
" set laststatus=2 " show the satus line all the time

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" eslint configuration
"let g:syntastic_always_populate_loc_list = 0 
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_scss_enabled_makers = ['csslint']
call neomake#configure#automake('nrwi', 500)
" let g:neomake_open_list = 3
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
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
