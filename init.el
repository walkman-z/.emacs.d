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

;; 对应括号及彩虹高亮

;;;已自带
;;;(use-package show-paren-mode)

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'show-paren-mode)
  )


;; (use-package clang-format)
;; (global-set-key (kbd "C-c C-f") 'clang-format-region)

(when (file-exists-p custom-file)
  (load-file custom-file))





(provide 'init)
