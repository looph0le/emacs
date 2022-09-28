;;package
(require 'package)
(setq package-enable-at-startup t)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package ewal-doom-themes 
  :ensure t
  :init)


(use-package magit
  :ensure t)

(load-theme 'ewal-doom-vibrant t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(fringe-mode -1)

;(setq-default mode-line-format nil)

(setq ring-bell-function 'ignore)

;;evil mode(vim key bindings)
(use-package evil
	:ensure t
	:init
	(setq evil-want-integreation t)
	(setq evil-want-keybinding nil)
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
	(evil-mode))
(use-package evil-collection
	:after evil
	:ensure t
	:config
	(evil-collection-init))

(setq redisplay-dont-pause t
  scroll-margin -1
  scroll-step -1
  scroll-conservatively 10000
  scroll-preserve-screen-position -1)

(add-hook 'text-mode-hook 'visual-line-mode)

;;numberline
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type t)

(use-package which-key
:ensure t)
(which-key-mode)

;;change font size on fly
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)

(add-to-list 'default-frame-alist
	     '(font . "FantasqueSansMono Nerd Font-12"))


(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-directory "~/Org/"
      org-ellipsis " ▼ "
      org-hide-emphasis-markers t)
(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-support-shift-select t)

(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 2)
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Welcome ladies and gentlement to looph0le's Emacs!!"))


(setq frame-resize-pixelwise t)

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))


(use-package yasnippet-snippets
  :ensure t)
(yas-global-mode 1)

(use-package rainbow-mode
  :ensure t)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

(electric-pair-mode 1)
