;; personal functions
(defun my/insert-line-before ()
  "Inserts a newline(s) above the line containing the cursor."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (newline)
    (previous-line)))

(global-set-key (kbd "C-S-o")
		'my/insert-line-before)

;; insert newline if your point is at the end of the buffer
(setq next-line-add-newlines t)
