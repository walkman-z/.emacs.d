(message "hello")

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

(use-package crux
  :bind (("C-c RET" . crux-smart-open-line-above)
	 ;; ("C-k" . crux-smart-kill-line)
	 ("C-a" . crux-move-beginning-of-line)
	 
	 ;("C-c ^" . crux-top-join-line)
	 ("C-c i" . crux-find-user-init-file)
	 ("C-c ," . crux-find-user-custom-file)
	 ("C-c S" . crux-find-shell-init-file)
	 ("C-S-c" . crux-duplicate-current-line-or-region) ;复制当前行或区域
	 ("C-c M-d" . crux-duplicate-and-comment-current-line-or-region) ;复制并注释当前行或区域
	 ;; ("C-c d" . crux-cleanup-buffer-or-region)         ;正确的缩进当前块
	 ("C-c f" . crux-recentf-find-file)                ;打开最近使用文件
	 ("C-c e" . crux-eval-and-replace)                 ;求elisp值并用结果取代 (+ 1 1)->2
	 ("C-c r" . crux-rename-file-and-buffer)           ;重命名文件
	 ("C-c D" . crux-delete-file-and-buffer)           ;删除文件和缓冲区
	 ("C-c k" . crux-kill-other-buffers)		   ;删除其他缓冲区
	 ("C-c t" . crux-visit-term-buffer)		   ;打开终端模拟缓冲区
	 ("C-c C-u" . crux-upcase-region)		   ;让一段区域变成大写
	 ("C-c C-d" . crux-downcase-region)		   ;小写
	 ("C-c M-c" . crux-capitalize-region)		   ;单词首字母大写
	 ))

(use-package hungry-delete
  :init
  
  :bind (("C-c DEL" . hungry-delete-backward)
	 ("C-c d" . hungry-delete-forward)
	 ))

;; (use-package drag-stuff
;;   :bind (("<M-up>" . drag-stuff-up)
;; 	 ("<M-down>" . drag-stuff-down)))

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

(use-package magit)

(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package try)

;; (use-package iedit
;;   :bind ("C-i" . iedit-mode))


;; 自动保工作区
;; (desktop-save-mode 1)
;; (setq desktop-save t)

;;鼠标滚轮设置字体大小
(global-set-key [C-wheel-up] 'text-scale-increase)
(global-set-key [C-wheel-down] 'text-scale-decrease)

;; 鼠标右键粘贴文本
;; (global-set-key (kbd "<mouse-3>") 'mouse-yank-primary)
(global-set-key (kbd "<mouse-3>") 'nil)
;; 取消鼠标中键
(global-set-key (kbd "<mouse-2>") 'nil)
;; 取消 C+mouse1
(global-set-key [C-down-mouse-1] 'nil)
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
  (setq show-paren-when-point-inside-paren nil
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

;; 可视化undotree
(use-package undo-tree
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-diff 1)
  (setq undo-tree-visualizer-timestamps 1)
  )

;; 可视化 diff
(use-package diff-hl
  :init
  (global-diff-hl-mode))

;; kill-ring 
(use-package browse-kill-ring)

(global-set-key [(meta ?/)] 'hippie-expand)

(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))


;; 规律代码快速输入
;; (use-package auto-yasnippet)
(use-package tiny)

(use-package avy
  :init
  :bind ("C-:" . avy-goto-char)
  ;; ("" . avy-goto-char-2)
  ;("" . avy-goto-line)
  ;; ("" . avy-goto-word-1)
  )

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

;;; Code:

;; (add-to-list 'load-path "~/.emacs.d/elpa/nox/")
;; (require 'nox)
;; (add-to-list 'nox-server-programs '((c++-mode c-mode) "clangd"))
;; (dolist (hook (list
;;                'js-mode-hook
;;                'rust-mode-hook
;;                'python-mode-hook
;;                'ruby-mode-hook
;;                'java-mode-hook
;;                'sh-mode-hook
;;                'php-mode-hook
;;                'c-mode-common-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'haskell-mode-hook
;;                ))
;;   (add-hook hook '(lambda () (nox-ensure))))

;; (defun C-save-hooks ()
;;   (add-hook 'before-save-hook #'nox-format-buffer))
;; (add-hook 'c-mode-hook 'C-save-hooks)
;; (add-hook 'c++-mode-hook 'C-save-hooks)

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

(setq left-margin-width 2)
(setq right-margin-width 2)
(set-window-buffer nil (current-buffer))
(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis " ⌵" ;; folding symbol
      org-pretty-entities t ;; 上下标显示支持
      org-use-sub-superscripts '{}  ;; 当 _{} 或 ^{} 时支持上下标
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)
(setq line-spacing 0.1)
(setq header-line-format " ")

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
(use-package org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

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

;; (use-package valign)
;; (add-hook 'org-mode-hook #'valign-mode)
;; (setq valign-fancy-bar 1)







;; 禁止点击打开链接 (C-c C-o 可以)
(defun org-open-at-mouse nil)
(global-set-key (kbd "<mouse-2>") 'org-open-at-point)



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



(setq org-latex-create-formula-image-program 'imagemagick)

;; 
(use-package rime
  :custom
  (default-input-method "rime")
  ;; (rime-librime-root "~/.emacs.d/librime/build")
  )

;; (setq module-file-suffix ".so")
;; 用户RIME 配置文件所在地
(setq rime-user-data-dir "~/.config/fcitx/rime")

;; 设置显示方式
;; nil	        不展示
;; minibuffer	在minibuffer中展示， 推荐使用的方式
;; message	        直接使用 message 输出，兼容控制 minibuffer 内容的插件
;; popup	        使用 popup.el 展示跟随的候选
;; posframe	使用 posframe 展示跟随的候选，在不可用的时候会用 popup

(setq rime-show-candidate 'posframe)

;; 颜色方案

;; Face                    说明
;; rime-default-face	默认的前景色和背景色（仅posframe）
;; rime-code-face	        编码的颜色
;; rime-candidate-num-face	候选序号颜色
;; rime-comment-face	编码提示颜色

(setq rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :internal-border-width 10))
;; 发送给RIME 的快捷键
(setq rime-translate-keybindings
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>" "shift-l" ))


;; 设置横版显示 候选
(setq rime-posframe-style 'horizontal)
;; 设置 RIME 分隔符
(setq rime-cursor " | ") 
;; 设置 RIME 上屏显示编码 
(setq rime-show-preedit 'inline)



;; 特定的场景下需要自动使用英文，若断言有一个非真，则自动进入英文模式
(setq rime-disable-predicates
      '(
        ;; rime-predicate-after-alphabet-char-p
        ;; 在文字符串之后（必须为以字母开头的英文字符串）
        rime-predicate-after-ascii-char-p
        ;; 任意英文字符后
        ;; rime-predicate-prog-in-code-p
        ;; 在 prog-mode 和 conf-mode 中除了注释和引号内字符串之外的区域
        rime-predicate-in-code-string-p
        ;; 在代码的字符串中，不含注释的字符串。
        rime-predicate-evil-mode-p
        ;; 在 evil-mode 的非编辑状态下
        rime-predicate-ace-window-p
        ;; 激活 ace-window-mode
        rime-predicate-hydra-p
        ;; 如果激活了一个 hydra keymap
        ;; rime-predicate-current-input-punctuation-p
        ;; 当要输入的是符号时
        rime-predicate-punctuation-after-space-cc-p
        ;; 当要在中文字符且有空格之后输入符号时
        rime-predicate-punctuation-after-ascii-p
        ;; 当要在任意英文字符之后输入符号时
        rime-predicate-punctuation-line-begin-p
        ;; 在行首要输入符号时
        ;; rime-predicate-space-after-ascii-p
        ;; 在任意英文字符且有空格之后
        rime-predicate-space-after-cc-p
        ;; 在中文字符且有空格之后
        rime-predicate-current-uppercase-letter-p
        ;; 将要输入的为大写字母时
        rime-predicate-tex-math-or-command-p
        ;; 在 (La)TeX 数学环境中或者输入 (La)TeX 命令时
        ))
;; 临时英文模式
;; emacs 中指定临时切换inline ascii模式新
(setq rime-inline-ascii-trigger 'shift-l)
;; (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)


;; 临时英文中阻止标点直接上屏
(setq rime-inline-ascii-holder ?x)

;; 临时强制使用强制中文模式
(add-hook 'rime-mode-hook
          '(lambda ()
             (define-key rime-mode-map (kbd"C-`") 'rime-force-enable)
             (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)))

(setq default-frame-alist
      (append '((height . 50) (width . 100)) default-frame-alist))

;; (set-frame-position (selected-frame) 0 0)
;; (set-frame-width (selected-frame) 110)
;; (set-frame-height (selected-frame) 100)

;;外观配置
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
;;显示行号
(global-display-line-numbers-mode 1)

(setq display-line-numbers-width-start t)

;; 侧边栏
;; (use-package treemacs)
;; (treemacs)





;;主题
;; (use-package flatui-theme
  ;; :init (load-theme 'flatui t))

(use-package doom-themes
  :init (load-theme 'doom-nord-light t))


(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))


(use-package emacs
  :when (display-graphic-p)
  :config
  ;; (setq default-frame-alist '((width . 150) (height . 35)))
  ;(set-frame-parameter nil 'fullscreen 'maximized)
  (when *is-windows*
    (set-face-attribute 'default nil :font "Consolas 15")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 20))))
  (when *is-mac*
    (set-face-attribute 'default nil :font "SF Mono 15")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 20))))
  (when *is-linux*
    (set-face-attribute 'default nil :font "Consolas 15")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 20))))
  )


;; (use-package hl-line
;;   :ensure nil
;;   :hook (after-init . global-hl-line-mode))

(use-package ace-window
  :bind (("M-o" . 'ace-window)))
