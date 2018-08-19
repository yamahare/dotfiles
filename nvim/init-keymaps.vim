" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------
let mapleader = "\<Space>"

nmap \F :NERDTreeFind<CR>
nmap \e :NERDTreeToggle<CR>
nmap \g :GitGutterToggle<CR>
" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
" nmap <Leader>s :Rg 
nmap <Leader>s :Rg!<CR>
" tagbar
nmap <Leader>t :TagbarToggle<CR>
" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" fugitive
nmap <Leader>gs :Gstatus<CR><C-w>T
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gc :Gcommit-v<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gm :Gmerge<CR>
" Agit
nmap <Leader>gl :Agit<CR>
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
" ペースト時に削除した文字列をヤンクさせない
" delete without yanking
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
" without yanking it
" vnoremap <leader>p "_dP
