(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/delete-trailing-whitespace)
(sensible-defaults/quiet-startup)
(sensible-defaults/make-dired-file-sizes-human-readable)
(sensible-defaults/shorten-yes-or-no)
(sensible-defaults/always-highlight-code)
(sensible-defaults/refresh-buffers-when-files-change)
(sensible-defaults/show-matching-parens)
(sensible-defaults/set-default-line-length-to 80)


;; -------------- add packages --------------
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil
			  'evil-surround
			  'evil-magit
			  'org
			  'helm
			  'projectile
			  'powerline
			  'ox-twbs
			  'ox-impress-js
			  'org-bullets
			  'monokai-theme
			  'magit)
			  

;; -------------- import packages --------------
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'helm-config)
(helm-mode 1)
(require 'org)
(setq org-log-done t)
(require 'powerline)
(powerline-default-theme)
(require 'evil-magit)
(require 'ox-twbs)
(require 'ox-impress-js)
(require 'org-bullets)
(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(global-linum-mode t)
(setq ring-bell-function 'ignore)
;; -------------- custom key bindings --------------
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
