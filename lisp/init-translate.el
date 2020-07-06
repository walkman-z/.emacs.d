;;; init-translate.el --- translate configuation
;;; Commentary:
;;; Code:

(require 'company-english-helper)
;toggle-company-english-helper
(require 'insert-translated-name)
(global-set-key (kbd "C-?") 'insert-translated-name-insert)

(provide 'init-translate)

;;; init-translate.el ends here
