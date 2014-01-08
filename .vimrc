

colorscheme molokai
"let g:Powerline_symbols = 'fancy'
set nocompatible										 " Disable vi-compatibility
set laststatus=2  									 " Always show the statusline

if has('gui_running')

	colorscheme molokai
	
	set guioptions=
	set guifont=Source\ Code\ Pro\ Medium\ 10
	set background=dark

endif
:autocmd InsertEnter,InsertLeave * set cul!
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif
set directory=/tmp
set encoding=utf-8
set nowrap
set cino=:0g0(0,W2										"set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ttyfast
set title
"set list
set history=1000
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set showmatch                        " Show matching braces when over one
set ruler                            " Always show current position
set number                           " Always show line-numbers
set numberwidth=4                    " Line-number margin width
set mousehide                        " Do not show mouse while typing
set antialias                        " Pretty fonts
set t_Co=256                         " 256-color palletes
set linespace=1                      " Don't insert any extra pixel lines
set lazyredraw                       " Don't redraw while running macros
set wildmenu                         " Wild menu
set wildmode=longest,list,full       " Wild menu options

autocmd FileType python set omnifunc=pythoncomplete#Complete 
syntax on
filetype plugin indent on

set fillchars=diff:⣿,vert:│
set fillchars=diff:⣿,vert:\|

nnoremap / /\v
vnoremap / /\v

set noswapfile 

" quick edit conf files
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>eb :vsplit ~/.bashrc<cr>
nnoremap <leader>ef :vsplit ~/.config/fish/config.fish<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
function! Font_size_up_one()
	let guifont_list = split(&guifont, " ")
	let guifont_list[-1] = guifont_list[-1] + 1
	let newfont = join(guifont_list)
	echo newfont
	let &guifont = newfont
endfunction

function! Font_size_down_one()
	let guifont_list = split(&guifont, " ")
	let guifont_list[-1] = guifont_list[-1] - 1
	let newfont = join(guifont_list)
	echo newfont
	let &guifont = newfont
endfunction

nnoremap +++ :call Font_size_up_one()<CR>
nnoremap --- :call Font_size_down_one()<CR>

augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line ("$") | 
		\ execute 'normal! g`"zvzz' |
		\ endif
augroup END


call pathogen#infect()
call pathogen#helptags()
