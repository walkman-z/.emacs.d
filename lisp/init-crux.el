
;;; Code:

(use-package crux
  :bind (("C-c RET" . crux-smart-open-line-above)
	 ;; ("C-k" . crux-smart-kill-line)
	 ("C-a" . crux-move-beginning-of-line)
	 
	 ;("C-c ^" . crux-top-join-line)
	 ("C-c i" . crux-find-user-init-file)
	 ("C-c ," . crux-find-user-custom-file)
	 ("C-c S" . crux-find-shell-init-file)
	 ("C-S-c" . crux-duplicate-current-line-or-region) ;复制当前行或区域
	 ("C-c M-d" . crux-duplicate-and-comment-current-line-or-region) ;复制并注释当前行或区域
	 ;; ("C-c d" . crux-cleanup-buffer-or-region)         ;正确的缩进当前块
	 ("C-c f" . crux-recentf-find-file)                ;打开最近使用文件
	 ("C-c e" . crux-eval-and-replace)                 ;求elisp值并用结果取代 (+ 1 1)->2
	 ("C-c r" . crux-rename-file-and-buffer)           ;重命名文件
	 ("C-c D" . crux-delete-file-and-buffer)           ;删除文件和缓冲区
	 ("C-c k" . crux-kill-other-buffers)		   ;删除其他缓冲区
	 ("C-c t" . crux-visit-term-buffer)		   ;打开终端模拟缓冲区
	 ("C-c C-u" . crux-upcase-region)		   ;让一段区域变成大写
	 ("C-c C-d" . crux-downcase-region)		   ;小写
	 ("C-c M-c" . crux-capitalize-region)		   ;单词首字母大写
	 ))

(use-package hungry-delete
  :init
  
  :bind (("C-c DEL" . hungry-delete-backward)
	 ("C-c d" . hungry-delete-forward)
	 ))

;; (use-package drag-stuff
;;   :bind (("<M-up>" . drag-stuff-up)
;; 	 ("<M-down>" . drag-stuff-down)))




(provide 'init-crux)
;;; init-crux ends here
