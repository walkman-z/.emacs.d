

;; restart
(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))


(use-package crux
  :bind (("C-k" . crux-smart-kill-line)
	 ("C-a" . crux-move-beginning-of-line)
	 ("C-c ^" . crux-top-join-line)
	 ("C-x i" . crux-find-user-init-file)
	 ("C-S-d" . crux-duplicate-current-line-or-region) ;复制当前行或区域
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





;; (use-package google-translate
;;   :init (setq google-translate--tkk-url "https://translate.google.cn"
;;               google-translate-default-source-language "en"
;;               google-translate-default-target-language "zh-CN")
;;   :bind (("C-c t" . google-translate-at-point)
;;          ("C-c T" . google-translate-query-translate)))



(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)



(provide 'init-packages)


