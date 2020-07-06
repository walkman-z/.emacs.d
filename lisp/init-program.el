
;;; Code:



(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(defun C-save-hooks ()
  (add-hook 'before-save-hook #'eglot-format-buffer))

(add-hook 'c-mode-hook 'C-save-hooks)
(add-hook 'c++-mode-hook 'C-save-hooks)

(provide 'init-program)
;;; init-program.el ends here
