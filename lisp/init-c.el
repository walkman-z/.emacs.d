
(defun my-g++-compile-and-run ()
  (interactive)
  (compile (format "g++ %s && ./a.out" (buffer-file-name))))

(define-key c++-mode-map (kbd "<f5>") #'my-g++-compile-and-run)

(provide 'init-c)
