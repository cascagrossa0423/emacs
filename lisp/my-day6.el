(defun my-region-info ()
  "Show selected region text."
  (interactive)
  (if (use-region-p)
      (let ((text (buffer-substring-no-properties
		   (region-beginning)
		   (region-end))))
	(message "選択中: %s" text))
    (message "範囲が選択されていません")))

(global-set-key (kbd "C-c r") #'my-region-info)

(provide 'my-day6)
