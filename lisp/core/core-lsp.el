;;; core-lsp.el -*- lexical-binding: t -*-

(use-package lsp-mode
  :commands lsp
  :hook ((python-mode . lsp)
         ;; 今後追加
         ;; (c-mode . lsp)
         ;; (rust-mode . lsp)
         )
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :after lsp-mode)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode))

(provide 'core-lsp)
