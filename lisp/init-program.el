
;;; Code:


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
;; (setq electric-pair-pairs '((?\" . ?\")
;; 			    (?\( . ?\))
;; 			    (?\{ . ?\})))


;; (use-package clang-format)
;; (global-set-key (kbd "C-c C-f") 'clang-format-region)


(provide 'init-program)
;;; init-program.el ends here
