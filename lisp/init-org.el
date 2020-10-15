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



(provide 'init-org)

;;; init-org.el ends here
