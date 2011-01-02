set nocompatible
set helplang=cn
set autoindent
set shiftwidth=4
set softtabstop=4
filetype indent on
filetype plugin on 
filetype plugin indent on
set autoindent
set tabstop=4
set smartindent
set nowrap
set hlsearch "hignlight search result
set backspace=indent,eol,start whichwrap+=<,>,[,] "allow backspace
set nu
syntax on
colorscheme molokai
let g:molokai_original=1
let g:netrw_winsize=30
let g:snippetsEmu_key = "<S-Tab>"
let mapleader=","
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
map <silent> <leader>fe :Sexplore!<cr>
" taglist settings
let Tlist_Use_Right_Window = 1  
let Tlist_Show_One_File = 1  
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1 "set focus when taglist open
map <F3> :TlistToggle<cr>

nmap <F4> :NERDTree<cr>
nmap <a-q> :q<cr>
map <c-s> :w<cr>
map <a-t> :tabe %:rTest.%:e<cr>
map <c-a-f> gg=G
"edit vimrc and auto load vimrc
nmap <silent><leader>s :source $MYVIMRC<cr>
nmap <silent><leader>v :tabe $MYVIMRC<cr> 
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd filetype groovy map <F5> :call Run()<cr>

func! Run()
		exec "w"
		exec "!~/javatools/groovy-1.6.3/bin/groovy %"
		endfunc

		autocmd filetype groovy map <F6> :call Test()<cr>
func! Test()
		exec "w"
		exec "!groovyc %"
		exec "!~/javatools/groovy-1.6.3/bin/groovy %:rTest.groovy"
endfunc

autocmd filetype ruby map <F5> :!ruby %<cr>
autocmd filetype ruby map <F6> :!spec % 
autocmd filetype python map <F5> :!python %<cr>
map <c-b> :!gant<cr>
" show current line number
set ruler
" ignore case
set ignorecase
" autoload .vimrc
autocmd! bufwritepost .vimrc source /home/lxq/.vimrc 
