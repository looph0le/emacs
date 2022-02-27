;;package
(require 'package)
(setq package-enable-at-startup t)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package the-matrix-theme
  :ensure t
  :init
  (load-theme 'the-matrix t))
	
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(fringe-mode -1)

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
	     '(font . "Terminus-9"))


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
  (setq dashboard-startup-banner "~/.emacs.d/wow.png")
  (setq dashboard-banner-logo-title "Welcome ladies and gentlement to looph0le's Emacs!!"))

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
