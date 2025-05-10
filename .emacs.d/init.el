;; Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Real important - Font
(set-frame-font "Iosevka Fixed Light 14" nil t)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install packages
(package-install-selected-packages)

;; Lockfiles
(setq auto-save-default nil
      create-lockfiles nil
      delete-old-versions -1
      vc-make-backup-files t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Window modes
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq scroll-conservatively 10000)
(setq scroll-margin 1)

;; Keybindings - Vim motions
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding 'nil)
(evil-mode)
(evil-collection-init)

(global-set-key (kbd "C-x C-l") #'toggle-truncate-lines) 
(global-set-key (kbd "<f5>") #'revert-buffer-quick)

;; Disable splash screen
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;; Mood Line
(mood-line-mode 1)

;; Relative lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Smooth scroll
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; Undo tree
(setq undo-tree-visualizer-timestamps t
      undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree-files")))
(global-undo-tree-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(setq evil-magit-state 'motion)

;; Vterm
(setq async-shell-command-display-buffer nil)
(setq vterm-toggle-fullscreen-p nil)
(setq vterm-toggle-scope 'project)
(add-to-list 'display-buffer-alist
	     '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
	       (display-buffer-reuse-window display-buffer-at-bottom)
	       (direction . bottom)
	       (dedicated . t) ;dedicated is supported in emacs27
	       (reusable-frames . visible)
	       (window-height . 0.3)))

(global-set-key (kbd "C-x C-<return>") 'vterm-toggle)
(put 'downcase-region 'disabled nil)

;; Helpful
(global-set-key (kbd "C-h f") 'helpful-function)
(global-set-key (kbd "C-h v") 'helpful-variable)
(global-set-key (kbd "C-h k") 'helpful-key)

;; Completion
(global-set-key (kbd "C-SPC")   'counsel-M-x)
(global-set-key (kbd "C-x C-b") 'counsel-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-s")     'swiper-isearch-thing-at-point)
(electric-pair-mode t)

(ivy-mode 1)
(setq ivy-count-format " [%d/%d] "
      ivy-wrap t)

;; Programming
(setq-default indent-tabs-mode nil)
(global-company-mode)

;; ediff
(setq ediff-window-setup-function #'ediff-setup-windows-plain
      ediff-split-window-function #'split-window-horizontally)
