;;; init-const.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
(defconst *is-wsl* (and (eq system-type 'gnu/linux)
			    (string-match "-[Mm]icrosoft" operating-system-release)))
(defconst *is-linux* (eq system-type 'gnu/linux))

(defconst *is-mac* (eq system-type 'darwin))

(defconst *is-windows* (or (eq system-type 'ms-dos)
			   (eq system-type 'windows-nt)))
(cond (*is-wsl* (message "WSL"))
      (*is-linux* (message "Linux"))
      (*is-windows* (message "Windows")))

(provide 'init-const)
;;; init-const.el ends here
