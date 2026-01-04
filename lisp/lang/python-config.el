;;; lang-python.el -*- lexical-binding: t -*-

(require 'python)  ;; ← これは「標準の python.el」を指す

(setq python-shell-interpreter "python3"
      python-indent-offset 4)

(use-package python-black
  :hook (python-mode . python-black-on-save-mode))

(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(provide 'python-config)
