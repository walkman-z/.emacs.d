;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues



(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;;设置软件源				;
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;; 			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;; 			 ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ;; ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")))


;;不检查校验签名
;; (setq package-check-signature nil)


;;初始化包管理器
(unless (bound-and-true-p package--initialized)
  (package-initialize))
;;刷新软件源索引				;
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;usepackage

(setq use-package-always-ensure t
       use-package-always-defer t
       use-package-always-demand nil
       use-package-expand-minimally t
       use-package-verbose t)

(require 'use-package)


;; (require 'init-elpa)			;软件源及包管理器初始化

;; (require 'init-const)
;; (require 'init-kbd)
;; (require 'init-unicode)
;; (require 'init-startup)					;



;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/template/")
;; (setq auto-insert-query nil)
;; (setq auto-insert-alist
;;       (append '(c-mode . template.c)
;; 	      auto-insert-alist))

;; (use-package file-template)

;; (use-package indent-guide
;;   :config
;;   (setq indent-guide-reverse t)
;;   (setq indent-guide-char ":")
;;   (indent-guide-global-mode))

(custom-set-variables
 '(org-babel-load-languages (quote ((emacs-lisp . t) )))
 '(org-confirm-babel-evaluate nil))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init)
;; ;;; init.el ends here


