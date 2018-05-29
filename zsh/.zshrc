#####################################################################
# zplug
#####################################################################
# zplug settings
# zmodload zsh/zprof && zprof #プロファイリング時にコメントアウトする
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# --------------
# plugins
# --------------
zplug "zsh-users/zsh-autosuggestions"              # fishみたいなサジェスト
zplug "zsh-users/zsh-completions"                  # コマンドの補完
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # コマンドのハイライト
zplug "zsh-users/zsh-history-substring-search"     # history
zplug "chrissicool/zsh-256color"                   # 256color
# ----テーマ-------
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
# zplug 'agnoster/agnoster-zsh-theme', as:theme

# ------oh-my-zshのプラグイン------
zplug "plugins/git", from:oh-my-zsh     # git alias
zplug "plugins/tmux", from:oh-my-zsh    # git alias
zplug "plugins/rbenv", from:oh-my-zsh   # git alias
zplug "plugins/bundler", from:oh-my-zsh # git alias
zplug "plugins/rails", from:oh-my-zsh   # git alias
zplug "plugins/npm", from:oh-my-zsh     # git alias
zplug "plugins/tig", from:oh-my-zsh     # git alias
zplug "plugins/common-aliases", from:oh-my-zsh     # git alias
zplug "plugins/nvm", from:oh-my-zsh     # git alias
# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# プロファイリング時にコメントアウトする
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi

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

#####################################################################
# 環境変数
#####################################################################
export HISTFILE=~/Dropbox/dotfiles/zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# ls 時の色を設定する
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# 標準エディタを設定する
export EDITOR=vim
