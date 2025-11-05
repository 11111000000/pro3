;;; pro-editor.el --- Minimal editor enhancements -*- lexical-binding: t -*-

(delete-selection-mode 1)
(global-hl-line-mode 1)

(use-package avy
  :ensure t
  :bind (("M-g a" . avy-goto-char)))

(use-package expand-region
  :ensure t
  :bind (("M-SPC"   . er/expand-region)
         ("M-S-SPC" . er/contract-region)))

(provide 'pro-editor)
;;; pro-editor.el ends here
