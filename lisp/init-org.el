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

