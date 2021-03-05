
;;; Code:




;; restart
(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package try)

(provide 'init-packages)
;;; init-packages.el ends here
