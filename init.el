(require 'package)

(add-to-list 'package-archives
                          '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
                          '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
                          '("gnu" . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
                          '("melpa-stable" . "https://stable.melpa.org/packages/") t)


; list the packages you want
(setq package-list
          '(magit org helm solarized-theme helm-projectile markdown-mode))


; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
    (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
    (unless (package-installed-p package)
          (package-install package)))

; configure packages
(require 'org)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)

; turn off blinking cursor, turn on line number, set theme
(blink-cursor-mode 0)
(global-linum-mode t)
(load-theme 'solarized-light t)
(setq backup-directory-alist `(("." . "~/.saves")))

(require 'markdown-mode)

; insert newline if your point is at the end of the buffer
(setq next-line-add-newlines t)

; stuff added automatically
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode help-projectile solarized-theme magit helm))))

; set font and font size
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150 :family "Inconsolata")))))
