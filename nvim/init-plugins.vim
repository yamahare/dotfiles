" =========================
" vim-plug
" =========================
call plug#begin()

" --- コード補完 -------
Plug 'Shougo/deoplete.nvim'             "コード補完
Plug 'roxma/nvim-yarp'                  "deopleteで使う
Plug 'roxma/vim-hug-neovim-rpc'         "deopleteで使う
Plug 'fishbullet/deoplete-ruby'         "ruby
" --- git -------
Plug 'tpope/vim-fugitive'             "gitをvimで
Plug 'airblade/vim-gitgutter'         "ファイルの変更したところを表示
Plug 'cohama/agit.vim'                "gitvが重いのでこちら。git commit log
" --- fzf -------
Plug '/usr/local/opt/fzf'          " fzfで必要
Plug 'junegunn/fzf.vim'            " fzf
" --- ctag -------
Plug 'majutsushi/tagbar'           " class outline viewer
" --- 見た目 -------
Plug 'altercation/vim-colors-solarized' "colorschema
Plug 'vim-airline/vim-airline'        "ステータスバーをかっこよくする
Plug 'vim-airline/vim-airline-themes' "ステータスバーテーマ
" --- Util系 -------
Plug 'luochen1990/rainbow'        " 閉じカッコをレインボーにするやつ
Plug 'tomtom/tcomment_vim'            "gcc で現在行をコメントアウト。選択してgcで複数行。
Plug 'Yggdroot/indentLine'              "インデントを可視化
Plug 'bronson/vim-trailing-whitespace'  "無駄な空白をハイライト
Plug 'simeji/winresizer'              "ウインドウのリサイズ
Plug 'wesQ3/vim-windowswap'           " ウインドウをいい感じに移動できるやつ <leader>ww
Plug 'rhysd/accelerated-jk'           "j, k移動高速化
Plug 'cohama/lexima.vim'              "閉じカッコ自動
Plug 'tpope/vim-surround'          "囲み文字を変更
Plug 'mattn/emmet-vim'             " emmet
Plug 'terryma/vim-multiple-cursors' "マルチ選択
Plug 'ctrlpvim/ctrlp.vim'          "ファイル検索
" --- ナードツリー -------
Plug 'scrooloose/nerdtree'              "ナードツリー
Plug 'Xuyuanp/nerdtree-git-plugin'      "nerdtreeのプラグイン
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "NERDTreeシンタックスハイライト
Plug 'ryanoasis/vim-devicons'                  " アイコン
" --- シンタックスハイライト系 -------
Plug 'w0rp/ale'                       "シンタックスチェック(非同期)
Plug 'rcmdnk/vim-markdown'
Plug 'othree/yajs.vim'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-pug'

call plug#end()

"------------------
" deoplete(昔のneocomplicache)
"------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
" inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"

"=============================
" NERDTree
"=============================
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'
" デフォルトでbookmark表示
let g:NERDTreeShowBookmarks=1
" ignoreファイル
let g:NERDTreeIgnore=['\.DS_Store$', '\.clean$', '\.swp$', '\.bak$', '\~$']
"横割り表示
let g:NERDTreeMapOpenSplit = '<C-S>'
"縦割り表示
let g:NERDTreeMapOpenVSplit = '<C-I>'
" bufferをデフォルトで削除にする
let NERDTreeAutoDeleteBuffer = 1

"=============================
" vim-nerdtree-syntax-highlight
"=============================
" 速度低下を抑える
let g:NERDTreeLimitedSyntax = 1
" file
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" folder
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

"=============================
"vim-devicons
"=============================
"deviconsをnerdtreeに適用
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
"folderアイコンを使用
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"iconのwidth調整
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

"=============================
" git-gutterプラグイン有効化
"=============================
set updatetime=250
let g:gitgutter_override_sign_column_highlight = 0

"=============================
" vim-vueプラグイン用
"=============================
autocmd FileType vue syntax sync fromstart

"=============================
" vim-airline
"=============================
let g:airline_powerline_fonts=1
set laststatus=2
" let g:airline_theme='solarized dark'
let g:airline_theme='molokai'
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#buffer_idx_mode=1
" A領域に表示する項目
let g:airline_section_a = airline#section#create(['mode'])
" ステータスバーに表示するものをAとCのみにする
let g:airline#extensions#default#layout = [
	\ [ 'a', 'c'],
	\ [],
	\ ]

"=============================
" ale
"=============================
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
let g:ale_set_highlights = 0 " ハイライトをやめる
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"=============================
" fzf.vim
"=============================
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-i': 'vsplit' }
let g:fzf_layout = { 'window': '20split enew' }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"=============================
" rainbow  nerdtreeに影響与えないようにする
"=============================
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'separately': {
\		'nerdtree': 0,
\	}
\}

"=============================
" Yggdroot/indentLine
"=============================
let g:indentLine_color_term = 239
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

"=============================
" ctrlpvim/ctrlp.vim'
"=============================
" キャッシュディレクトリ
" F5 でキャッシュの更新ができる
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0
" 遅延再描画
let g:ctrlp_lazy_update = 1
" 無視するディレクトリ/ファイル
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor|tmp|log)$',
  \ 'file': '\v\.(exe|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif
" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20
