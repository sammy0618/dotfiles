#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

########################################
# 環境変数
export LANG=ja_JP.UTF-8

#rbenvの設定
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#pyenvの設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"

#nodenvの設定
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

#rbenvの設定
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

#neovimの設定
export XDG_CONFIG_HOME=$HOME/.config

# 色を使用出来るようにする
autoload -Uz colors
colors

# vim 風キーバインドにする
bindkey -v

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
#%# "
#PROMPT='%K{green}%F{black}[%n]%K{blue}%F{black}%~%f%k%#'
PROMPT='%K{green}%F{black}[%n]%f%k%F{green}%~%#%f'



# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
#zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -al -G -F'
        ;;
    linux*)
        #Linux用の設定
       #alias ls='ls -al -F --color=auto'
        # enable color support of ls and also add handy aliases
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls -al --color=always'
            alias less='less -R'
            #alias dir='dir --color=always'
            #alias vdir='vdir --color=always'
            alias grep='grep --color=always'
            alias fgrep='fgrep --color=always'
            alias egrep='egrep --color=always'
        fi

        ;;
esac

# vim:set ft=zsh:

## cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

########################################
#functionの一覧 
#スニペット
function peco-snippets() {

    BUFFER=$(grep -v "^#" ~/.snippets | peco --query "$LBUFFER")
#    zle clear-screen
}
zle -N peco-snippets
bindkey '^s' peco-snippets

#履歴リスト
function peco-history-selection() {
  ########################################
  # OS 別の設定
  case ${OSTYPE} in
      darwin*)
          #Mac用の設定
          BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
          CURSOR=$#BUFFER
          zle reset-prompt
          ;;
      linux*)
          #Linux用の設定
          BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
          CURSOR=$#BUFFER
          zle reset-prompt
          ;;
  esac
##   BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
#BUFFER=`history -n 1 | eval ${tail_r} | awk '!a[$0]++' | peco`
#    CURSOR=$#BUFFER
#    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^r' peco-history-selection

#ディレクトリリスト
# ### search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}
### search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^d' peco-cdr
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
