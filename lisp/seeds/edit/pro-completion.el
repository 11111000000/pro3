;;; pro-completion.el --- Corfu + Cape minimal completion -*- lexical-binding: t -*-

(use-package corfu
  :ensure t
  :config (global-corfu-mode 1)
  :custom
  (corfu-auto t)
  (corfu-cycle t))

(use-package cape
  :ensure t)

(defun pro//disable-ispell-capf ()
  (setq-local completion-at-point-functions
              (remove #'ispell-completion-at-point completion-at-point-functions)))

(add-hook 'text-mode-hook #'pro//disable-ispell-capf)
(add-hook 'prog-mode-hook #'pro//disable-ispell-capf)

(provide 'pro-completion)
;;; pro-completion.el ends here
