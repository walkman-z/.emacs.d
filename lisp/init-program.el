
;;; Code:

;; (add-to-list 'load-path "~/.emacs.d/elpa/nox/")
;; (require 'nox)
;; (add-to-list 'nox-server-programs '((c++-mode c-mode) "clangd"))
;; (dolist (hook (list
;;                'js-mode-hook
;;                'rust-mode-hook
;;                'python-mode-hook
;;                'ruby-mode-hook
;;                'java-mode-hook
;;                'sh-mode-hook
;;                'php-mode-hook
;;                'c-mode-common-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'haskell-mode-hook
;;                ))
;;   (add-hook hook '(lambda () (nox-ensure))))

;; (defun C-save-hooks ()
;;   (add-hook 'before-save-hook #'nox-format-buffer))
;; (add-hook 'c-mode-hook 'C-save-hooks)
;; (add-hook 'c++-mode-hook 'C-save-hooks)



(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (defun C-save-hooks ()
  (add-hook 'before-save-hook #'eglot-format-buffer))
  :hook
  ((c-mode c++-mode) . eglot-ensure)
  ((c-mode c++-mode) . C-save-hooks)
  )


(provide 'init-program)
;;; init-program.el ends here
