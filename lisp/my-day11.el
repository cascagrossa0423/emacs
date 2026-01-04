(defun my-after-save-message (&rest _args)
  "Message after saving a buffer."
  (message "Saved successfully!"))

(advice-add 'save-buffer :after #'my-after-save-message)

(provide 'my-day11)
