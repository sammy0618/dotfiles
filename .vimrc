filetype off

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
syntax on
set number
set shortmess+=I
set clipboard=unnamed
set formatoptions-=ro
set hidden

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/unite.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('Shougo/unite-outline')
call dein#add('thinca/vim-ref')
call dein#add('thinca/vim-quickrun')
call dein#add('kana/vim-submode')
call dein#add('itchyny/lightline.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('rhysd/accelerated-jk')
call dein#add('vim-scripts/gtags.vim')
call dein#add('simeji/winresizer')
call dein#add('alpaca-tc/alpaca_tags')
call dein#add('Shougo/neoyank.vim')

"call dein#add('Shougo/neocomplcache')
"call dein#add('Shougo/neocomplcache-rsense.vim')

call dein#add('Shougo/neocomplete.vim',     { 'on_i': 1 })
call dein#add('osyo-manga/vim-monster',     { 'on_ft': 'ruby' })

call dein#end()

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif
if dein#check_install()
  call dein#install()
endif

"--------NerdTreeの設定------------
let NERDTreeShowHidden = 1
" ファイルが指定されていなければNERD treeを有効にする
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

"--------lightlineの設定------------
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }

"--------j/kによる移動を速くする------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"--------キーマップ------------
nnoremap ; :

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:unite_split_rule = 'botright'
"Uniteの設定
"grep
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer -no-quit -vertical -keep-focus<CR>
nnoremap <silent> ,G  :<C-u>Unite grep:.:-w -buffer-name=search-buffer -no-quit -vertical -keep-focus<CR>
nnoremap <silent> ,eg  :<C-u>Unite grep:.:-e -buffer-name=search-buffer -no-quit -vertical -keep-focus<CR>
" unite grepにhw(highway)を使う
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
"アウトライン
nnoremap <silent> ,o :<C-u>Unite -vertical -winwidth=40 -no-quit -keep-focus outline<CR>
"履歴
nnoremap <silent> ,, :<C-u>Unite -vertical -winwidth=40 -no-quit -keep-focus -default-action=append history/yank<CR>
"バッファ
nnoremap <silent> ,b :<C-u>Unite -vertical -winwidth=40 -no-quit -keep-focus buffer -buffer-name=file<CR>
"レジスタ
nnoremap <silent> ,r :<C-u>Unite -vertical -winwidth=40 -no-quit -keep-focus register -buffer-name=register -default-action=append<CR>
"バッファディレクトリ
nnoremap <silent> ,bd :<C-u>UniteWithBufferDir -vertical -winwidth=40 -no-quit -keep-focus register -buffer-name=files file<CR>

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

"neocomplcache keybind
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><C-Tab> pumvisible() ? "\<Up>" : "\<C-Tab>"

"PopUpMenuの色設定
au VimEnter,ColorScheme * highlight Pmenu ctermfg=62
au VimEnter,ColorScheme * highlight PmenuSel ctermfg=134

"syntax enable
set background=dark
colorscheme solarized

"neocomplete.vim
let g:neocomplete#enable_at_startup = 1

" vim-monster
let g:neocomplete#sources#omni#input_patterns = {
      \  'ruby': '[^. *\t]\.\w*\|\h\w*::'
      \}

filetype plugin indent on

" htmlタグの移動
:source $VIMRUNTIME/macros/matchit.vim

nnoremap <Silent><C-n> :enew<CR>

