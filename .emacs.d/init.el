(setq default-input-method "MacOSX")
;; 日本語の設定（UTF-8）
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; カーソル
(setq default-frame-alist
	(append (list
			 '(cursor-type . box)
			'(cursor-height . 4)
		   )
		  default-frame-alist))
(when window-system (blink-cursor-mode -1))
 
;; フォントロック
(global-font-lock-mode +1)
(setq font-lock-support-mode
	        (if (fboundp 'jit-lock-mode) 'jit-lock-mode 'lazy-lock-mode))
 
;; 一般的な設定ファイルなどの構文強調表示
;; http://at-aka.blogspot.jp/2011/03/emacs-etchosts-etcapache2conf.html
(require 'generic-x)
 
(setq show-paren-style 'mixed) ; `parenthesis' or `expression' or `mixed'
 
(menu-bar-mode -1) ;; メニューバーを消す
(tool-bar-mode -1) ;; ツールバーを消す
(blink-cursor-mode 0) ;; カーソルの点滅をとめる
(show-paren-mode 1) ;; 対応する括弧を光らせる
(show-paren-mode t) ;; 対応するカッコを強調表示
(setq-default show-trailing-whitespace t) ;; 行末の空白を表示　
(global-hl-line-mode) ;; 現在行を目立たせる　
(setq-default cursor-in-non-selected-windows nil) ;; 非アクティブウィンドウのカーソル

(setq show-paren-style 'mixed) ;; ウィンドウ内に収まらないときだけカッコ内も光らせる
(setq kill-whole-line t) ;; 行の先頭をC-kを一回押すだけで行全体を表示する
(setq ring-bell-function 'ignore) ;; 警告音もフラッシュも全て無効
(setq require-final-newline t) ;; 最終行に必ず一行挿入する
(setq next-line-add-newlines nil) ;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq make-backup-files nil) ;; バックアップファイルを作らない
(setq delete-auto-save-files t) ;; 終了時にオートセーブファイルを消す
(setq truncate-partial-width-windows nil) ;; 縦に（左右に）ウィンドウを分割した場合の折り返し
