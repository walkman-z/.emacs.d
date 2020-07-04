;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues

(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-const)
(require 'init-kbd)
(require 'init-unicode)
(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)



;(require 'init-lsp)
(require 'init-tex)
(require 'init-company)
(require 'init-check)
(require 'init-packages)
(require 'init-git)


(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init)
