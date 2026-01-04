(defun my-around-save-buffer (orig-fn &rest args)
  "Around advice for save-buffer."
  (if my-review-mode
      (progn
	(message "Around advice for save-buffer.")
	(apply orig-fn args)
	(message "my-review-mode ON: saved"))
    ;; mode off
    (apply orig-fn args)))

(advice-add 'save-buffer :around #'my-around-save-buffer)

(provide 'my-day12)
