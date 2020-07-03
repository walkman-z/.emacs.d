;;外观配置
(setq inhibit-startup-screen t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
;;显示行号
(global-display-line-numbers-mode 1)
;;设置相对行号
;(setq display-line-numbers-type 'relative)



;;主题
(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

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
    (set-face-attribute 'default nil :font "Ubuntu Mono 10")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 10.5))))
  (when *is-mac*
    (set-face-attribute 'default nil :font "Ubuntu Mono 14")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 14.5))))
  (when *is-linux*
    (set-face-attribute 'default nil :font "SF Mono 13")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 13.5)))))






(provide 'init-ui)

