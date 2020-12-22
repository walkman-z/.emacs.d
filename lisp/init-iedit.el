
;; (use-package iedit
;;   :bind ("C-i" . iedit-mode))


;; 自动保存作区
(desktop-save-mode 1)
(setq desktop-save t)

;;鼠标滚轮设置字体大小
(global-set-key [C-wheel-up] 'text-scale-increase)
(global-set-key [C-wheel-down] 'text-scale-decrease)

;; 鼠标右键粘贴文本
(global-set-key (kbd "<mouse-3>") 'mouse-yank-primary)
;; 取消鼠标中键
(global-set-key (kbd "<mouse-2>") 'nil)

;; 选中即复制
(setq mouse-drag-copy-region t)

;; 自动更新文件


(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

;; 显示搜索进度
(setq isearch-lazy-count t
      lazy-count-prefix-format "%s/%s ")

;; 搜索高亮
(use-package isearch
  :ensure nil
  :bind (:map isearch-mode-map
         ([remap isearch-delete-char] . isearch-del-char))
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "%s/%s ")  
  (lazy-highlight-cleanup nil))

;;选中后输入替换
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))
;;高亮匹配括号
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t))


;;新的注释函数
(use-package newcomment
  :ensure nil
  :bind ([remap comment-dwim] . #'comment-or-uncomment)
  :config
  (defun comment-or-uncomment ()
    (interactive)
    (if (region-active-p)
        (comment-or-uncomment-region (region-beginning) (region-end))
      (if (save-excursion
            (beginning-of-line)
            (looking-at "\\s-*$"))
          (call-interactively 'comment-dwim)
        (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))
  :custom
  (comment-auto-fill-only-comments t))


;; 在modeline里显示行号、列号以及当前文件的总字符数。

(use-package simple
  :ensure nil
  :hook (after-init . (lambda ()
                         (line-number-mode)
                         (column-number-mode)
                         (size-indication-mode))))


(use-package undo-tree
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-diff 1)
  (setq undo-tree-visualizer-timestamps 1)
  )



(provide 'init-iedit)

