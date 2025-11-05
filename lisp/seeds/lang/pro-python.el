;;; pro-python.el --- Minimal Python support -*- lexical-binding: t -*-

(when (executable-find "python3")
  (use-package python
    :ensure nil
    :custom (python-shell-interpreter "python3"))
  (use-package blacken
    :ensure t
    :hook (python-mode . blacken-mode))
  (use-package pipenv
    :ensure t
    :hook (python-mode . pipenv-mode)))

(provide 'pro-python)
;;; pro-python.el ends here
