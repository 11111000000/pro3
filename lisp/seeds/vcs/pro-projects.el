;;; pro-projects.el --- Projects via Projectile -*- lexical-binding: t -*-

(use-package projectile
  :ensure t
  :config (projectile-mode +1)
  :bind-keymap ("C-c p" . projectile-command-map))

(provide 'pro-projects)
;;; pro-projects.el ends here
