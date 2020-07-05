;; restart
(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))


(use-package crux
  :bind (("C-c RET" . crux-smart-open-line-above)
	 ("C-k" . crux-smart-kill-line)
	 ("C-a" . crux-move-beginning-of-line)
	 
	 ;("C-c ^" . crux-top-join-line)
	 ("C-c i" . crux-find-user-init-file)
	 ("C-c ," . crux-find-user-custom-file)
	 ("C-c S" . crux-find-shell-init-file)
	 ("C-S-c" . crux-duplicate-current-line-or-region) ;复制当前行或区域
	 ("C-c M-d" . crux-duplicate-and-comment-current-line-or-region) ;复制并注释当前行或区域
	 ;; ("C-c d" . crux-cleanup-buffer-or-region)         ;正确的缩进当前块
	 ;; ("C-c f" . crux-recentf-find-file)                ;打开最近使用文件
	 ("C-c e" . crux-eval-and-replace)                 ;求elisp值并用结果取代 (+ 1 1)->2
	 ("C-c r" . crux-rename-file-and-buffer)           ;重命名文件
	 ("C-c d" . crux-delete-file-and-buffer)           ;删除文件和缓冲区
	 ("C-c k" . crux-kill-other-buffers)		   ;删除其他缓冲区
	 ("C-c t" . crux-visit-term-buffer)		   ;打开终端模拟缓冲区
	 ("C-c C-u" . crux-upcase-region)		   ;让一段区域变成大写
	 ("C-c C-d" . crux-downcase-region)		   ;小写
	 ("C-c M-c" . crux-capitalize-region)		   ;单词首字母大写
	 ))


(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward)
	 ("C-c d" . hungry-delete-forward)))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))


;; Settings for ivy & counsel & swiper
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  ;;;;把命令框放中间
  ;; (use-package ivy-posframe
  ;;   :when (display-grayscale-p)
  ;;   :init
  ;;   (setq ivy-posframe-display-functions-alist
  ;;         '((swiper            . ivy-posframe-display-at-frame-center)
  ;;           (complete-symbol   . ivy-posframe-display-at-point)
  ;;           (counsel-M-x       . ivy-posframe-display-at-frame-center)
  ;;           (counsel-find-file . ivy-posframe-display-at-frame-center)
  ;;           (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
  ;;           (t                 . ivy-posframe-display-at-frame-center)))
  ;;   (ivy-posframe-mode 1))
  )

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-h b" . counsel-descbinds)
	 ("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))


(use-package which-key
  :defer nil
  :config (which-key-mode)
  )



(use-package ace-window
  :bind (("M-o" . 'ace-window))
  )




(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)



(provide 'init-packages)
