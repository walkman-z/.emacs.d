
;; (use-package iedit
;;   :bind ("C-i" . iedit-mode))




;;鼠标滚轮设置字体大小
(global-set-key [C-wheel-up] 'text-scale-increase)
(global-set-key [C-wheel-down] 'text-scale-decrease)

;; 鼠标右键粘贴文本
(global-set-key (kbd "<mouse-3>") 'mouse-yank-primary)
;; 取消鼠标中键
(global-set-key (kbd "<mouse-2>") 'nil)
;; 选中即复制
(setq mouse-drag-copy-region t)




(provide 'init-iedit)

