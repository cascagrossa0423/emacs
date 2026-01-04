(defun my-upcase-region ()
  "Upcase selected region."
  (interactive)
  (if (use-region-p)
      (let ((text (buffer-substring-no-properties
		   (region-beginning)
		   (region-end))))
	(delete-region (region-beginning) (region-end))
	(insert (upcase text)))
    (message "範囲が選択されていません。")))

(global-set-key (kbd "C-c u") #'my-upcase-region)

(provide 'my-day7)
