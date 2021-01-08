

(use-package smart-compile)


;; (define-key c++-mode-map (kbd "<f5>") 'smart-compile)


(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (defun C-save-hooks ()
  (add-hook 'before-save-hook #'eglot-format-buffer))
  :hook
  ((c-mode c++-mode) . eglot-ensure)
  ((c-mode c++-mode) . C-save-hooks)
  )

;; (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
;; (setq ff-quiet-mode t)
;; ;; 找不到同名文件时不创建
;; (setq ff-always-try-to-create nil)
;; (setq cc-search-directories '("."
;;                               "/usr/include"
;;                               "/usr/local/include/*"
;;                               "../*/include"
;;                               "../*/src"
;;                               "$PROJECT/include"
;;                               "$PROJECT/src"
;;                               "/usr/local/opt/llvm/include/c++/v1"
;;                               ))

(provide 'init-c)
