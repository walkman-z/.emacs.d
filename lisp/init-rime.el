;;; init-rime.el --- rime configuation
;;; Commentary:
;;; Code:



(use-package rime
  :custom
  (default-input-method "rime")
  (rime-librime-root "~/.emacs.d/librime/dist")
  )

(setq rime-translate-keybindings
  '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))

(provide 'init-rime)
;;; init-rime.el ends here
