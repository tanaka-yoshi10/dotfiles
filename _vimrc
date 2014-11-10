set visualbell
set shiftwidth=4
set tabstop=4
set expandtab

function! InsertDiary()
	execute "normal o--- Project ---¥<CR>--- NextAction ---¥<CR>¥<ESC>"
endfunction

" ,dで日付を入力する
map ,d Go<C-D><C-D><C-D><C-D><C-D><CR>---------- <C-R>=strftime("%Y-%m-%d(%a)")<CR> ----------<CR>
map ,i o<C-R>=strftime("%Y%m%d")<CR><SPACE>
map ,b o<CR>----------------------------<CR><ESC>

map ,h I--- <ESC>A ---<ESC>
map ,j o<TAB>[<C-R>=strftime("%Y-%m-%d")<CR> <C-R>=strftime("%H:%M")<CR>]<ESC>
"map ,t ,n[<C-R>=strftime("%Y-%m-%d")<CR>]
map ,t I[ ] <ESC>
map ,a Go<C-D><C-D><C-D><C-D><C-D><CR>= <C-R>=strftime("%H:%M %m/%d")<CR> =<CR>
map <SPACE> rv

map ,n Go<C-D><C-D><C-D><C-D><C-D>[ ] 

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
