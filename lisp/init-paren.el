


;; 括号设置

;;;已自带
;;;(use-package show-paren-mode)

(use-package rainbow-delimiters
  :init
  (setq rainbow-delimiters-max-face-count 6)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode) ;彩色括号
  (add-hook 'prog-mode-hook #'show-paren-mode)	  ;高亮显示括号
  (add-hook 'prog-mode-hook #'electric-pair-mode) ;括号自动补全
  )
(setq electric-pair-pairs '((?\" . ?\")
			    (?\( . ?\))
			    (?\{ . ?\})))

(provide 'init-paren)
;;; init-paren.el ends here

