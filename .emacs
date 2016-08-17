(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t 
  :config	(which-key-mode))

(use-package helm
  :ensure t 
  :init (progn
          (require 'helm-config)))

(use-package company
  :ensure t)

(use-package lua-mode
  :ensure t)

(use-package stylus-mode
  :ensure t)

(use-package kixtart-mode
  :ensure t)

(use-package paredit
  :ensure t)

(use-package ido
  :ensure t
  :init (progn
          (ido-mode 1)
          (setq ido-everywhere t))
  :config (progn
            (setq ido-enable-flex-matching t)))

(use-package fsharp-mode
  :ensure t
  :init (progn
          (add-hook 'fsharp-mode-hook
                    (lambda()
                      (push '("|>" . 8614) prettify-symbols-alist)))
          (global-prettify-symbols-mode 1)))

(use-package web-mode
  :ensure t
  :init (progn
          (add-hook 'js-mode-hook
                    (lambda ()
                      (push '("function" . 402) prettify-symbols-alist)))
          (global-prettify-symbols-mode 1)))

(use-package magit
  :ensure t
  :bind (
         ("C-x g" . magit-status)
         ))

(use-package edit-server
  :if window-system
  :init
  (add-hook 'after-init-hook 'server-start t))

(use-package theme-changer
  :init (load-theme 'manoj-dark t))

(set-frame-parameter (selected-frame) 'alpha '(98 98))
(add-to-list 'default-frame-alist '(alpha 98 98))
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -99)
(setq make-backup-files nil)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-default-font "Source Code Pro-11")

(blink-cursor-mode 1)
(set-cursor-color "#ffffff") 
(setq-default cursor-type 'bar)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default bidi-display-reordering nil)

;;suppressing ad-handle-definition Warnings
(setq ad-redefinition-action 'accept)

;;disable C-x C-c
(global-unset-key (kbd "C-x C-c"))
