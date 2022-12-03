filetype off

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
syntax on
set number
set shortmess+=I
set clipboard+=unnamed
set formatoptions-=ro
set noswapfile
set laststatus=2
set virtualedit+=block
set showtabline=2
set nocompatible

let mapleader = "\<Space>"

"Force altarnate buffer change when editing buffer"
set hidden
set nowrap

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/unite.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('ghifarit53/tokyonight-vim')
call dein#add('Shougo/unite-outline')
call dein#add('thinca/vim-ref')
call dein#add('thinca/vim-quickrun')
call dein#add('kana/vim-submode')
call dein#add('itchyny/lightline.vim')
call dein#add('rhysd/accelerated-jk')
call dein#add('vim-scripts/gtags.vim')
call dein#add('simeji/winresizer')
call dein#add('Shougo/neoyank.vim')
call dein#add('kchmck/vim-coffee-script')

"call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('mattn/emmet-vim')
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')

"call dein#add('Shougo/deoplete.nvim')
"call dein#add('roxma/nvim-yarp')
"call dein#add('roxma/vim-hug-neovim-rpc')
"call dein#add('lighttiger2505/deoplete-vim-lsp')
"call dein#add('takkii/Bignyanco')
call dein#add('vim-jp/vimdoc-ja')

"Markdown用のプラグイン
call dein#add('tpope/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('lambdalisue/fern.vim')

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
"if argc() == 0
"  let g:nerdtree_tabs_open_on_console_startup = 1
"end

"--------j/kによる移動を速くする------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"--------キーマップ------------
"nnoremap ; :

"Fernの表示
nnoremap <silent><C-e> :Fern . -reveal=% -drawer -toggle<CR>

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
nnoremap <silent> ,o :<C-u>Unite -vertical -winwidth=80 -no-quit -keep-focus outline<CR>
"履歴
nnoremap <silent> ,, :<C-u>Unite -vertical -winwidth=80 -no-quit -keep-focus -default-action=append history/yank<CR>
"バッファ
nnoremap <silent> ,b :<C-u>Unite -vertical -winwidth=80 -no-quit -keep-focus buffer -buffer-name=file<CR>
"レジスタ
nnoremap <silent> ,r :<C-u>Unite -vertical -winwidth=80 -no-quit -keep-focus register -buffer-name=register -default-action=append<CR>
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
"--------コマンド別名----------
cnoremap <c-x> <c-r>=expand( '%:p:h')<cr>/
cnoremap <c-z> <c-r>=expand( '%:p')<cr>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"neocomplcache keybind
"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><C-Tab> pumvisible() ? "\<Up>" : "\<C-Tab>"

"PopUpMenuの色設定
au VimEnter,ColorScheme * highlight Pmenu ctermfg=62
au VimEnter,ColorScheme * highlight PmenuSel ctermfg=134

"syntax enable
"set background=dark
"color scheme change to tokyo-night
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
"colorscheme solarized

"deoplete.vim
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#source('_', 'matchers', ['matcher_head',
"\ 'matcher_length'])

"" vim-monster
"let g:neocomplete#sources#omni#input_patterns = {
"      \  'ruby': '[^. *\t]\.\w*\|\h\w*::'
"      \}

filetype plugin indent on

" htmlタグの移動
:source $VIMRUNTIME/macros/matchit.vim

" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
"ウィンドウを垂直分割で開く
"let g:netrw_browse_split=2

"新規バッファ
nnoremap <Silent><C-n> :enew<CR>
"設定ファイルの編集
nnoremap <Leader>. :tabe ~/.vimrc<CR>

"commadn line window open size
noremap q: q:<C-w>=
cnoremap <C-f> <C-f><C-w>=

"Space+P toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"visible tab font etc
set list
"set listchars=tab:>_,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:^_,eol:↲

let g:lightline = {
      \ 'tabline': {
      \   'left': [ [ 'cwd' ],[ 'tabs' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'absolutepath', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'absolutepath': 'AbsolutePath',
      \   'cwd': 'getcwd',
      \ },
      \ 'colorscheme': 'jellybeans'
      \ }

let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\}

function! AbsolutePath()
  let a = substitute(expand('%:p'), $HOME, '~', '')
  if a == ""
    return '??'
  elseif strlen(a) > 40
    return a[strlen(a)-40:]
  else
    return a
  endif
endfunction

""" markdown {{{
   autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
   autocmd BufRead,BufNewFile *.md  set filetype=markdown
   " Need: kannokanno/previm
   nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
   " 自動で折りたたまないようにする
   let g:vim_markdown_folding_disabled=1
   let g:previm_enable_realtime = 1
" }}}
