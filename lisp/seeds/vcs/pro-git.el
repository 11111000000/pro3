;;; pro-git.el --- Minimal Git integration -*- lexical-binding: t -*-

(when (executable-find "git")
  (use-package magit
    :ensure t
    :commands (magit-status))
  (use-package diff-hl
    :ensure t
    :hook ((prog-mode . diff-hl-mode)
           (magit-post-refresh . diff-hl-magit-post-refresh))))

(provide 'pro-git)
;;; pro-git.el ends here
