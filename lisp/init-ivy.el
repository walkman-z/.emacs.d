

;;; Code:

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


(use-package smex)

(provide 'init-ivy)

;;; init-ivy.el ends here

