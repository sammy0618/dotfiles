"syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set clipboard+=unnamed
set formatoptions-=ro
set noswapfile
set laststatus=2
set virtualedit+=block
set showtabline=2
set mouse=a
set completeopt=menuone,noinsert
set shortmess+=I

let mapleader = "\<Space>"

"Force altarnate buffer change when editing buffer"
set hidden
set nowrap


call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'ghifarit53/tokyonight-vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/accelerated-jk'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dylanngo95/react-native-snippet'
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/fern.vim'
call plug#end()

"--------j/kによる移動を速くする------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"--------キーマップ------------
"nnoremap ; :

"Fernの表示
nnoremap <silent><C-e> :Fern . -reveal=% -drawer -toggle<CR>

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

"color scheme change to tokyo-night
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight


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

"easymotion setting
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"test
nnoremap <C-d> :LspDefinition<CR>

"fern
let g:fern#default_hidden=1
