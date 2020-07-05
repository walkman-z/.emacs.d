
;;设置软件源				;
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;;不检查校验签名
(setq package-check-signature nil)


;;初始化包管理器
(unless (bound-and-true-p package--initialized)
  (package-initialize))
;;刷新软件源索引
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


(provide 'init-elpa)
