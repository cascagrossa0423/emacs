(defvar my-day9-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c t") #'my-upcase-region-or-line)
    map)
  "Keymap for my-day9 minor mode.")

(define-minor-mode my-day9-mode
  "My day minor mode."
  :lighter " D9"
  :keymap my-day9-mode-map
  (if my-day9-mode
      (message "my-day9-mode ON")
    (message "my-day9-mode OFF")))

(provide 'my-day9)
