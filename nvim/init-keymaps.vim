" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------
let mapleader = "\<Space>"

" fzf
nmap <Leader>f :CocCommand fzf-preview.FromResources project_mru git<CR>
nmap <Leader>b :CocCommand fzf-preview.AllBuffers<CR>
nmap <Leader>s :Rg 
" fugitive
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gc :Gcommit-v<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gm :Gmerge<CR>
" Agit
nmap <Leader>gh :AgitFile<CR>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
":と;でコマンドラインモード
nnoremap ; :
"分割ウインドウの移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap Q <Nop> "exモードになるのを防ぐ
nnoremap <C-z> <Nop> "tmuxのprefixにしたから消す。（vimにおける一旦ポーズ）
" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>
" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 保存,閉じる
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" vim設定をリフレッシュ
nmap <leader>r :so ~/.config/nvim/init.vim<CR>

" coc
"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>
"スペースhでHover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <silent> <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)
"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)
"スペースeでファイラをひらく
nnoremap <space>e :CocCommand explorer<CR>
