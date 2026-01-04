(defun my-insert-greeting ()
  "Insert greeting at point"
  (interactive)
  (let ((name (read-string "お名前："))
	(buf (buffer-name)))
    (insert (format "こんにちは%sさん！ (%s)\n"))))

(global-set-key (kbd "C-c i") #'my-insert-greeting)

(provide 'my-day5)
