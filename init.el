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
	
(load-theme 'ewal-doom-one t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(fringe-mode -1)

(setq-default mode-line-format nil)

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
(setq display-line-numbers-type 'relative)

(use-package which-key
:ensure t)
(which-key-mode)

;;change font size on fly
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)

(add-to-list 'default-frame-alist
	     '(font . "FantasqueSansMono Nerd Font-10"))


(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-directory "~/Org/"
      org-ellipsis " ▼ "
      org-hide-emphasis-markers t)
(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)


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
  (setq dashboard-startup-banner "~/.emacs.d/sward.gif")
  (setq dashboard-center-content nil)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Welcome ladies and gentlement to looph0le's Emacs!!"))

(setq frame-resize-pixelwise t)

(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
