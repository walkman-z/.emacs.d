
;;; Code:


(defun exist-create-file (file)
  (if (not (file-exists-p file))
      (dired-create-empty-file file)))
 (exist-create-file "~/testfile")





(provide 'init-files)
