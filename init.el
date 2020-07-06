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
(require 'init-elpa)			;软件源及包管理器初始化

(require 'init-ui)
(require 'init-company)
(require 'init-check)
(require 'init-crux)
(require 'init-ivy)
(require 'init-git)
(require 'init-packages)

(require 'init-avy)
(require 'init-tex)
(require 'init-paren)
(require 'init-program)

;; (use-package rime
;;   :init (setq rime-translate-keybindings
;; 	      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
;;   (setq rime-show-candidate 'posframe)
;;   (setq rime-cursor "˰")
;;   (setq rime-disable-predicates
;;       '(;rime-predicate-evil-mode-p
;;         rime-predicate-after-alphabet-char-p
;;         rime-predicate-prog-in-code-p))
;;   :custom
;;   (default-input-method "rime"))

(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init)
;;; init.el ends here


;;; init-xxaxs .el ends here
