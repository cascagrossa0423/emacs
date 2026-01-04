;;; core-packages.el -*- lexical-binding: t -*-

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; ~/.local/bin を PATH に追加（pipx 用）
(let ((local-bin (expand-file-name "~/.local/bin")))
  (when (file-directory-p local-bin)
    (setenv "PATH" (concat local-bin ":" (getenv "PATH")))
    (add-to-list 'exec-path local-bin)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'core-packages)
