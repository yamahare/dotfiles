#####################################################################
# antigen
######################################################################
source ~/Dropbox/dotfiles/zsh/.zshrc.antigen
#####################################################################
# options
#####################################################################
setopt auto_cd  #cdを使わずにディレクトリを移動できる
setopt correct # スペルチェック。間違うと訂正してくれる
setopt auto_pushd # "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt pushd_ignore_dups # 同じディレクトリを pushd しない
setopt auto_list # 補完候補を一覧で表示する
setopt auto_menu # 補完キー連打で候補順に自動で補完する
# ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
# history
setopt share_history        # ヒストリの共有の有効化
setopt hist_ignore_dups     # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups # ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_reduce_blanks   #コマンド中の余分なスペースは削除して履歴に記録する
setopt inc_append_history   #  履歴をすぐに追加する（通常はシェル終了時）
setopt prompt_subst # git情報表示用
setopt HIST_IGNORE_ALL_DUPS #たぶんzcompdumpを出力させないようにする

#####################################################################
# autoload
######################################################################
autoload -Uz add-zsh-hook   # フック機能を有効にする
autoload -Uz compinit && compinit -u # コマンドのオプションや引数を補完する
autoload -Uz url-quote-magic # URLをエスケープする
autoload -Uz vcs_info # VCS情報の表示を有効にする
autoload -U promptinit; promptinit # pureテーマ用

#####################################################################
# alias
######################################################################
alias vim='nvim'
alias vi='nvim'
alias ripg='command rg --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"' # rgがrails generateとかぶるため
alias ggl='googler -n 7 -c ja -l ja --colors bjdxxy'
alias cat='bat'
alias ping='prettyping --nolegend'
alias top="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

#####################################################################
# 環境変数
#####################################################################
export EDITOR=nvim

export HISTFILE=~/Dropbox/dotfiles/zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# ls 時の色を設定する
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# 環境変数を外部ファイルに置く(repositoryに公開したくない情報)
}function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then #ファイルの存在を確認
    . "$lib"
  fi
}
loadlib ~/Dropbox/dotfiles/zsh/env

# goのライブラリにパスを通す
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# direnv(ディレクトリ毎に環境変数を設定できる)
eval "$(direnv hook zsh)"
#####################################################################
# fzf設定
#####################################################################
# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
# ripgrepを使って検索する
export FZF_DEFAULT_COMMAND='command rg --files --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"'
export FZF_DEFAULT_OPTS="--height 40% --reverse --border --inline-info --ansi"
# ctrl-tのときのデフォルトコマンド設定
export FZF_CTRL_T_COMMAND='command rg --files --hidden --follow --no-messages -g "!**/{node_modules,public,bundles,.git,import_data,tmp}/**" -g "!*.log"'

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fgb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#####################################################################
# Pureのプロンプトを変更
#####################################################################
PURE_PROMPT_SYMBOL='ʕ ·ᴥ·ʔ'
