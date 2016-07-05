set encoding=utf-8
filetype off
set nu

set hlsearch " Highlight search results

filetype plugin indent on

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jnurmine/Zenburn'
Plug 'neomake/neomake'
Plug 'powerline/powerline'
Plug 'mileszs/ack.vim'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

colorscheme zenburn

nnoremap <F5> :NERDTreeToggle<CR>

let g:deoplete#enable_at_startup = 1

autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 0
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_python_pylint_exe = '/usr/bin/pylint'

let g:airline_powerline_fonts = 1

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(pyc|so|dll)$',
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

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

