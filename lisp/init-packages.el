
;;; Code:




;; restart
(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(provide 'init-packages)
;;; init-packages.el ends here
