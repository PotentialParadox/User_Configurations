;;; cmake-ide-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cmake-ide-maybe-start-rdm cmake-ide-compile cmake-ide-run-cmake
;;;;;;  cmake-ide-maybe-run-cmake cmake-ide-setup) "cmake-ide" "cmake-ide.el"
;;;;;;  (22267 57351 49438 768000))
;;; Generated autoloads from cmake-ide.el

(autoload 'cmake-ide-setup "cmake-ide" "\
Set up the Emacs hooks for working with CMake projects.

\(fn)" nil nil)

(autoload 'cmake-ide-maybe-run-cmake "cmake-ide" "\
Run CMake if the compilation database JSON file is not found.

\(fn)" t nil)

(autoload 'cmake-ide-run-cmake "cmake-ide" "\
Run CMake and set compiler flags for auto-completion and flycheck.
This works by calling cmake in a temporary directory (or cmake-ide-build-dir)
and parsing the JSON file deposited there with the compiler
flags.

\(fn)" t nil)

(autoload 'cmake-ide-compile "cmake-ide" "\
Compile the project.

\(fn)" t nil)

(autoload 'cmake-ide-maybe-start-rdm "cmake-ide" "\
Start the rdm (rtags) server.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("cmake-ide-pkg.el") (22267 57351 57921
;;;;;;  16000))

;;;***

(provide 'cmake-ide-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cmake-ide-autoloads.el ends here
