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
(add-hook 'org-mode-hook
	  'org-num-mode)



(require 'org-tempo)


(require 'org-download)
(add-hook 'dired-mode-hook
	  'org-download-enable)
(add-hook 'org-mode-hook
          #'org-download-enable)


(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "/home/walkman/Documents/org")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

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

