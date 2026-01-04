(defun my-upcase-region-or-line ()
  "Upcase region if active, otherwise current line."
  (interactive)
  (cond
   ((use-region-p)
    (let ((text (buffer-substring-no-properties
		 (region-beginning)
		 (region-end))))
      (delete-region (region-beginning) (region-end))
      (insert (upcase text))))
   (t
    (let ((text (buffer-substring-no-properties
		 (line-beginning-position)
		 (line-end-position))))
      (delete-region (line-beginning-position)
		     (line-end-position))
      (insert (upcase text))))))

(global-set-key (kbd "C-c U") #'my-upcase-region-or-line)

(provide 'my-day8)
