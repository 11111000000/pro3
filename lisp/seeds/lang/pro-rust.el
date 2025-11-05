;;; pro-rust.el --- Minimal Rust support -*- lexical-binding: t -*-

(when (executable-find "rustc")
  (use-package rust-mode
    :ensure t
    :mode ("\\.rs\\'" . rust-mode)
    :hook (rust-mode . (lambda () (setq rust-format-on-save t))))
  (use-package cargo
    :ensure t
    :hook (rust-mode . cargo-minor-mode)))

(provide 'pro-rust)
;;; pro-rust.el ends here
