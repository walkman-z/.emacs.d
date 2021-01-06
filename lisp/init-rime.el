;;; init-rime.el --- rime configuation
;;; Commentary:
;;; Code:



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
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>" ))


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
	rime-predicate-prog-in-code-p
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
;; emacs 中指定临时切换inline ascii模式
;; (setq rime-inline-ascii-trigger 'shift-l)
;; (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)


;; 临时英文中阻止标点直接上屏
(setq rime-inline-ascii-holder ?x)

;; 临时强制使用强制中文模式
;; (define-key rime-mode-map (kbd"C-`") 'rime-force-enable)


(provide 'init-rime)
;;; init-rime.el ends here
;; 
