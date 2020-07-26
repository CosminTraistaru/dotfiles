set encoding=utf-8
filetype off
set nu
set relativenumber
set noerrorbells
let mapleader=","
set clipboard=unnamed

set hlsearch " Highlight search results

" Buffer move
map <F12> :bnext<CR>
map <F11> :bprev<CR>

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on

call plug#begin('~/.config/nvim/autoload')
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
" Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-plug/'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'jnurmine/Zenburn'
Plug 'neomake/neomake'
Plug 'powerline/powerline'
Plug 'mileszs/ack.vim'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'sbdchd/neoformat'
Plug 'mikelue/vim-maven-plugin'
Plug 'janko-m/vim-test'
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme zenburn

let g:javascript_plugin_jsdoc = 1

nnoremap <F5> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = []
"let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_completion_start_length = 5

autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 0
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_pylint_exe = '/usr/local/bin/pylint'

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.class'' --ignore ''.gitignore'' --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|bash_sessions)$|Dropbox\|static\|__pycache__$',
    \ 'file': '\v\.(pyc|so|dll|dmg|jpg|jpeg|dat)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set clipboard+=unnamedplus " shared clipboard

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix

" YouCompleteMe settings
" let g:ycm_python_binary_path = '/usr/bin/python3'
" nnoremap gt :YcmCompleter GoToDefinition

" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" File and Window Management
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Line at 90 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
