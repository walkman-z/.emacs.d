;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues



(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))



(require 'init-elpa)			;软件源及包管理器初始化

(require 'init-const)
(require 'init-kbd)
(require 'init-unicode)
(require 'init-startup)

(require 'init-company)
(require 'init-check)
(require 'init-crux)
(require 'init-ivy)
(require 'init-git)
(require 'init-packages)

(require 'init-iedit)
(require 'init-avy)
(require 'init-tex)
(require 'init-paren)
(require 'init-program)

;; org-mode
(require 'init-org)
; (require 'init-org-gtd)
(require 'init-org-roam)


;; (require 'init-rime)
(require 'init-translate)
; (require 'init-keyfreq)


;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/template/")
;; (setq auto-insert-query nil)
;; (setq auto-insert-alist
;;       (append '(c-mode . template.c)
;; 	      auto-insert-alist))

;; (use-package file-template)


;; ui set
(require 'init-ui)
(require 'init-window)

(when (file-exists-p custom-file)
  (load-file custom-file))

;; (use-package indent-guide
;;   :config
;;   (setq indent-guide-reverse t)
;;   (setq indent-guide-char ":")
;;   (indent-guide-global-mode))


(provide 'init)
;;; init.el ends here


