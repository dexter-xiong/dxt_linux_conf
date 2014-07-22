 "-*- coding: utf-8 -*- 
"****************************************************
 "Author:  dxtxiong@gmail.com
 "Create:  2010 Mar 02 03:00:34 PM
 "Last Modified:  2010 Mar 02 03:00:34 PM
 "Last Editor:  dxtxiong@gmail.com
 "Filename: .gvimrc
 "Description: 
"****************************************************
set noerrorbells
set visualbell t_vb=
function! GShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
let g:windowsflag = 0
function! SetWindows ()
    if g:windowsflag == 0
        winpos -4 -4
        set lines=45
        set columns=175
        let g:windowsflag = 1
    else
        set lines=24
        set columns=80
        let g:windowsflag = 0
    endif
endfunction
command! WIN call SetWindows()
color evening
set showtabline=2
set guioptions=aegitv
set guitablabel=%{GShortTabLabel()}
set guifont=DejaVu\ Sans\ Mono\ Oblique\ 10
"change dir to current dir
"autocmd BufReadPost * cd %:p:h
autocmd GUIEnter * call SetWindows()
nnoremap <CR> <Nop>
nnoremap <C-S> <Esc>:w!<CR>
inoremap <C-S> <Esc>:w!<CR>
nnoremap <S-CR> O<Esc>
nnoremap <C-CR> o<Esc>
nnoremap <S-Space> i <Esc>
map <MiddleMouse> <C-D>
imap <MiddleMouse> <C-D>
"nnoremap <S-LeftMouse> <LeftMouse>
"vnoremap <S-LeftMouse> <LeftMouse>
vnoremap <RightMouse> "+y
nnoremap <RightMouse> "+P
nnoremap <S-RightMouse> "+P
vnoremap <S-RightMouse> "+P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" behave
set selection=old
set selectmode=
set keymodel=startsel,stopsel
set mousemodel=popup
