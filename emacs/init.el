



;; set up MELPA
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


(eval-when-compile (require 'use-package))





(setq make-backup-files nil)
(setq inhibit-startup-message t)
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode -1)
(load-theme 'modus-vivendi t)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))





(use-package gruvbox-theme)
; (load-theme 'gruvbox)

(use-package evil)
(require 'evil)
(evil-mode 1)

(setq evil-insert-state-cursor 'box)

;; send emacs garbage to other file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
