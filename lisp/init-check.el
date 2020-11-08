

(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  ;; :hook (prog-mode . flycheck-mode)
  )

(use-package wucuo)

;(add-hook 'prog-mode-hook #'wucuo-start)
;(add-hook 'text-mode-hook #'wucuo-start)




(provide 'init-check)
