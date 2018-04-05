(require 'package)

(add-to-list 'package-archives
                          '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
                          '("gnu" . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
                          '("melpa-stable" . "https://stable.melpa.org/packages/") t)


; list the packages you want
(setq package-list
          '(magit elpy jedi flycheck py-autopep8 org helm exec-path-from-shell solarized-theme zenburn-theme helm-projectile markdown-mode))

; remember to pip install jedi flake8 autopep8 virtualenv

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

; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(elpy-enable)
(setq python-shell-interpreter "ipython"
  python-shell-interpreter-args "-i --simple-prompt")

; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

; pep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)

(blink-cursor-mode 0) ; turn off blinking cursor
(global-linum-mode t) ; turn on line numbers
;(load-theme 'solarized-light t) ; set theme
(load-theme 'zenburn t)
(setq backup-directory-alist `(("." . "~/.saves"))) ; redirect temp files
(setq inhibit-startup-message t) ; hide the startup message

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
    (exec-path-from-shell flycheck jedi elpy markdown-mode help-projectile solarized-theme magit helm))))

; set font and font size
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150 :family "Inconsolata")))))
