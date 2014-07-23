 "-*- coding: utf-8 -*- 
"****************************************************
 "Author:  dxtxiong@gmail.com
 "Create:  2010 May 26 12:40:57 PM
 "Last Modified:  2010 May 26 12:40:57 PM
 "Last Editor:  dxtxiong@gmail.com
 "Filename: ~/.vimrc
 "Description: 
"****************************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set system para
filetype on
syntax on
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
set autowriteall
set nobackup
set autoindent
set noerrorbells
set visualbell t_vb=
set number
set whichwrap=b,s,<,>,[,]
set nowrapscan
set history=200
set ruler
color darkblue
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set scrolloff=3
set encoding=utf-8
set foldmethod=manual
set foldcolumn=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set search para
set incsearch
set hlsearch
set noignorecase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set diff para
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-b "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
        \  " > " . v:fname_out
endfunction
set diffexpr=MyDiff()
set fileencodings=ucs-bom,utf-8,cp936
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc silent %!antiword "%"
autocmd VimLeave * execute "mks! ~/.vimsession/lastsession"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save session for vim
function! VimSession()
    let sessionId = input("pls enter the session name:")
    execute "mks! ~/.vimsession/".sessionId
    echo "Session is saved into ~/.vimsession/".sessionId
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" header function
function! AddTitle()
    call append(0," -*- coding: utf-8 -*- ")
    call append(1,"****************************************************")
    call append(2," Author:  dxtxiong@gmail.com")
    call append(3," Create: " . strftime(" %Y %b %d %X"))
    call append(4," Last Modified: " . strftime(" %Y %b %d %X"))
    call append(5," Last Editor:  dxtxiong@gmail.com")
    call append(6," Filename: " . expand("%"))
    call append(7," Description: ")
    call append(8,"****************************************************")
endfunction

function! LastModified()
    let l = line("$")
    exe "1," . l . "g/Last Modified: /s/Last Modified: .*/Last Modified: " . strftime("%Y %b %d %X")
    exe "1," . l . "g/Last Editor: /s/Last Editor: .*/Last Editor: " . "dxtxiong@gmail.com"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set NerdTreeSortOrder
let g:NERDTreeSortOrder = ['\/$','\.py','\.java','\.psf','\.opt','\.par','\.cpp','\.c','\.h','\.log','\.txt','\.xml','\.html','*','\.pyc','\.pyo','\.swp$','\.bak$', '\~$']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set map key
"--------------------------------------------------
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i
" inoremap < < ><Esc>hs
"-------------------------------------------------- 
nnoremap <tab> gt
nnoremap <Leader><tab> gT
nnoremap <S-tab> gT
nnoremap cd :call ChangeDir()<CR>
"nnoremap <Space> <Nop>
"nnoremap <BS> <Nop>
"noremap y "+y
"noremap p "+p
"noremap P "+P
"noremap x "+x
map <Up> gk
map <Down> gj
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map command
command!VIMRC tabedit ~/.vimrc
command!VIMRCLOAD source ~/.vimrc
command!SENSSION call VimSession()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
" call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
