syntax on
syntax enable
set shell=bash
cd $HOME
" ✘
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()
"Vundle updates itself. How cool!
Bundle 'gmarik/vundle'

"Powerline Replacement
Bundle 'bling/vim-airline'


"Languages/Syntax
Bundle 'elixir-lang/vim-elixir'
Bundle 'jimenezrick/vimerl'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-rake'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'travitch/hasksyn'
" Bundle 'PProvost/vim-ps1'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'carlhuda/janus'
" Bundle 'dag/vim-fish'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
"Bundle 'nelstrom/vim-textobj-rubyblock'

"Navigation
Bundle "kien/ctrlp.vim"

"Tools
Bundle 'scrooloose/syntastic'
Bundle 'taglist.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-bundler'
"Bundle 'tpope/vim-dispatch'
Bundle 'airblade/vim-rooter'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
" Bundle 'FredKSchott/CoVim'
" Bundle 'vcscommand.vim'
" Bundle 'vim-scripts/AutoTag'

"Appearance
" Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle "bitfyre/vim-indent-html"
" Bundle 'Lokaltog/powerline'
" Bundle 'vim-scripts/Zenburn'


set relativenumber
" set autochdir
set autowrite
set background=dark
set backspace=indent,eol,start
set nocursorline
set diffopt+=vertical
set fillchars=vert:│,fold:-,diff:-
set foldlevelstart=3
set foldmethod=indent
set guifont=\DejaVu\ Sans\ Mono\ for\ Powerline\ 12
set guioptions-=m
set guioptions-=r
set guioptions-=T
set expandtab
set hidden
set history=50
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set winwidth=79

set listchars=""
"set listchars=tab:▸▸
set listchars=tab:\ \ 
set listchars+=trail:✘
set hlsearch
set number
set showcmd
set showmatch
set noshowmode
set smartcase
set tabstop=2 softtabstop=2 shiftwidth=2
set t_Co=256
set wildmenu
set wildignore=*.o,*.swp,*.class
set wildmode=list:longest
set nowrap

if has("mouse")
	set mouse=a
endif

if has("autocmd")
	filetype plugin indent on

	if exists("+omnifunc")
		autocmd Filetype *
			\if &omnifunc == "" |
			\	setlocal omnifunc=syntaxcomplete#Complete |
			\endif
	endif

	augroup vimrcEx
		autocmd!
		autocmd FileType vim setlocal textwidth=78
		autocmd BufWritePost .vimrc nested :source $MYVIMRC
		autocmd BufReadPost *
			\if line("'\"") > 1 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\endif
	augroup END

endif

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"

" Keybind to edit vimrc
nmap <Leader>v :tabedit $MYVIMRC<CR>

" Keybinds to make the global register less annoying
map <Leader>p :set paste<CR>"+]p:set nopaste<CR>
map <Leader>P :set paste<CR>"+]P:set nopaste<CR>
map <Leader>y "+y
map <Leader>Y "+Y

"Config vroom
let g:vroom_write_all = 1
let g:vroom_map_keys = 0
let g:vroom_use_bundle_exec = 1
let g:vroom_use_dispatch = 1

nmap <leader>t :call vroom#RunNearestTest()<CR>
nmap <leader>T :call vroom#RunTestFile()<CR>

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>q :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Keybind to toggle the toolbar and menu in gVim
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
	\set guioptions-=T <Bar>
	\set guioptions-=m <Bar>
\else <Bar>
	\set guioptions+=T <Bar>
	\set guioptions+=m <Bar>
\endif<CR>

" tab stuff
autocmd FileType go setlocal noexpandtab

" Keybind to toggle spell checking
map <F7> :set spell!<CR>

" Keybind to show syntax item under cursor
map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let loaded_matchparen = 1

" Enable rspec syntax highlighting everywhere
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect
highlight def link rubyRspec Function

" enable rails omni-complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_class_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1

let ruby_operators = 1
let g:solarized_termtrans = 1

let g:gist_post_private = 1

color solarized

if has("gui_running")
  "gui stuff
else
  let g:Powerline_symbols = 'unicode'
endif
