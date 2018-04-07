;; org mode
(require 'org)
(setq org-indent-mode t)
(setq org-indent-indentation-per-level 2)

(add-hook 'org-mode-hook
          (lambda()
            (hl-line-mode -1)
            (global-hl-line-mode -1))
          't
          )
(add-hook 'org-mode-hook 'turn-on-olivetti-mode)
(setq org-hierarchical-todo-statistics nil)
(setq prelude-whitespace nil)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; elpy
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; pep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; helm
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)
(setq helm-ff-file-name-history-use-recentf t)
;; keep a list of recently opened files                                                                      
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")
(require 'helm-projectile)
(helm-projectile-on)

(require 'markdown-mode)
