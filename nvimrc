set encoding=utf-8
filetype off
set nu

set hlsearch " Highlight search results

" Buffer move
map <F12> :bnext<CR>
map <F11> :bprev<CR>

filetype plugin indent on

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
Plug '907th/vim-auto-save'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

colorscheme zenburn

let g:javascript_plugin_jsdoc = 1

" AutoSave Plugin Settings
let g:auto_save = 1

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

let g:deoplete#enable_at_startup = 1

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
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|bash_sessions)$|Dropbox\|static\',
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

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
