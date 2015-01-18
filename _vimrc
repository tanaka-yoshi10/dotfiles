syntax on
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

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'

" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

NeoBundle "slim-template/vim-slim"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

au BufRead,BufNewFile *.md set filetype=markdown
