
;;; Code:




;; restart
(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package ace-window
  :bind (("M-o" . 'ace-window))
  )



(provide 'init-packages)
;;; init-packages.el ends here
