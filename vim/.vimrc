if has('vim_starting')
  set nocompatible
  set runtimepath+=~/Dropbox/dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/Dropbox/dotfiles/vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'tpope/vim-endwise' " 閉じカッコ等を自動で行う
NeoBundle 'tpope/vim-rails/'
NeoBundle 'tomtom/tcomment_vim'     " gcc で現在行をコメントアウト。 選択してgcで複数行。
NeoBundle 'Yggdroot/indentLine'   " これが原因でJSONのダブルクオーテーションが表示されない
NeoBundle 'elzr/vim-json'         " 上のJSONの問題解決用シンタックス上書き
NeoBundle 'simeji/winresizer'     " ウインドウサイズリサイズ
NeoBundle 'szw/vim-tags'          " ctagを使えるようにする
NeoBundle 'Shougo/neocomplcache'

call neobundle#end()

filetype plugin indent on     " required!
NeoBundleCheck

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
set shiftwidth=2
set shiftround
set nowrap
set autoindent
set smartindent

"-----------
" color
"-----------
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
syntax on "コードの色分け
set background=dark
syntax enable "カラー表示
colorscheme solarized

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
":と;でコマンドラインモード
nnoremap ; :
"分割ウインドウの移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>

"=============================
" powerline
"=============================
set encoding=utf-8 " Necessary to show unicode glyphs
set laststatus=2 " statusline表示
set guifont=Ricty_for_Powerline:h16
set guifontwide=Ricty:h16
set ruler "カーソルが何行目の何列目に置かれているかを表示する
let g:Powerline_symbols = 'fancy'
set t_Co=256

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
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

"=============================
" unit.vim
"=============================
"インサートモードで開始
let g:unite_enable_start_insert=1
"ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"prefix keyの設定
nmap <Space> [unite]

"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"=============================
" smooth_scroll.vim
"=============================
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'
"=============================
" vim-json
"=============================
let g:vim_json_syntax_conceal = 0


"=============================
" ctag
"=============================
let g:vim_tags_auto_generate = 1
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

"=============================
" neocomplcache"
"=============================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_camel_case_completion = 0

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
