(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq
 use-package-always-ensure t
 use-package-verbose t)

;; Any customize-based settingss should live in custom.el, not here.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(evil-set-leader 'normal (kbd "SPC"))
;;(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
;;(evil-define-key 'normal 'global (kbd "<leader>bkc") 'kill-current-buffer)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package doom-themes
  :init
  ;; TODO: For some reason, this one always asks to load the theme, maybe better in config?
  ;;(load-theme 'doom-ayu-dark)
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  :config
  ;;(load-theme 'doom-ayu-dark t)
  (load-theme 'doom-badger)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-height 15
	ivy-use-virtual-buffers t
	ivy-use-selection-prompt t))

(use-package counsel
  :after ivy
  :init
  (counsel-mode 1)
  :bind (:map ivy-minibuffer-map))

(use-package projectile
  :init
  (projectile-mode t)
  :config
  (setq projectile-enable-caching t
	projectile-completion-system 'ivy))

;; Counsel and projectile should work together.
(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

;; Company is the best Emacs completion system.
(use-package company
  :bind (("C-." . company-complete))
  :custom
  (company-idle-delay 0) ;; I always want completion, give it to me asap
  (company-dabbrev-downcase nil "Don't downcase returned candidates.")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 10 "The more the merrier.")
  :config
  (global-company-mode) ;; We want completion everywhere

  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
                        `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))

;; Make lsp-mode not freak out.
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode) ;; always link code
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-rust
  :config
  (with-eval-after-load 'rust-ts-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;; Package for interacting with language servers
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  ((rust-ts-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-prefer-flymake nil)) ;; Flymake is outdated

(use-package lsp-ui)

(use-package magit)

;; TODO: This is an alternative usecase to '/' search, need to setup keybindings.
(use-package swiper)

(use-package zoxide)

;; Better M-x command, shows more recent commands.
(use-package amx
  :init
  (amx-mode 1))

(use-package general
  :config
  (general-evil-setup t))

(use-package org-journal)

(use-package helpful)
;; Lookup functions and macros
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
;; Lookup the current symbol at point.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)
;; Lookup function (excludes macros).
(global-set-key (kbd "C-c F") #'helpful-function)

;; TODO: Ivy users can use Helpful with counsel commands.
;;(setq counsel-describe-function-function #'helpful-callable)
;;(setq counsel-describe-variable-function #'helpful-variable)

;; TODO: Package list to add.
;; - marginalia:
;; - prescient: Used for sorting and filtering
;;
;; - Need to delete files more easily within a directory/project.

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(rust "https://github.com/tree-sitter/tree-sitter-rust")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Install tresitter grammers
(dolist (source treesit-language-source-alist)
  (let ((lang (car source)))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang))))

;; Enable ts-mode by file extension
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(set-face-attribute 'default nil :font "Intone Mono Nerd Font Mono" :height 120)

(which-key-mode 1)

(defun my/open-terminal-here ()
  (interactive)
  (let ((dir default-directory))
    (start-process "terminal" nil "cosmic-term" "--working-directory" dir)))

(defun my/open-terminal-project-root ()
  (interactive)
  (let ((dir (project-root (project-current t))))
    (start-process "terminal" nil "cosmic-term" "--working-directory" dir)))

(general-define-key
:states '(normal visual)
:prefix "SPC"
"bk" 'kill-current-buffer)

(general-define-key
:states '(normal visual)
:prefix "SPC"
"bm" 'buffer-menu)

(general-define-key
:states '(normal visual)
:prefix "SPC"
"ff" 'find-file)

(general-define-key
:states '(normal visual)
:prefix "SPC"
"fz" 'counsel-fzf)

(general-define-key
 :states '(normal visual)
 :prefix "SPC"
 "th" #'my/open-terminal-here)

(general-define-key
 :states '(normal visual)
 :prefix "SPC"
 "tp" #'my/open-terminal-project-root)

;;; init.el ends here
