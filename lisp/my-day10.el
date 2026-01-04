(require 'my-day9)

(defun my-enable-day9-mode ()
  "Enable my-day9-mode."
  (my-day9-mode 1))

(add-hook 'emacs-lisp-mode-hook #'my-enable-day9-mode)

(provide 'my-day10)
