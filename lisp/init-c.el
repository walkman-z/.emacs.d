

(use-package smart-compile
  :config
  (setq smart-compile-alist
	'((emacs-lisp-mode emacs-lisp-byte-compile)
	  (html-mode browse-url-of-buffer)
	  (nxhtml-mode browse-url-of-buffer)
	  (html-helper-mode browse-url-of-buffer)
	  (octave-mode run-octave)
	  ("\\.c\\'" . "gcc -O2 %f -lm -o %n && ./%n")
	  ("\\.[Cc]+[Pp]*\\'" . "g++ -O2 %f -lm -o %n && ./%n")
	  ("\\.cron\\(tab\\)?\\'" . "crontab %f")
	  ("\\.cu\\'" . "nvcc %f -o %n")
	  ("\\.cuf\\'" . "nvfortran -Mcuda -O2 %f -o %n")
	  ("\\.[Ff]\\'" . "gfortran %f -o %n")
	  ("\\.[Ff]90\\'" . "gfortran %f -o %n")
	  ("\\.go\\'" . "go run %f")
	  ("\\.hs\\'" . "ghc %f -o %n")
	  ("\\.java\\'" . "javac %f")
	  ("\\.jl\\'" . "julia %f")
	  ("\\.lua\\'" . "lua %f")
	  ("\\.m\\'" . "gcc -O2 %f -lobjc -lpthread -o %n")
	  ("\\.mp\\'" . "mptopdf %f")
	  ("\\.php\\'" . "php %f")
	  ("\\.pl\\'" . "perl %f")
	  ("\\.p[l]?6\\'" . "perl6 %f")
	  ("\\.py\\'" . "python3 %f")
	  ("\\.raku\\'" . "perl6 %f")
	  ("\\.rb\\'" . "ruby %f")
	  ("\\.rs\\'" . "rustc %f -o %n")
	  ("\\.tex\\'" tex-file)
	  ("\\.texi\\'" . "makeinfo %f"))
	)
  )

(use-package symbol-overlay)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "<f3>") 'symbol-overlay-jump-prev)
(global-set-key (kbd "<f4>") 'symbol-overlay-jump-next)
(global-set-key (kbd "<f8>") 'symbol-overlay-mode)
(global-set-key (kbd "<f7>") 'symbol-overlay-remove-all)



;; (define-key c++-mode-map (kbd "<f5>") 'smart-compile)


(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (defun C-save-hooks ()
  (add-hook 'before-save-hook #'eglot-format-buffer))
  :hook
  ((c-mode c++-mode) . eglot-ensure)
  ((c-mode c++-mode) . C-save-hooks)
  )

;; (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
;; (setq ff-quiet-mode t)
;; ;; 找不到同名文件时不创建
;; (setq ff-always-try-to-create nil)
;; (setq cc-search-directories '("."
;;                               "/usr/include"
;;                               "/usr/local/include/*"
;;                               "../*/include"
;;                               "../*/src"
;;                               "$PROJECT/include"
;;                               "$PROJECT/src"
;;                               "/usr/local/opt/llvm/include/c++/v1"
;;                               ))

(provide 'init-c)
