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
Plug 'itchyny/lightline.vim'
" --- Util系 -------
Plug 'tomtom/tcomment_vim'            "gcc で現在行をコメントアウト。選択してgcで複数行。
Plug 'Yggdroot/indentLine'              "インデントを可視化
Plug 'bronson/vim-trailing-whitespace'  "無駄な空白をハイライト
Plug 'simeji/winresizer'              "ウインドウのリサイズ
Plug 'wesQ3/vim-windowswap'           " ウインドウをいい感じに移動できるやつ <leader>ww
Plug 'tpope/vim-surround'          "囲み文字を変更
Plug 'mattn/emmet-vim'             " emmet
Plug 'terryma/vim-multiple-cursors' "マルチ選択

call plug#end()

"=============================
" Yggdroot/indentLine
"=============================
let g:indentLine_color_term = 239
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

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
      \ 'coc-fzf-preview',
      \ 'coc-explorer',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-vetur',
      \ 'coc-tsserver',
      \ 'coc-solargraph',
      \ 'coc-pyright',
      \ 'coc-css']
autocmd CursorHold * silent call CocActionAsync('highlight') "カーソル上の英語をハイライトさせる

"=================================
" lightline
"=================================
" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
