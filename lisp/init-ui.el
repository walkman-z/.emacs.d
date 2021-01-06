
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
(use-package flatui-theme
  :init (load-theme 'flatui t))



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


(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))



(provide 'init-ui)

