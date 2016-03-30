;;; company-irony-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (company-irony-setup-begin-commands company-irony)
;;;;;;  "company-irony" "company-irony.el" (22266 39405 914956 197000))
;;; Generated autoloads from company-irony.el

(autoload 'company-irony "company-irony" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-irony-setup-begin-commands "company-irony" "\
Include irony trigger commands to `company-begin-commands'.

This allow completion to be automatically triggered after member
accesses (obj.|, obj->|, ...).

This may be useful to company < `0.8.4', newer version of company
include these commands by default.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("company-irony-pkg.el") (22266 39405 920741
;;;;;;  668000))

;;;***

(provide 'company-irony-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; company-irony-autoloads.el ends here
