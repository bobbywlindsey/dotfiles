;; change frame title to file being edited
(when window-system
  (setq frame-title-format '(buffer-file-name "Hey man, you're editing %f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1)
  (scroll-bar-mode -1))

;; wrap one big line as if it were multiple lines
(global-visual-line-mode)

;; great light theme
(load-theme 'leuven t)

;; turn off blinking cursor
(blink-cursor-mode 0)

;;(global-linum-mode t) ; turn on line numbers
;; redirect temp files
(setq backup-directory-alist `(("." . "~/.saves")))

;; hide startup message when booting up emacs
(setq inhibit-startup-message t)

;; put a space on both sides of line number to handle weird fringe glitch on MacOS
;;(setq linum-format "  %d ") 

;; big block red cursor
(setq-default cursor-type 'box)
(set-cursor-color "red")
(setq default-frame-alist
   '((cursor-color . "red")))
(add-to-list 'default-frame-alist '(cursor-color . "red"))

;; restore red cursor in case theme overwrites
(defun my/red-cursor ()
  (interactive)
  (set-cursor-color "red")
  (setq default-frame-alist
	'((cursor-color . "red"))) 
  )

;; toggle-maxframe
(setq default-frame-alist
      '(
        (width . 160) ; character
        (height . 42) ; lines
	(cursor-color . "red") 
        ))

;; stuff added automatically
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (olivetti exec-path-from-shell flycheck jedi elpy markdown-mode help-projectile solarized-theme magit helm))))

;; set font and font size
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Inconsolata")))))
