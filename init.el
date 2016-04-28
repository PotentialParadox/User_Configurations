;;; === Begin Package Management ===
;;; Notes: If you have a long startup time. Try adding the google dns server 8.8.8.8
(require 'package)
;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;; === End Package Management ===

;;; === Begin Basics ===

;; Scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;;; === Begin Path Management ===
(use-package exec-path-from-shell
  :ensure t)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;;; === End Path Management ===

;;; === Begin Bash Completion ===
(use-package bash-completion
  :ensure t)
(bash-completion-setup)
(add-hook 'term-mode-hook 'evil-emacs-state)
(setq explicit-shell-file-name "/bin/bash")
;;; === End Bash Completion ===

;;; === Begin Custom Keys ===
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)
;;; === End Custom Keys ===

;;; === Begin Evil Configurations ===
(use-package evil
  :ensure t)
(use-package evil-leader
  :ensure t)
(use-package evil-nerd-commenter
  :ensure t)
(use-package evil-mc
  :ensure t)
(evil-mode 1)
(global-evil-mc-mode 1)
(global-evil-leader-mode)
(evil-leader/set-key
  "q" `delete-window
  "f" `helm-find-files
  "r" `shell-command
  "b" `helm-buffers-list
  "v" `split-window-right
  "h" `split-window-below
  "e" `delete-other-windows
  "s" `save-buffer
  "ci" `evilnc-comment-or-uncomment-lines
  "cl" `evilnc-quick-comment-or-uncomment-to-the-line
  "ll" `evilnc-quick-comment-or-uncomment-to-the-line
  "cc" `evilnc-copy-and-comment-lines
  "cp" `evilnc-comment-or-uncomment-paragraphs
  "cr" `comment-or-uncomment-region
  "cv" `evilnc-toggle-invert-comment-line-by-line)
;;; === End Evil Configurations ===

;;; === Begin Magit Configurations ===
(use-package magit
  :ensure t)
;;; === End Magit Configurations ===

;;; === Begin Company Initalization ===
(use-package company
  :ensure t)
;;; === End Company Initalization ===

;;; === Begin Flycheck Initialization ===
(use-package flycheck
  :ensure t)
;;; === End Flycheck Initialization ===

;;; === Begin Helm Configuration ===
(use-package helm
  :ensure t)
(require 'helm-config)
(global-set-key (kbd "M-x") `helm-M-x)
;;; === End Helm Configuration ===

;;; === Begin Projectile Configuration ===
(use-package projectile
  :ensure t)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;;; === End Projectile Configuration ===


;;; === Begin YaSnippet ===
(use-package yasnippet
  :ensure t)
;; Allow for nested snippets
(setq yas/triggers-in-field t)
;; Removes annoying newline
(setq mode-require-final-newline nil)
(yas-global-mode 1)
;;; === End YaSnippet ===


;;; !!!!!!! Begin C++ Configuration !!!!!!!!

;; Folding
(add-hook 'c-mode-common-hook   'hs-minor-mode)

;; === Begin CMake Initialization ===
(use-package cmake-mode
  :ensure t)
;; === End CMake Initialization ===

;;; === Begin Rtags Configuration ===
;; First install rtags following the guide here
;; https://github.com/Andersbakken/rtags#tldr-quickstart
(use-package rtags
  :ensure t)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)
;;; === End Rtags Configuration ===

;;; === Begin Irony Configuration ===
(use-package irony
  :ensure t)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Company auto completion
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
(add-hook 'after-init-hook 'global-company-mode)

(use-package company-irony-c-headers
  :ensure t)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;;; === End Irony Configuration ===

;;; === Begin C++ Flycheck Configuration ===
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

(require 'flycheck-rtags)
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-common-hook 'my-flycheck-rtags-setup)

(use-package flycheck-irony
  :ensure t)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))
;;; === End C++ Flycheck Configuration ===

;;; === Begin cmake-ide Configuration ===

(use-package cmake-ide
  :ensure t)
;; Add this line to a .dir-locals.el
;; ((nil . ((cmake-ide-build-dir "<PATH_TO_PROJECT_BUILD_DIRECTORY>"))))

;;; === End cmake-ide Configuration ===

;;; !!!!!!! End C++ Configuration !!!!!!!!

;;; !!!!!!! Begin Latex Configuration !!!!!!
(use-package company-auctex
  :ensure t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(global-font-lock-mode 1)
(add-hook 'latex-mode 'company-auctex-init)

;;; === Begin Theme ===

;; Remove the damn bells
(setq ring-bell-function 'ignore)

;; Numbers
(global-linum-mode 1)

;; Adjust the windows dynamically
(use-package golden-ratio
  :ensure t)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; do not enable golden-raio in thses modes
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode" "dired-mode"))

(golden-ratio-mode)

;; Remove tool-bar
(tool-bar-mode -1)

(use-package monokai-theme
  :ensure t)
(load-theme 'monokai t) 


;;; === End Theme ===


;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;;
;;;                   END of Config
;;;
;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((cmake-ide-build-dir . "/Users/dustin/Documents/USACO/holstein/bin")
     (cmake-ide-build-dir . "/Users/dustin/Documents/USACO/holstein/")
     (cmake-ide-build-dir . "/Users/dustin/Documents/USACO/sort3/")
     (cmake-ide-build-dir . "/Users/dustin/Documents/research/creparm/bin")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
