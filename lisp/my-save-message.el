;;; my-save-message.el --- Show message on save -*- lexical-binding: t -*-

;;; Commentary:
;; Save 時にメッセージを表示する minor mode

;;; Code:

(defcustom my-save-message-text "Saved!"
  "Message shown after saving."
  :type 'string)

(defun my-save-message--after-save ()
  (message "%s" my-save-message-text))

(define-minor-mode my-save-message-mode
  "Show message when buffer is saved."
  :lighter " SaveMsg"
  (if my-save-message-mode
      (add-hook 'after-save-hook #'my-save-message--after-save nil t)
    (remove-hook 'after-save-hook #'my-save-message--after-save t)))

(provide 'my-save-message)
;;; my-save-message.el ends here
