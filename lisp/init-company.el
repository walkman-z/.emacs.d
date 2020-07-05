
;; Settings for company
(use-package company
  ;; The next line cause lsp-mode bugs when complete functions
  ;; (push '(company-semantic :with company-yasnippet) company-backends)
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (prog-mode . company-mode)   ;只在编程语言模式下启用
  :config (setq company-dabbrev-code-everywhere t ;任何地方都自动补全
		company-dabbrev-code-modes t
		company-dabbrev-code-other-buffers 'all
		company-dabbrev-downcase nil
		company-dabbrev-ignore-case t
		company-dabbrev-other-buffers 'all
		company-require-match nil
		company-minimum-prefix-length 2
		company-show-numbers t
		company-tooltip-limit 20
		company-idle-delay 0
		company-echo-delay 0
		company-tooltip-offset-display 'scrollbar
		company-begin-commands '(self-insert-command)))


(use-package yasnippet
  :init
  (yas-global-mode 1)
  (use-package yasnippet-snippets)
  )

(provide 'init-company)

;;; init-company ends here
