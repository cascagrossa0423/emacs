;;; core-ui.el -*- lexical-binding: t -*-

(use-package company
  :hook (after-init . global-company-mode))

(use-package which-key
  :config
  (which-key-mode))

(provide 'core-ui)
