;;; package --- summary
;;; Commentary: 
(require 'package)
;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; == irony-mode ==
(require 'irony)

;; == set company backend to jedi ==
;; == company ==
;; == Clang must be installed and simlinked to /usr/bin/clang ==
(require 'company)
(require 'company-irony)
(require 'company-jedi)
(setq company-backends (delete 'company-semantic company-backends))
(add-hook 'after-init-hook 'global-company-mode)
(defun my-c++-mode-hook ()
  (irony-mode 1)
  (add-to-list 'company-backends 'company-irony))
(add-hook 'c++-mode-hook 'my-c++-mode-hook ())

(require 'cmake-project)
(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

;; Comment: You most likely will need to change this directory
;; Before you do though "pip install -U Path/to/jedi-core.../"
(setq jedi:server-command '("~/.emacs.d/elpa/jedi-core-20151214.705/jediepcserver.py"))
(defun my-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(require `helm)
(require `helm-config)
(global-set-key (kbd "M-x") `helm-M-x)

(require `evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "f" `find-file 
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

(require `evil)
(evil-mode 1)

(require `evil-mc)
(global-evil-mc-mode 1)

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; (global-flycheck-mode)
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

;; == ede ==
;; Project Management
;; (global-ede-mode t)


;; Allow code folding
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(load-theme 'solarized t)

;; Avoid annoying backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; Scrolling
(setq scroll-conservatively most-positive-fixnum)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: golden-ratio                         ;;
;;                                               ;;
;; GROUP: Environment -> Windows -> Golden Ratio ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;
