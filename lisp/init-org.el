;;; init-org.el --- org
;;; Commentary:
;;; Code:



(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)



(server-start)
(require 'org-protocol)


(add-hook 'org-mode-hook
    (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook
	  'org-indent-mode)
(add-hook 'org-mode-hook
	  (lambda () (display-line-numbers-mode -1)))


(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (C . t)
        ;; (java . t)
        ;; (js . t)
        ;; (ruby . t)
        ;; (ditaa . t)
        ;; (python . t)
        (shell . t)
        (latex . t)
        ;; (plantuml . t)
        ;; (R . t)
	)
      )

(require 'org-tempo)

(use-package valign)
(add-hook 'org-mode-hook #'valign-mode)
(setq valign-fancy-bar 1)







;; 禁止点击打开链接 (C-c C-o 可以)
(defun org-open-at-mouse nil)




;; org-capture
(setq org-capture-templates nil)


(add-to-list 'org-capture-templates '("p" "Protocol"))
(add-to-list 'org-capture-templates
             '("pb" "Protocol Bookmarks" entry
               (file+headline "~/.notes/bookmark.org" "wait")
               "* %U - %:annotation" :immediate-finish t :kill-buffer t))


(setq org-capture-templates '(
			      ;; 随笔
			      ("j" "Journal" plain
			       (file+datetree "~/.notes/journal.org")
			       "%?")
			      ;; 待办
			      ("i" "inbox:")
			      ;; todo 项
			      ("it" "Inbox" entry
			       (file+headline "~/.notes/inbox.org" "INBOX")
			       "* TODO %^{heading}\n %?")

			      ("p" "Protocol")

			      ("pb" "Protocol Bookmarks" entry
			       (file+headline "~/.notes/bookmark.org" "wait")
			       "* %U - %:annotation" :immediate-finish t :kill-buffer t)

			      ("L" "Protocol Link" entry
			       (file+headline "~/.notes/bookmark.org" "wait")
			       "* [[%:link][%:description]]")
			      ))


;; 开启Org-mode文本内语法高亮
(require 'org)
(require 'ox-latex)
(setq org-src-fontify-natively t)

;; 导出 latex
(add-to-list 'org-latex-classes
	     '("ctexart"
	       "\\documentclass[UTF8,a4paper]{ctexart}"
	       ;;"\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexart}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       )
	     )
(add-to-list 'org-latex-classes
	       '("ctexrep"
		"\\documentclass[UTF8,a4paper]{ctexrep}"
		("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       )
	       )

(add-to-list 'org-latex-classes
	       '("ctexbook"
		"\\documentclass[UTF8,a4paper]{ctexbook}"
		;;("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       )
	       )

(add-to-list 'org-latex-classes
	       '("beamer"
		"\\documentclass{beamer}
               \\usepackage[fontset=none,UTF8,a4paper,zihao=-4]{ctex}"
	       org-beamer-sectioning)
	       )


(setq org-latex-default-class "ctexart")


(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        ;;"biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
(provide 'init-org)

;;; init-org.el ends here

