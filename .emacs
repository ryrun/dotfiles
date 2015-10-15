(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'cl)
(defvar my-packages
  '(sws-mode async helm company lua-mode stylus-mode kixtart-mode multiple-cursors paredit fsharp-mode)
  "Used packages.")

(if (file-exists-p "~/sim.el")
  (load "~/sim.el")
  (require 'stupid-indent-mode))
 
(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))
 
(unless (my-packages-installed-p)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;config start
(load-theme 'manoj-dark t)
(require 'helm-config)
;;(helm-mode 1)

(set-frame-parameter (selected-frame) 'alpha '(95 50))
(add-to-list 'default-frame-alist '(alpha 95 50))
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -99)
(setq make-backup-files nil)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(global-linum-mode t)
;;(add-hook 'after-init-hook 'global-company-mode)

(set-default-font "Source Code Pro-11")

(blink-cursor-mode 1)
(set-cursor-color "#ffffff") 
(setq-default cursor-type 'bar)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;(global-set-key (kbd "C-x b") 'helm-mini)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;emacs speed up on big files?
(setq line-move-visual nil)
(setq-default bidi-display-reordering nil)
(set-default 'truncate-lines t)

;;suppressing ad-handle-definition Warnings
(setq ad-redefinition-action 'accept)

(add-hook 'js-mode-hook
            (lambda ()
              (push '("function" . 402) prettify-symbols-alist)))
(global-prettify-symbols-mode 1)

;;fsharp
(add-hook 'fsharp-mode-hook
          (lambda ()
            (stupid-indent-mode)
            (setq adaptive-fill-mode nil)
            ))

;;disable C-x C-c
(global-unset-key (kbd "C-x C-c"))

(server-start)
