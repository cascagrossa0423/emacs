;;; init.el --- Clean & Organized Configuration

;; ------------------------------------------------------------
;; 1. 基本UI・起動設定 (早めに適用してチラつきを防止)
;; ------------------------------------------------------------
(setq inhibit-startup-screen t)        ; スタートアップ画面非表示
(setq initial-buffer-choice t)         ; 起動時に *scratch* を表示
(setq initial-scratch-message "")      ; scratchの初期メッセージを空にする
(menu-bar-mode -1)                     ; メニューバー非表示
(tool-bar-mode -1)                     ; ツールバー非表示
(scroll-bar-mode -1)                   ; スクロールバー非表示
(global-display-line-numbers-mode t)   ; 行番号表示
(add-to-list 'initial-frame-alist '(fullscreen . maximized)) ; 起動時最大化

;; タイトルバーにフルパスを表示
(setq frame-title-format '((:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b"))))

;; ネイティブコンパイルの警告を非表示にする
(setq native-comp-async-report-warnings-errors 'silent)
;
; オリジナル設定
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'my-greet)
(require 'my-day6)
(require 'my-day7)
(require 'my-day8)
(require 'my-day9)
(require 'my-day10)
(require 'my-day11)
(require 'my-review)
(require 'my-day12)

;; core（基盤）
(add-to-list 'load-path (expand-file-name "lisp/core" user-emacs-directory))
(require 'core-packages)
(require 'core-ui)
(require 'core-lsp)

;; language
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))
(require 'python-config)

;; org
(require 'org)
(require 'org-agenda)
(setq org-agenda-files '("~/org-practice.org")) ;; 練習用orgファイル
(global-set-key (kbd "C-c a") #'org-agenda)

;; ------------------------------------------------------------
;; 2. パッケージ管理の初期化
;; ------------------------------------------------------------

;; core-packages.elに移動

;; ------------------------------------------------------------
;; 3. 見た目・アイコン・テーマ
;; ------------------------------------------------------------
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))

(use-package nerd-icons)

(use-package doom-modeline
  :after nerd-icons
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-font-family "nerd-icons")
  (setq doom-modeline-minor-modes t))

;; ------------------------------------------------------------
;; 4. 検索・補完 (Ivy / Counsel / Company)
;; ------------------------------------------------------------
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

(use-package swiper :bind (("C-s" . swiper)))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . ivy-switch-buffer)
         ("C-x C-r" . counsel-recentf)
         ("M-y" . counsel-yank-pop)))

(use-package company
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; ------------------------------------------------------------
;; 5. 開発・便利ツール
;; ------------------------------------------------------------
(use-package which-key :config (which-key-mode))

(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-word-1)
         ("M-g f" . avy-goto-line)))

(use-package magit :bind (("C-x g" . magit-status)))

(use-package projectile
  :config (projectile-mode +1)
  :bind ("C-c p" . projectile-command-map))

(use-package treemacs
  :bind (("M-0" . treemacs-select-window)
         ("C-c t" . treemacs)))

(use-package flycheck :init (global-flycheck-mode 1))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package recentf
  :config (recentf-mode 1)
  (setq recentf-max-menu-items 25))

;; ------------------------------------------------------------
;; 6. 日本語入力 (Mozc)
;; ------------------------------------------------------------
(use-package mozc
  :config
  (setq default-input-method "japanese-mozc")
  (global-set-key (kbd "C-\\") 'toggle-input-method))

;; ------------------------------------------------------------
;; 7. 独自関数・ショートカットキー
;; ------------------------------------------------------------

;; F5 で設定ファイルを開く / Shift+F5 で反映
(defun open-user-init-file ()
  "Open the Emacs init file."
  (interactive)
  (find-file user-init-file))

(defun reload-user-init-file ()
  "Reload the Emacs init file."
  (interactive)
  (load-file user-init-file)
  (message "Init file reloaded!"))

(global-set-key (kbd "<f5>") 'open-user-init-file)
(global-set-key (kbd "S-<f5>") 'reload-user-init-file)

;; ------------------------------------------------------------
;; 自動生成される設定（Custom-set-variables等）
;; ------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages
   '(python-black which-key smartparens projectile mozc magit lsp-ui flycheck evil-escape evil-collection doom-themes doom-modeline dap-mode counsel company all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
