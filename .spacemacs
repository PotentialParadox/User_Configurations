;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     javascript
     csv
     ranger
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     bibtex
     haskell
     ess
     (python :variables
             python-backend 'anaconda
             python-fill-column 99
             python-enable-yapf-format-on-save t
             python-auto-set-local-pyvenv-virtualenv 'on-visit)
     html
     helm
     (auto-completion :variables
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior nil
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.2
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-confirm-babel-evaluate 'nil
          org-deadline-warning-days 21
          )

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     pdf-tools
     ;; syntax-checking
     version-control
     (latex :variables
            TeX-view-program-selection '((output-pdf "PDF Tools"))
            TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
            latex-enable-folding t
            TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; Aesthetics
                                      doom-themes
                                      fontawesome
                                      org-bullets
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-light
                         doom-material
                         doom-wilmersdorf
                         doom-Iosvkem
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (defun my-org-mode-hook ()
    (setq-local yas-buffer-local-condition
                '(not (org-in-src-block-p t))))
  (add-hook 'org-mode-hook #'my-org-mode-hook)


  (defun yas-org-very-safe-expand ()
    (let ((yas-fallback-behavior 'return-nil)) (yas-expand)))
  (add-hook 'org-mode-hook
            (lambda ()
              (add-to-list 'org-tab-first-hook 'yas-org-very-safe-expand)
              (define-key yas-keymap [tab] 'yas-next-field)))


  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'fontawesome)
  (require 'org-depend)
  (spacemacs/set-leader-keys "or" `rename-buffer)
  (spacemacs/set-leader-keys "os" `ansi-term)
  (setq explicit-shell-file-name "/usr/bin/zsh")
  (spacemacs/set-leader-keys "ob" `eww-back-url)
  (spacemacs/set-leader-keys "of" `eww-forward-url)
  (spacemacs/set-leader-keys "oy" `org-store-link)
  (spacemacs/set-leader-keys "op" `org-insert-link)
  (spacemacs/set-leader-keys "oa" `org-agenda)
  (spacemacs/set-leader-keys "oc" `org-capture)
  (spacemacs|disable-company eshell-mode)
  (set-default 'truncate-lines t)
  (setq org-plan "/home/dustin/plantuml.jar")
  (setq-default evil-search-module 'evil-search)
  (add-hook `org-mode-hook `turn-on-auto-fill)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/.local/bin/")
  (setq tab-always-indent `complete)
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-fold-mode 1)))
  (setq-default helm-display-function 'helm-default-display-buffer)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)
     (latex . t)
     (plantuml . t)
     (matlab . t)))

  ;; Clockout with exit
  (defun my/org-clock-query-out ()
    "Ask the user before clocking out.
This is a useful function for adding to `kill-emacs-query-functions'."
    (if (and
         (featurep 'org-clock)
         (funcall 'org-clocking-p)
         (y-or-n-p "You are currently clocking time, clock out? "))
        (org-clock-out)
      t)) ;; only fails on keyboard quit or error

  ;; timeclock.el puts this on the wrong hook!
  (add-hook 'kill-emacs-query-functions 'my/org-clock-query-out)

  ;; Org Mode: Aesthetics
  (add-hook 'org-mode-hook (lambda ()
                             "Beautify Org Checkbox Symbol"
                             (push '("[ ]" .  "☐") prettify-symbols-alist)
                             (push '("[X]" . "☑" ) prettify-symbols-alist)
                             (push '("[-]" . "❍" ) prettify-symbols-alist)
                             (prettify-symbols-mode)))

  ;; Activate PlantUML
  (setq org-plantuml-jar-path
        "/home/dustin/Applications/plantuml/plantuml.jar")

  ;; Truncate lines for fish
  (add-hook 'term-mode-hook 'toggle-truncate-lines)

  ;;default ess to use R (via https://gist.github.com/benmarwick/ee0f400b14af87a57e4a)
  (require 'ess-mode)
  (defun ess-set-language ()
    (setq-default ess-language "R")
    (setq ess-language "R")
    )
  (defun then_R_operator ()
    "R - %>% operator or 'then' pipe operator"
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (reindent-then-newline-and-indent))
  (define-key ess-mode-map (kbd "C-|") 'then_R_operator)
  (define-key inferior-ess-mode-map (kbd "C-|") 'then_R_operator)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "001e4dbbdb8d01bb299c0244c489504d51ef5939ace24049079b377294786f7c" "1c8171893a9a0ce55cb7706766e57707787962e43330d7b0b6b0754ed5283cda" "07e3a1323eb29844e0de052b05e21e03ae2f55695c11f5d68d61fb5fed722dd2" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "cb96a06ed8f47b07c014e8637bd0fd0e6c555364171504680ac41930cfe5e11e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "777a3a89c0b7436e37f6fa8f350cbbff80bcc1255f0c16ab7c1e82041b06fccd" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" default))
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-custom-commands
   '(("n" "Show Next Items"
      ((stuck "" nil)
       (todo "WAITING" nil)
       (todo "ONGOING" nil)
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/sprint.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/phd.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/oxyML.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/teaching.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/personal.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Documents/MyOrgs/social.org"))))
       (todo "NEXT"
             ((org-agenda-files
               '("~/Dropbox/orgs/programming.org")))))
      nil nil)))
 '(org-agenda-files
   '("~/Documents/MyOrgs/personal.org" "~/Documents/MyOrgs/phd.org" "~/Documents/MyOrgs/sprint.org" "~/Documents/MyOrgs/teaching.org" "~/Documents/MyOrgs/social.org" "~/Documents/MyOrgs/archives/cooking-archive.org"))
 '(org-capture-templates
   '(("h" "Husband Template")
     ("ht" "Husband Todo" entry
      (file+headline "~/Documents/MyOrgs/inbox.org" "Inbox")
      (file "~/Documents/MyOrgs/templates/tpl-todo.txt"))
     ("i" "Inbox" entry
      (file+headline "~/Documents/MyOrgs/inbox.org" "Inbox")
      (file "~/Documents/MyOrgs/templates/tpl-todo.txt"))
     ("c" "Cooking")
     ("ct" "Cooking Todo" entry
      (file+headline "~/Documents/MyOrgs/cooking.org" "Recipes")
      (file "~/Documents/MyOrgs/templates/food-todo.txt"))
     ("t" "Teaching")
     ("tl" "New Lesson" entry
      (file+headline "~/Documents/MyOrgs/teaching.org" "Lessons")
      (file "~/Documents/MyOrgs/templates/lesson-todo.txt"))
     ("r" "Reviews")
     ("rm" "Morning Review" entry
      (file "~/Documents/MyOrgs/reviews.org")
      (file "~/Documents/MyOrgs/templates/morning-review.txt"))
     ("re" "Evening Review" entry
      (file "~/Documents/MyOrgs/reviews.org")
      (file "~/Documents/MyOrgs/templates/evening-review.txt"))
     ("rc" "Checkout Review" entry
      (file "~/Documents/MyOrgs/reviews.org")
      (file "~/Documents/MyOrgs/templates/checkout-review.txt"))
     ("rw" "Weekly Review" entry
      (file "~/Documents/MyOrgs/reviews.org")
      (file "~/Documents/MyOrgs/templates/weekly-review.txt"))))
 '(org-enforce-todo-dependencies t)
 '(org-log-into-drawer t)
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :maxlevel . 2)))
 '(org-refile-use-outline-path 'file)
 '(org-stuck-projects
   '("TODO=\"PROJECT\""
     ("NEXT" "NEXTACTION" "ONGOING")
     nil ""))
 '(package-selected-packages
   '(ranger ess-smart-equals ess-R-data-view ctable ess julia-mode insert-shebang fish-mode company-shell fontawesome web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode csv-mode olivetti doom-themes flyspell-correct-helm flyspell-correct auto-dictionary org-ref key-chord ivy helm-bibtex parsebib biblio biblio-core company-quickhelp pos-tip intero flycheck hlint-refactor hindent helm-hoogle haskell-snippets company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data xterm-color smeargle shell-pop pdf-tools tablist orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy evil-magit magit git-commit with-editor transient eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company-auctex company auto-yasnippet yasnippet auctex-latexmk auctex ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
