; ========================================
;;  下記のコマンドをemacsで入力して使用
;;  M-x package-install RET company RET
;;  M-x package-install RET go-mode RET
;; ========================================

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; 時間を表示
(display-time)

;; emacsテーマ選択
(load-theme 'manoj-dark t)

;; ---
;;
;; 背景透過を切り替える関数
;; ---
(setq alpha-on-flag nil)
(defun alpha-toggle()
  (interactive)
  (if (equal alpha-on-flag t)
      (progn
	(set-frame-parameter nil 'alpha 100)
	(setq alpha-on-flag nil)
	(message "alpha-off"))
    (progn
      (set-frame-parameter nil 'alpha 30)
      (setq alpha-on-flag t)
      (message "alpha-on"))))
(define-key global-map (kbd "C-c C-t") 'alpha-toggle)

;; 全角スペースを強制表示する
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(face
                         trailing
                         ;tabs
                         spaces
                         empty
                         space-mark
                         ;tab-mark
                         ))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
       (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t] )))
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; カーソルのある行をハイライトする
(global-hl-line-mode t)

;; "yes-or-no" の選択を "y or n"にする
(fset 'yes-or-no-p 'y-or-n-p)

;; line number の表示
(require 'linum)
(global-linum-mode 1)

;; line number を分かりやすくする
(set-face-attribute 'linum nil
            :foreground "#a9a9a9"
            :background "#404040"
            :height 0.9)

;; メニューバーを非表示
(menu-bar-mode 0)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; 閉じ括弧の補完
(electric-pair-mode 1)

;;
;; setq
;;

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; *.~  バックアップファイルを作らない
(setq make-backup-files t)

;; .#*  バックアップファイルを作らない
(setq auto-save-default nil)

;; tabサイズ
(setq default-tab-width 2)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))

;;
;; define-key
;;

;; Contol H で 1 文字削除
(define-key global-map "\C-h" 'delete-backward-char)

;; 上記定義では Mini Buffer 内では削除できない可能性があるので以下を再定義
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;;
;; 補完の設定
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(## go-mode smartparens company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'company)
(global-company-mode) ; 全バッファで有効にする 
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(defvar tbhby39-pair-alist
  '((?\).?\()
    (?\}.?\{)
    (?\].?\[)
    (?\".?\")
    (?\'.?\')
    (?\>.?\<)
    ) "pair alist")

;; 閉じ括弧を自分で入力したらカーソルを括弧の中にいれる
(defun backalittle ()
  (interactive)
  (if (and (not (bolp))
       (char-equal (char-before) (cdr (assoc last-command-event tbhby39-pair-alist))) )
      (progn 
        (self-insert-command 1)
        (backward-char))
    (self-insert-command 1))    
  )

(global-set-key ")" 'backalittle)
(global-set-key "]" 'backalittle)
(global-set-key "}" 'backalittle)
(global-set-key "\"" 'backalittle)
(global-set-key "'" 'backalittle)
(global-set-key ">" 'backalittle)

(provide 'backalittle)

;; goの設定
  (add-hook 'go-mode-hook 
  (lambda ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq-default) 
    (setq tab-width 4) 
    (setq standard-indent 4) 
    (setq indent-tabs-mode nil)))
