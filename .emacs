(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'cl)
(defvar my-packages
  '(sws-mode async helm company lua-mode stylus-mode kixtart-mode paredit fsharp-mode magit evil powerline airline-themes)
  "Used packages.")

(if (file-exists-p "~/sim.el")
  (progn
    (load "~/sim.el")
    (require 'stupid-indent-mode)))

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
 '(custom-safe-themes
   (quote
    ("e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default)))
 '(delete-selection-mode t)
 '(package-selected-packages
   (quote
    (airline-themes powerline evil magit fsharp-mode stylus-mode spinner queue pkg-info paredit lua-mode kixtart-mode helm company clojure-mode))))
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

;;emacs speed up on big files?
;;(setq line-move-visual nil)
(setq-default bidi-display-reordering nil)
;;(set-default 'truncate-lines t)

;;suppressing ad-handle-definition Warnings
(setq ad-redefinition-action 'accept)

(add-hook 'js-mode-hook
            (lambda ()
              (push '("function" . 402) prettify-symbols-alist)))
(add-hook 'fsharp-mode-hook
          (lambda()
            (push '("|>" . 8614) prettify-symbols-alist)))
(global-prettify-symbols-mode 1)

;;fsharp
;;(add-hook 'fsharp-mode-hook
;;          (lambda ()
;;            (stupid-indent-mode)
;;            (setq adaptive-fill-mode nil)
;;            ))

;;disable C-x C-c
(global-unset-key (kbd "C-x C-c"))

;;evil vim
(require 'evil)
(evil-mode 1)

;;powerline
(require 'powerline)

;;Airline
(require 'airline-themes)
(setq airline-utf-glyph-separator-left      #x00ae
      airline-utf-glyph-separator-right     #x00af
      airline-utf-glyph-subseparator-left   #x00ae
      airline-utf-glyph-subseparator-right  #x00af
      airline-utf-glyph-branch              #x0020
      airline-utf-glyph-readonly            #x0020
      airline-utf-glyph-linenumber          #x0020)
(load-theme 'airline-light)

(server-start)
