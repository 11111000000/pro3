;;; pro-shell.el --- vterm/shell helpers (optional) -*- lexical-binding: t -*-

(when (executable-find "bash")
  (use-package vterm
    :ensure t
    :commands (vterm))
  (defun pro/open-vterm ()
    "Open vterm quickly."
    (interactive)
    (vterm))
  (global-set-key (kbd "C-c t") #'pro/open-vterm))

(provide 'pro-shell)
;;; pro-shell.el ends here
