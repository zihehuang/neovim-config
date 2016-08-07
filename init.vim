call plug#begin('~/.config/nvim/')
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
call plug#end()

set showcmd
set scrolloff=5
set number
set ruler
set cursorline
set nowrap
""set clipboard+=unnamedplus
set ignorecase
set expandtab           " Insert spaces when TAB is pressed.
"set tabstop=2           " Render TABs using this many spaces.
"set shiftwidth=2        " Indentation amount for < and > commands.
set splitright
set formatoptions+=o
set wildignore+=**/node_modules/**
set foldmethod=indent

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

autocmd Filetype solidity setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
let g:syntastic_javascript_checkers = ['standard']

function ToggleFormat()
  if(&ft == "javascript.jsx")
    silent !standard-format -w % | set autoread
  endif
endfunction
nnoremap <F8> :call ToggleFormat()<cr>
"autocmd bufwritepost *.js silent !standard-format -w % 
"set autoread 
