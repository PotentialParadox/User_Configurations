;;; === Begin Package Management ===
(require 'package)
;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
;;; === End Package Management ===

;;; === Begin Path Management ===
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;;; === End Path Management ===

;;; === Begin Bash Completion ===
(require 'bash-completion)
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
(require 'evil)
(require 'evil-leader)
(require 'evil-nerd-commenter)
(require 'evil-mc)
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
(require 'magit)
;;; === End Magit Configurations ===

;;; === Begin Company Initalization ===
(require 'company)
;;; === End Company Initalization ===

;;; === Begin Flycheck Initialization ===
(require 'flycheck)
;;; === End Flycheck Initialization ===

;;; === Begin Helm Configuration ===
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") `helm-M-x)
;;; === End Helm Configuration ===

;;; === Begin Projectile Configuration ===
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;;; === End Projectile Configuration ===

;;; !!!!!!! Begin C++ Configuration !!!!!!!!

;; Folding
(add-hook 'c-mode-common-hook   'hs-minor-mode)

;; === Begin CMake Initialization ===
(require 'cmake-mode)
;; === End CMake Initialization ===

;;; === Begin Rtags Configuration ===
;; First install rtags following the guide here
;; https://github.com/Andersbakken/rtags#tldr-quickstart
(require 'rtags)
(require 'company-rtags)
(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)
;;; === End Rtags Configuration ===

;;; === Begin Irony Configuration ===
(require 'irony)
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

(require 'company-irony-c-headers)
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

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))
;;; === End C++ Flycheck Configuration ===

;;; === Begin cmake-ide Configuration ===

(require 'cmake-ide)
;; Add this line to a .dir-locals.el
;; ((nil . ((cmake-ide-build-dir "<PATH_TO_PROJECT_BUILD_DIRECTORY>"))))

;;; === End cmake-ide Configuration ===

;;; !!!!!!! End C++ Configuration !!!!!!!!

;;; === Begin Theme ===

;; Remove the damn bells
(setq ring-bell-function 'ignore)

;; Numbers
(global-linum-mode 1)

;; Adjust the windows dynamically
(require 'golden-ratio)

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

(load-theme 'monokai t) 
;;; === End Theme ===
