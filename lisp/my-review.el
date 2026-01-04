(defun my-review-count-chars ()
  "Count characters in region or current line."
  (interactive)
  (let* ((start (if (use-region-p)
                    (region-beginning)
                  (line-beginning-position)))
         (end   (if (use-region-p)
                    (region-end)
                  (line-end-position)))
         (count (- end start)))
    (message "文字数は %d です。" count)))

(defvar my-review-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c r") #'my-review-count-chars)
    map)
  "Keymap for my-review minor mode.")

(define-minor-mode my-review-mode
  "My review minor mode."
  :lighter " Rev"
  :keymap my-review-mode-map)

(defun my-review-enable ()
  "Enable my-review-mode."
  (my-review-mode 1))

(add-hook 'emacs-lisp-mode-hook #'my-review-enable)

(defun my-review-after-save (&rest _args)
  "Show char count after saving."
  (let* ((start (if (use-region-p)
		    (region-beginning)
		  (line-beginning-position)))
	 (end   (if (use-region-p)
		    (region-end)
		  (line-end-position)))
	 (count (- end start)))
    (message "範囲の文字数は%dです。" count)))

(advice-add 'save-buffer :after #'my-review-after-save)

(provide 'my-review)
