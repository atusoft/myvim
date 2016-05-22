set nocompatible
set helplang=cn
set autoindent
set shiftwidth=4
set softtabstop=4
set nobackup
set noswapfile
set mouse=a
set pastetoggle=<F2>
filetype indent on
filetype plugin on 
filetype plugin indent on

execute pathogen#infect()
set backupdir=/tmp
set autoindent
set tabstop=4
set smartindent
set nowrap
set hlsearch "hignlight search result
set backspace=indent,eol,start whichwrap+=<,>,[,] "allow backspace
set nu
" update the :make command to tell Xcode to build

syntax enable
set background=dark
colorscheme Tomorrow-Night-Bright

let g:netrw_winsize=30
let mapleader=","
let g:netrw_winsize = 30
map <silent> <leader>fe :Sexplore!<cr>
" taglist settings
let Tlist_Auto_Open =1
let Tlist_Use_SingleClick=1
let Tlist_Process_File_Always=1
let Tlist_Use_Right_Window = 1  
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Close_On_Select=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Inc_Winwidth=1
"let Tlist_GainFocus_On_ToggleOpen=1 "set focus when taglist open
let tlist_objc_settings = 'ObjectiveC;i:interface;c:class;m:method;p:property'
map <F3> :TlistToggle<cr>
nmap <a-q> :q<cr>
map <c-s> :w<cr>
map <a-t> :tabe %:rTest.%:e<cr>
map <silent><leader>f :call Format()<cr> 
autocmd filetype groovy map <F5> :call Run()<cr>
autocmd BufWritePre *.scala,*.java,*.rb :call Format() 
autocmd BufWritePost *.rb,*.py,*.haml  :!touch tmp/restart.txt
au BufRead,BufNewFile *.erb setfiletype html
au BufRead,BufNewFile *.py set errorformat=%f:%l:\ %m 
au BufRead,BufNewFile *.py set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p 
func! Run()
	exec "w"
	exec "!~/javatools/groovy-1.6.3/bin/groovy %"
endfunc
func! RunPython()
	exec "w"
	exec "make"
endfunc
autocmd filetype groovy map <F6> :call Test()<cr>
func! RubyTest()
	let testfile="test_"+expand('%:t')
	exec testfile
endfunc
func! Test()
	exec "w"
	exec "!groovyc %"
	exec "!~/javatools/groovy-1.6.3/bin/groovy %:rTest.groovy"
endfunc
func! Format()
	let s:currentLine=line(".")
	exec "normal " "gg=G"
	exec ":g/^\\s*$\/d"
	exec "normal " . s:currentLine . "G"
endfunc
autocmd filetype ruby map <F5> :!ruby %<cr>
autocmd filetype ruby map <F6> :call RubyTest()
autocmd filetype python map <F5> :!python %<cr>

" show current line number
set ruler
" ignore case
set ignorecase
" autoload .vimrc
" search word in folder
map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
	let w=expand("<cword>")
	execute "vimgrep "w" **/*.cs"
endfunc

"syntax checker
let g:statline_syntastic = 0
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" indentline
let g:indentLine_char = '|'
set list lcs=tab:\|\ 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in")|NERDTree|endif
map <C-n> :NERDTreeToggle<CR>

