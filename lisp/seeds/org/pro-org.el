;;; pro-org.el --- Minimal Org configuration -*- lexical-binding: t -*-

(use-package org
  :ensure t
  :custom
  (org-startup-with-inline-images t)
  (org-ellipsis "…")
  (org-log-done 'time))

;; Quick access to main org file
(global-set-key
 (kbd "C-c o")
 (lambda () (interactive)
   (find-file (expand-file-name "../org/main.org" user-emacs-directory))))

(provide 'pro-org)
;;; pro-org.el ends here
