[

(use-package foo
:if window-system  ;; only load module when condition is true (eg: gui emacs)
:init  ;; evaluate some elisp before the package is loaded
:config  ;; eval some elisp after the package is loaded
:defer t  ;; lazy-loading: package is only loaded when command from it are actually used
:ensure t  ;; automatically install the package if not already present on the system
:custom  ;; allows customization of package custom variables
:after <package-name>  ;; only configure package after another package has already been loaded
:diminish <mode-name>  ;; keep effect of minor-mode, but hide or abbreviate it in the modeline display (eg: abbrev-mode)
:hook <function>  ;; add functions onto package hooks
:commands  ;; provide triggers, that cause a package to be loaded when certain events occur (needs :defer t)
:demand t  ;; load package anyway: override package deferral
:bind ("C-." . ace-jump-mode)  ;; bind a key
:chords  ;; bind key chords
)

]

(load "server")
(unless (server-running-p) (server-start))

;; Meta X no ^ in the front
(setq ivy-initial-inputs-alist nil)
	

;; restore default tabs
(global-set-key (kbd "TAB") 'self-insert-command)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))


;; no confirm kill prompt
(setq confirm-kill-processes nil)
(setq confirm-kill-emacs nil)

(setq scroll-margin 15
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position t
      auto-window-vscroll nil)
;;(text-scale-set 1)


;;(set-frame-font "JetBrainsMono NerdFont 16" nil t)


;;(global-unset-key (kbd "C-m"))
;;(keymap-global-set "C-m" 'neotree-toggle)
;;(global-unset-key (kbd "C-t"))
;;(global-set-key (kbd "C-t") nil)
;;(keymap-global-set "C-t" 'vterm-toggle)
  ;;(load-theme 'deeper-blue' t)
  ;;(setq evil-want-C-u-scroll t)
;;(setq warning-minimum-level :emergency)

(add-to-list 'load-path "~/.config/emacs/scripts/")

(require 'elpaca-setup)  ;; The Elpaca Package Manager
(require 'buffer-move)   ;; Buffer-move for better window management

(use-package nerd-icons
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  (nerd-icons-font-family "JetBrainsMono Nerd Font")
  )

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

(use-package beacon
  :init
  (beacon-mode 1)
  :config
  ;;(setq beacon-size 10)
)

(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package dashboard
  :ensure t 
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-projects-backend 'projectile)
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-set-init-info nil)
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-page-separator "\n\n")
  ;;(setq dashboard-page-separator "\n............................................................................................................................................\n\n")


  (setq dashboard-footer-messages '("The One True Editor!"
                                    "Protocol 3: Protect the Pilot"
                                    "All systems nominal."
                                    "Democracy... is non negotiable."
                                    "It's my way or... hell, it's my way!"
                                    "Make life rue the day it though it could give Richard Stallman lemons!"
                                    "Vi-Vi-Vi, the editor of the beast."
                                    "Happy hacking!"
                                    "While any text editor can save your files, only Emacs can save your soul."
                                    "There's an Emacs package for that."
                                    "Rip and tear, until it is done!"
                                    "It's time to kick ass and chew bubblegum... and I'm all outta gum."
                                    "Eight Megabytes And Constantly Swapping"
                                    "Escape Meta Alt Control Super"
                                    "M-x butterfly"
                                    "The thermonuclear word processor."
                                    "The best OS!"
                                    ""))


  ;;(setq dashboard-startup-banner "/home/lukas/.config/emacs/images/emacs-dash.png") ;; 300x300
  (setq dashboard-startup-banner "/home/lukas/.config/emacs/images/emacslogo.png") ;; 300x300
  ;;(setq dashboard-image-banner-max-height 250)
  ;;(setq dashboard-image-banner-max-width 500)

  (setq dashboard-banner-logo-title "Vim is deprecated!")
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  :custom
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  :config
  (dashboard-setup-startup-hook)

  ;;:hook
  ;;(dashboard-mode . hide-mode-line-mode)
  ;;(dashboard-mode . turn-off-solaire-mode)


)

(use-package diminish)

(use-package dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv"))))

(use-package peep-dired
  :after dired
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)
)

;;(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(use-package evil-search-highlight-persist
:ensure t
:init
;;(global-evil-search-highlight-persist t)
:config
;;(global-set-key (kbd "C-h") 'evil-search-highlight-persist-remove-all)
;;(lukas/leader-keys
  ;;"t n" '(treemacs :wk "Remove Highlighting"))
)

(use-package key-chord
:ensure t
:init
(key-chord-mode 1))

;; Expands to: (elpaca evil (use-package evil :demand t))
(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-integration t  ;; This is optional since it's already set to t by default.
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t
          evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
    (setq evil-want-C-u-scroll t)
    (blink-cursor-mode -1)
	:config
	(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)  ;; maps j to gj
	(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)  ;; maps k to gk

	;;Exit insert mode by pressing j and then j quickly
	(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
	(setq evil-search-module 'evil-search)


;;(with-eval-after-load 'evil-maps ;; remapping keys
  ;;(define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  ;;(define-key evil-motion-state-map (kbd ";") 'evil-ex))


    (evil-mode))
  (use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))
  (use-package evil-tutor)

;; Using RETURN to follow links in Org/Evil 
;; Unmap keys in 'evil-maps if not done, (setq org-return-follows-link t) will not work
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
;; Setting RETURN key in org-mode to follow links
  (setq org-return-follows-link  t)

(use-package evil-commentary
  :ensure t
  :defer t
  :diminish
  :init (evil-commentary-mode))

;; (use-package flycheck
;;   :ensure t
;;   :defer t
;;   :diminish
;;   :init (global-flycheck-mode))

;;(set-face-attribute 'default nil
  ;;:font "JetBrains Mono"
  ;;:height 110
  ;;:weight 'medium)
;;(set-face-attribute 'variable-pitch nil
  ;;:font "Ubuntu"
  ;;:height 120
  ;;:weight 'medium)
;;(set-face-attribute 'fixed-pitch nil
  ;;:font "JetBrains Mono"
  ;;:height 110
  ;;:weight 'medium)


;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
;;(set-face-attribute 'font-lock-comment-face nil
  ;;:slant 'italic)
;;(set-face-attribute 'font-lock-keyword-face nil
  ;;:slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-15"))

;; Uncomment the following line if line spacing needs adjusting.
;;(setq-default line-spacing 0.12)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  (general-create-definer lukas/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC") ;; access leader in insert mode

(lukas/leader-keys
  "SPC" '(counsel-M-x :wk "Counsel M-x")
  "." '(find-file :wk "Find file")
  "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
  "f r" '(counsel-recentf :wk "Find recent files")
  "TAB TAB" '(comment-line :wk "Comment lines"))


  (lukas/leader-keys
    "b" '(:ignore t :wk "Bookmarks/Buffers")
    "b c" '(clone-indirect-buffer :wk "Create indirect buffer copy in a split")
    "b C" '(clone-indirect-buffer-other-window :wk "Clone indirect buffer in new window")
    "b d" '(bookmark-delete :wk "Delete bookmark")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b K" '(kill-some-buffers :wk "Kill multiple buffers")
    "b l" '(list-bookmarks :wk "List bookmarks")
    "b m" '(bookmark-set :wk "Set bookmark")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b R" '(rename-buffer :wk "Rename buffer")
    "b s" '(basic-save-buffer :wk "Save buffer")
    "b S" '(save-some-buffers :wk "Save multiple buffers")
    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file"))

  (lukas/leader-keys
    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Open dired")
    "d j" '(dired-jump :wk "Dired jump to current")
    "d n" '(neotree-dir :wk "Open directory in neotree")
    "d p" '(peep-dired :wk "Peep-dired"))


(lukas/leader-keys
  "e" '(:ignore t :wk "Eshell/Evaluate")    
  "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
  "e d" '(eval-defun :wk "Evaluate defun containing or after point")
  "e e" '(eval-expression :wk "Evaluate and elisp expression")
  "e h" '(counsel-esh-history :which-key "Eshell history")
  "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
  "e r" '(eval-region :wk "Evaluate elisp in region")
  "e s" '(eshell :which-key "Eshell"))

 (lukas/leader-keys
    "h" '(:ignore t :wk "Help")
    "h a" '(counsel-apropos :wk "Apropos")
    "h b" '(describe-bindings :wk "Describe bindings")
    "h c" '(describe-char :wk "Describe character under cursor")
    "h d" '(:ignore t :wk "Emacs documentation")
    "h d a" '(about-emacs :wk "About Emacs")
    "h d d" '(view-emacs-debugging :wk "View Emacs debugging")
    "h d f" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "h d m" '(info-emacs-manual :wk "The Emacs manual")
    "h d n" '(view-emacs-news :wk "View Emacs news")
    "h d o" '(describe-distribution :wk "How to obtain Emacs")
    "h d p" '(view-emacs-problems :wk "View Emacs problems")
    "h d t" '(view-emacs-todo :wk "View Emacs todo")
    "h d w" '(describe-no-warranty :wk "Describe no warranty")
    "h e" '(view-echo-area-messages :wk "View echo area messages")
    "h f" '(describe-function :wk "Describe function")
    "h F" '(describe-face :wk "Describe face")
    "h g" '(describe-gnu-project :wk "Describe GNU Project")
    "h i" '(info :wk "Info")
    "h I" '(describe-input-method :wk "Describe input method")
    "h k" '(describe-key :wk "Describe key")
    "h l" '(view-lossage :wk "Display recent keystrokes and the commands run")
    "h L" '(describe-language-environment :wk "Describe language environment")
    "h m" '(describe-mode :wk "Describe mode")
    "h r" '(:ignore t :wk "Reload")
    "h r r" '((lambda () (interactive)
                (load-file "~/.config/emacs/init.el")
                (ignore (elpaca-process-queues)))
              :wk "Reload emacs config")
    "h t" '(load-theme :wk "Load theme")
    "h v" '(describe-variable :wk "Describe variable")
    "h w" '(where-is :wk "Prints keybinding for command if set")
    "h x" '(describe-command :wk "Display full documentation for command"))


(lukas/leader-keys
  "m" '(:ignore t :wk "Org")
  "m a" '(org-agenda :wk "Org agenda")
  "m e" '(org-export-dispatch :wk "Org export dispatch")
  "m i" '(org-toggle-item :wk "Org toggle item")
  "m t" '(org-todo :wk "Org todo")
  "m B" '(org-babel-tangle :wk "Org babel tangle")
  "m T" '(org-todo-list :wk "Org todo list"))

(lukas/leader-keys
  "m b" '(:ignore t :wk "Tables")
  "m b -" '(org-table-insert-hline :wk "Insert hline in table"))

(lukas/leader-keys
  "m d" '(:ignore t :wk "Date/deadline")
  "m d t" '(org-time-stamp :wk "Org time stamp"))

(lukas/leader-keys
  "p" '(projectile-command-map :wk "Projectile"))

 (lukas/leader-keys
  "t" '(:ignore t :wk "Toggle")
  "t e" '(eshell-toggle :wk "Toggle eshell")
  "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
  ;;"t n" '(neotree-toggle :wk "Toggle neotree file viewer")
  ;;"t n" '(treemacs :wk "Toggle Treemacs")
  "t t" '(visual-line-mode :wk "Toggle truncated lines")
  "t v" '(vterm-toggle :wk "Toggle vterm"))

(lukas/leader-keys
  "w" '(:ignore t :wk "Windows")
  ;; Window splits
  "w c" '(evil-window-delete :wk "Close window")
  "w n" '(evil-window-new :wk "New window")
  "w s" '(evil-window-split :wk "Horizontal split window")
  "w v" '(evil-window-vsplit :wk "Vertical split window")
  ;; Window motions
  "w h" '(evil-window-left :wk "Window left")
  "w j" '(evil-window-down :wk "Window down")
  "w k" '(evil-window-up :wk "Window up")
  "w l" '(evil-window-right :wk "Window right")
  "w w" '(evil-window-next :wk "Goto next window")
  ;; Move Windows
  "w H" '(buf-move-left :wk "Buffer move left")
  "w J" '(buf-move-down :wk "Buffer move down")
  "w K" '(buf-move-up :wk "Buffer move up")
  "w L" '(buf-move-right :wk "Buffer move right"))

)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1) ;; -1 -- also in sane defaults
(horizontal-scroll-bar-mode -1)
(global-hl-line-mode 1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;;(setq display-line-numbers 'relative)

(global-visual-line-mode t)

(setq inhibit-startup-message t)
(setq use-dialog-box nil)
(setq use-file-dialog nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;;(fringe-mode -1)
;;(setq fringe-mode nil)
;;(set-fringe-mode 0)
;;(set-fringe-mode '(0 . 0))
;;(setq set-fringe-mode 0)
;;(setq fringe-mode '(0 . 0))
;;(setq fringe-mode '(0 . 0))
;;(fringe-mode 'no-fringes' t)


(set-fringe-mode '(0 . 0))
(fringe-mode '(0 . 0))
(set-fringe-style -1)
(setq fringe-mode 0)



;;(setq make-backup-files nil)
;;(setq auto-save-default nil)

(use-package hl-todo
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

(use-package highlight-indent-guides
:ensure t
:defer t
:init
:hook (prog-mode . highlight-indent-guides-mode)
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
:config
;;(setq highlight-indent-guides-method 'bitmap) ;; 'character, fill, column, bitmap

(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)
(setq highlight-indent-guides-responsive 'top)

(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")
)

(use-package format-all
:ensure t
:config
(lukas/leader-keys
  "f a" '(format-all-buffer :wk "Format the entire buffer"))
)

(use-package counsel
  :after ivy
  :diminish
  :config (counsel-mode))


(use-package ivy
  :bind
  ;; ivy-resume resumes the last Ivy-based completion.
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window)
	 ("C-j" . 'ivy-next-line)
	 ("C-k" . 'ivy-previous-line))

  :diminish
  :custom
  (setq ivy-use-virtual-buffers t)     
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)


  :config
	(setq ivy-wrap t)
	(setq ivy-height 10)
  (ivy-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package haskell-mode)
(use-package lua-mode)
(use-package php-mode)

(global-set-key [escape] 'keyboard-escape-quit)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (column-number-mode 1)
  (setq doom-modeline-height 35      ;; sets modeline height
        doom-modeline-bar-width 5    ;; sets right bar width
        doom-modeline-persp-name t   ;; adds perspective name to modeline
        doom-modeline-persp-icon t)) ;; adds folder icon next to persp name

(setq org-indent-mode t)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
	(shell . t))
)

(setq org-confirm-babel-evaluate nil)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))



;; this will export all code blocks individually. the file name will be the same as the org file
;; foo.org -> foo.py
;;#+PROPERTY: header-args :tangle yes

;; with this you can specify a certain file to be exported to
;;##+PROPERTY: header-args:python :tangle ./example.py



;; TODO doesnt really work
;; add default arguments to use when evaluating a source block
(add-to-list 'org-babel-default-header-args
             '(:tangle . "yes"))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(electric-indent-mode -1)
(setq org-edit-src-content-indentation 0)

(eval-after-load 'org-indent '(diminish 'org-indent-mode))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(require 'org-tempo)

(use-package projectile
  :config
  (projectile-mode 1))

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

(use-package rainbow-mode
  :diminish
  :hook 
  ((org-mode prog-mode) . rainbow-mode))

(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-pair-mode 1)       ;; Turns on automatic parens pairing
;; The following prevents <> from auto-pairing when electric-pair-mode is on.
;; Otherwise, org-tempo is broken when you try to <s TAB...
(add-hook 'org-mode-hook (lambda ()
           (setq-local electric-pair-inhibit-predicate
                   `(lambda (c)
                  (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
(global-auto-revert-mode t)  ;; Automatically show changes if the file has changed
;;(global-display-line-numbers-mode 1) ;; Display line numbers
(global-visual-line-mode t)  ;; Enable truncated lines
;;(scroll-bar-mode -1)         ;; Disable the scroll bar
(setq org-edit-src-content-indentation 0) ;; Set src block automatic indent to 0 instead of 2.

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Sets the default theme to load!!! 
  ;;(load-theme 'doom-one t)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;;(doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  ;;(doom-themes-org-config))

:init
;;(load-theme 'doom-one t)
;;(load-theme 'catppuccin t)
;;(load-theme 'doom-gruvbox t)

;;(load-theme 'monokai-pro t)
  (load-theme 'kanagawa t)

(defalias 'load-theme 'counsel-load-theme)
)

(use-package monokai-pro-theme
  :ensure t
  :config
)


(use-package kanagawa-theme
  :ensure t
  :config
)

(use-package catppuccin-theme
:init
;;(load-theme 'catppuccin' t) ;; for using catppuccin
:config
(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;;(catppuccin-reload) ;; for using catppuccin
)

(use-package ef-themes
  :if window-system


)


