" =========================
" vim-plug
" =========================
call plug#begin()

" --- コード補完 -------
Plug 'Shougo/deoplete.nvim'             "コード補完
Plug 'roxma/nvim-yarp'                  "deopleteで使う
Plug 'roxma/vim-hug-neovim-rpc'         "deopleteで使う
Plug 'fishbullet/deoplete-ruby'         "ruby
" --- その他いろいろ -------
Plug 'scrooloose/nerdtree'              "ナードツリー
Plug 'Yggdroot/indentLine'              "インデントを可視化
Plug 'bronson/vim-trailing-whitespace'  "無駄な空白をハイライト
Plug 'altercation/vim-colors-solarized' "colorschema
Plug 'rhysd/accelerated-jk'           "j, k移動高速化
Plug 'townk/vim-autoclose'            "閉じカッコ自動
Plug 'tpope/vim-endwise'              "閉じカッコ自動RUBY
Plug 'tomtom/tcomment_vim'            "gcc で現在行をコメントアウト。選択してgcで複数行。
Plug 'ludovicchabant/vim-gutentags'     "ctagを自動生成
Plug 'tpope/vim-fugitive'             "gitをvimで
Plug 'airblade/vim-gitgutter'         "ファイルの変更したところを表示
Plug 'simeji/winresizer'              "ウインドウのリサイズ
Plug 'w0rp/ale'                       "シンタックスチェック(非同期)
Plug 'vim-airline/vim-airline'        "ステータスバーをかっこよくする
Plug 'vim-airline/vim-airline-themes' "ステータスバーテーマ
Plug 'tpope/vim-surround'          "囲み文字を変更
Plug 'osyo-manga/vim-brightest'    "カーソル配下のワードをハイライトする
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtreeのプラグイン
Plug '/usr/local/opt/fzf'          " fzfで必要
Plug 'junegunn/fzf.vim'            " fzf
Plug 'majutsushi/tagbar'           " class outline viewer
" --- シンタックスハイライト系 -------
Plug 'rcmdnk/vim-markdown'
Plug 'othree/yajs.vim'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-pug'

call plug#end()


" =========================
" basic
" =========================
set formatoptions+=mM "整形オプションにマルチバイト追加
set backspace=indent,eol,start "BSで何でも消せるようにする
set viminfo=
set vb t_vb=   " ビープをならさない
set clipboard=unnamed "ヤンクした文字は、システムのクリップボードに入れる"
set scrolloff=5 "カーソルの上、下に表示する最小限の行数
set textwidth=0 " 入力されているテキストの最大幅 「0」で無効
set hidden " 保存しないで他のファイルを表示することが出来るようにする
set formatoptions=lmoq " 自動整形の実行方法
set nobackup "バックアップは作成しない
set noswapfile "スワップファイルを作成しない
set autoread " Vimの外部で変更されたことが判明したとき、自動的に読み直す
set splitright " 新しいウインドウを右に開く
set splitbelow " 新しいウインドウを右に開く
set spell "lang=en,cjk "スペルチェックする
set modifiable " modifiableがオフなので変更できません　対策
set write " modifiableがオフなので変更できません　対策
set pumheight=10 " 補完メニューの高さ
set mouse=a "マウスでスクロールとかできるやつ
autocmd InsertLeave * set nopaste "ノーマルモードに戻る時、ペーストモードを解除

"-----------
" View
"-----------
set title "編集中のファイル名を表示
set ruler  "ルーラー表示
set number "行番号表示
set showmatch "閉括弧が入力された時、対応する括弧を強調する
"カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui = underline
highlight CursorLine ctermbg = black guibg = black

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast

"-----------
" tabIndent
"-----------
set tabstop=2
set softtabstop=2
set noexpandtab
set expandtab
set smarttab
set shiftwidth=2 "自動インデントで入る空白数
set shiftround
set nowrap
set autoindent
set smartindent
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
end

"-----------
" color
"-----------
syntax on "コードの色分け
set background=dark
syntax enable "カラー表示
" カラースキーマ
colorscheme solarized
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
hi Search term=underline cterm=underline ctermfg=80

"-----------
" search
"-----------
set incsearch "インクリメンタルサーチを行う
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch   " 検索文字をハイライト
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"------------------
"   Move
"------------------
" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"------------------
" KeyMap
"------------------
let mapleader = "\<Space>"
":と;でコマンドラインモード
nnoremap ; :
"分割ウインドウの移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap Q <Nop> "exモードになるのを防ぐ

" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>

"=============================
" tab
"=============================

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tab]   <Nop>
nmap    t [Tab]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tab]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tab]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tab]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tab]p :tabprevious<CR>
" tp 前のタブ

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

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" ignoreファイル
let g:NERDTreeIgnore=['\.DS_Store$', '\.clean$', '\.swp$', '\.bak$', '\~$']

"横割り表示
let g:NERDTreeMapOpenSplit = '<C-S>'
"縦割り表示
let g:NERDTreeMapOpenVSplit = '<C-I>'
" NERDツリーを表示させるショートカット
nmap <silent> <Leader>n :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✓",
    \ 'Ignored'   : '-',
    \ "Unknown"   : "?"
    \ }

"=============================
" accelerated-jk
"=============================
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"=============================
" fugitive
"=============================
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>

"=============================
" neoterm、ターミナルモードを離脱するのをESCで
"=============================
tnoremap <silent> <ESC> <C-\><C-n>
let g:neoterm_autoscroll=1 "REPLを自動的に改行
let g:neoterm_default_mod='vertical botright'
" :Tnew 実行
nnoremap <silent> <C-e><C-t> :Tnew<CR>

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
" vim-gutentags
"=============================
let g:gutentags_ctags_tagfile='.tags'

"=============================
" brightest.vim
"=============================
" ハイライトするグループ名を設定します
" アンダーラインで表示する
let g:brightest#highlight = { "group" : "BrightestUnderline" }

"=============================
" ale
"=============================
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
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
" ショートカット
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>gf :GFiles?<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>bc :BCommits<CR>
nmap <Leader>s :Rg 

"=============================
" tagbarのショートカット
"=============================
nmap <Leader>t :TagbarToggle<CR>


"=============================
" vim-autoclose 下記にしていないとdeopleteでESC押したときノーマルモードにならない
"=============================
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
