

;;取消出错时响铃
(setq visible-bell t)
;;终端下允许使用鼠标


;; (xterm-mouse-mode 1)


;;关闭自动保存
(setq auto-save-default nil
      make-backup-files nil) 
;;yes/no取代
(defalias 'yes-or-no-p 'y-or-n-p)
;; 


;; save workspace when 
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; Adjust garbage collection thresholds during startup
;; 垃圾回收阈值设为最大，百分比设为0.5
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)
(run-with-idle-timer 5 t #'garbage-collect)
(setq-default frame-title-format '("%f"))

(provide 'init-startup)
