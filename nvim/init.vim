"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" yamahare's .vimrc file
"
let $VIM_CONF = $HOME . '/.config/nvim/'
source $VIM_CONF/init-plugins.vim
source $VIM_CONF/init-keymaps.vim

" =========================
" basic
" =========================
set encoding=UTF-8
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
au CursorHold * checktime " ノーマルモードで4秒間使用しないで1回チェックする autoread
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
" 下記はパフォーマンス向上の為解除
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set lazyredraw " コマンド実行中は再描画しない
set ttyfast " 高速ターミナル接続を行う

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
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
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

