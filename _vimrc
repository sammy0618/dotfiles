set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set number
set shortmess+=I
set clipboard=unnamed

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'kana/vim-submode'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/gtags.vim'
Bundle 'simeji/winresizer'

let g:unite_split_rule = 'botright'
noremap <Space>o <ESC>:Unite -vertical -winwidth=40 outline<Return>

filetype plugin indent on

"--------unite ope------------
let g:unite_split_rule = "rightbelow"
"let g:unite_split_rule = 'botright'
let g:unite_source_history_yank_enable =1  "history/yankの有効化
"nnoremap <silent> ,p :<C-u>Unite history/yank<CR>
"nnoremap <silent> ,f :<C-u>Unite file_mru<CR>

nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
noremap <Space>o <ESC>:Unite -vertical -winwidth=40 outline<Return>
noremap <Space>g :Gtags
noremap <Space>l :Gtags -f %<CR>
noremap <Space>j :GtagsCursor<CR>
noremap <Space>n :cn<CR>
noremap <Space>p :cp<CR>

"--------windows ope----------
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
"ウィンドウのリサイズにswを割りあてたいのでここは無効にしておく
"nnoremap sw <C-w>w
let g:winresizer_start_key = 'sw'
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"syntax enable
set background=dark
colorscheme solarized
