" =========================
" vim-plug
" =========================
call plug#begin()

" --- コード補完 -------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" --- git -------
Plug 'tpope/vim-fugitive'             "gitをvimで
Plug 'cohama/agit.vim'                "gitvが重いのでこちら。git commit log
" --- fzf -------
Plug '/usr/local/opt/fzf'          " fzfで必要
Plug 'junegunn/fzf.vim'            " fzf
" --- 見た目 -------
Plug 'altercation/vim-colors-solarized' "colorschema
" --- Util系 -------
Plug 'tomtom/tcomment_vim'            "gcc で現在行をコメントアウト。選択してgcで複数行。
Plug 'Yggdroot/indentLine'              "インデントを可視化
Plug 'bronson/vim-trailing-whitespace'  "無駄な空白をハイライト
Plug 'simeji/winresizer'              "ウインドウのリサイズ
Plug 'wesQ3/vim-windowswap'           " ウインドウをいい感じに移動できるやつ <leader>ww
Plug 'tpope/vim-surround'          "囲み文字を変更
Plug 'mattn/emmet-vim'             " emmet
Plug 'terryma/vim-multiple-cursors' "マルチ選択
" ---- NERD_tree ---------
Plug 'scrooloose/nerdtree'              "ナードツリー
Plug 'Xuyuanp/nerdtree-git-plugin'      "nerdtreeのプラグイン
Plug 'ryanoasis/vim-devicons'                  " アイコン

call plug#end()

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
" Yggdroot/indentLine
"=============================
let g:indentLine_color_term = 239
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

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

"=================================
" coc
"=================================
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tabnine',
      \ 'coc-prettier',
      \ 'coc-pairs',
      \ 'coc-html',
      \ 'coc-highlight',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-vetur',
      \ 'coc-tsserver',
      \ 'coc-solargraph',
      \ 'coc-spell-checker',
      \ 'coc-css']
autocmd CursorHold * silent call CocActionAsync('highlight') "カーソル上の英語をハイライトさせる
