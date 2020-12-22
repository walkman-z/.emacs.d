;;; init-org.el --- org
;;; Commentary:
;;; Code:



(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


(add-hook 'org-mode-hook
    (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook
	  'org-indent-mode)


(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (C . t)
        ;; (java . t)
        ;; (js . t)
        ;; (ruby . t)
        ;; (ditaa . t)
        ;; (python . t)
        (shell . t)
        (latex . t)
        ;; (plantuml . t)
        ;; (R . t)
	)
      )


(require 'org-tempo)


;; (require 'org-download)
;; (add-hook 'dired-mode-hook
;; 	  'org-download-enable)
;; (add-hook 'org-mode-hook
;;           #'org-download-enable)







;; (quelpa '(valign :fetcher github :repo "casouri/valign"))
;; (use-package valign
;;   :quelpa (valign :fetcher github :repo "casouri/valign")
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook #'valign-mode))
;; (require 'valign)
;; (add-hook 'org-mode-hook #'valign-mode)

;; (add-hook 'org-mode-hook #'valign-mode)

(provide 'init-org)

;;; init-org.el ends here

