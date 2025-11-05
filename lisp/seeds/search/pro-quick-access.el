;;; pro-quick-access.el --- Vertico/Orderless/Consult/Marginalia -*- lexical-binding: t -*-

(use-package vertico
  :ensure t
  :config (vertico-mode 1))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :config (marginalia-mode 1))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-s"   . consult-line)
         ("M-y"   . consult-yank-pop)
         ("M-g g" . consult-goto-line))
  :config (setq consult-preview-key "M-."))

(provide 'pro-quick-access)
;;; pro-quick-access.el ends here
