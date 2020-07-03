(use-package auctex
  :init (setq TeX-clean-confirm nil
  	      TeX-engine 'xetex
  	      TeX-fold-auto t
  	      TeX-source-correlate-mode t
  	      TeX-source-correlate-start-server t
  	      TeX-view-evince-keep-focus t
	      TeX-view-program-selection '(((output-dvi has-no-display-manager) "dvi2tty")
					   ((output-dvi style-pstricks) "dvips and gv")
					   (output-dvi "xdvi")
					   (output-pdf "Zathura")
					   (output-html "xdg-open")
					   )
	      )
)

(use-package cdlatex
  :init (setq cdlatex-command-alist '(("i" "" "$?$" cdlatex-position-cursor nil t nil)
				      ("o" "" "\\[\n?\n\\]" cdlatex-position-cursor nil t nil)
				      )
	      cdlatex-math-modify-alist (quote ((104 "\\mathbb" "" t nil nil)))
	      cdlatex-math-symbol-alist (quote ((99 ("\\cdot" "\\cdots"))))
	      cdlatex-paired-parens "[{("
	      )

  )
(use-package magic-latex-buffer
  :init (setq magic-latex-enable-block-highlight nil
	      magic-latex-enable-suscript        t
	      magic-latex-enable-pretty-symbols  t
	      magic-latex-enable-block-align     nil
	      magic-latex-enable-inline-image    nil
	      magic-latex-enable-minibuffer-echo t
	      )
  )

(mapc (lambda (mode)
  (add-hook 'LaTeX-mode-hook mode))
  (list 'turn-on-cdlatex
        'reftex-mode
        'outline-minor-mode
        'auto-fill-mode
        'prettify-symbols-mode
	'magic-latex-buffer
        ; 'flyspell-mode
        'TeX-fold-mode t))

(provide 'init-tex)

