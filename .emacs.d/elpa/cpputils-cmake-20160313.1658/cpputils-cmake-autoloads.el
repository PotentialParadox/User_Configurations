;;; cpputils-cmake-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cppcm-reload-all cppcm-recompile cppcm-compile
;;;;;;  cppcm-version cppcm-get-exe-path-current-buffer) "cpputils-cmake"
;;;;;;  "cpputils-cmake.el" (22266 52741 290777 669000))
;;; Generated autoloads from cpputils-cmake.el

(autoload 'cppcm-get-exe-path-current-buffer "cpputils-cmake" "\


\(fn)" t nil)

(autoload 'cppcm-version "cpputils-cmake" "\


\(fn)" t nil)

(autoload 'cppcm-compile "cpputils-cmake" "\
Compile the executable/library in current directory,
default compile command or compile in the build directory.
You can specify the sequence which compile is default
by customize `cppcm-compile-list'.

\(fn &optional PREFIX)" t nil)

(autoload 'cppcm-recompile "cpputils-cmake" "\
make clean;compile

\(fn)" t nil)

(autoload 'cppcm-reload-all "cpputils-cmake" "\
Reload and reproduce everything

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("cpputils-cmake-pkg.el") (22266 52741
;;;;;;  301636 313000))

;;;***

(provide 'cpputils-cmake-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cpputils-cmake-autoloads.el ends here
