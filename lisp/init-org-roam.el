

(add-hook 'after-init-hook 'org-roam-mode)
;; 第一次运行时，手动构建缓存
;; org-roam-db-build-cache
;; org-roam 与网页端通信
;; (require 'org-roam-protocol)


;; sql可执行文件
;; (if *is-windows*
    ;; (add-to-list 'exec-path "D:\sql\sqlite-tools-win32-x86-3340000"))
;; (executable-find "sqlite3")

;; org-roam 路径
;; (make-directory "~/org-roam")

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "D:/emacs/home/org-roam")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 8080
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

(provide 'init-org-roam)
