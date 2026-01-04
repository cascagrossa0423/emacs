(defun my-greet ()
  "Ask name and greet user."
  (interactive)
  (let ((name (read-string "お名前は？")))
    (message "ようこそ%sさん" name)))

(global-set-key (kbd "C-c g") #'my-greet)

(provide 'my-greet)
