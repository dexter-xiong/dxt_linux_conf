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
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" set system para
filetype on
syntax on
set backspace=indent,eol,start
set autowriteall
set nobackup
set autoindent
set noerrorbells
set visualbell t_vb=
set number
set whichwrap=b,s,<,>,[,]
set nowrapscan
set history=200		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set ruler		" show the cursor position all the time
set shortmess=atI       " shorten to avoid 'press a key' prompt
set autoread            " auto read when a file is changed outside
set report=0            " tell us when anything is changed via :...
color darkblue
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set laststatus=2
set statusline=%<%F%m%r%h\ %=\ [%{&ff}]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ [%l/%L:%c]\ %P
inoremap <C-U> <C-G>u<C-U>
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
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
function! ChangeDir()
    let fullname = bufname("%")
    "echo stridx(fullname,"/")
    if stridx(fullname,"/")!=0
        let fullname = getcwd()."/".bufname("%")
    endif
    let index = strridx(fullname,"/")
    let fullname = strpart(fullname,0,index)
    execute "cd ".fullname
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"tabedit map
map ,0 <Esc>:tabedit .<CR>
map ,1 <Esc>:tabn 1<CR>
map ,2 <Esc>:tabn 2<CR>
map ,3 <Esc>:tabn 3<CR>
map ,4 <Esc>:tabn 4<CR>
map ,5 <Esc>:tabn 5<CR>
map ,6 <Esc>:tabn 6<CR>
map ,7 <Esc>:tabn 7<CR>
map ,8 <Esc>:tabn 8<CR>
nnoremap <tab> gt
nnoremap <Leader><tab> gT
nnoremap <S-tab> gT
" buffer map
map <C-H> <Esc>:bnext<CR>
map <C-L> <Esc>:bprevious<CR>
nnoremap cd :call ChangeDir()<CR>
"nnoremap <Space> <Nop>
"nnoremap <BS> <Nop>
"noremap y "+y
"noremap p "+p
"noremap P "+P
"noremap x "+x
map <Up> gk
map <Down> gj
" map container key
vnoremap ( s()<Esc>P<Esc>
vnoremap [ s[]<Esc>P<Esc>
vnoremap { s{}<Esc>P<Esc>
vnoremap ,' s''<Esc>P<Esc>
vnoremap ," s""<Esc>P<Esc>
vnoremap <Leader>c s<Esc>Pl2x
" map select all
map ,a ggVG
map <F4> <Esc>:NERDTreeToggle <CR>
map <Leader><F4> <Esc>:Tlist<CR>
map <Leader>t <Esc>:TlistUpdate<CR>
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
let g:AutoComplPop_MappingDriven=0
let g:AutoComplPop_BehaviorKeywordLength=3
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

