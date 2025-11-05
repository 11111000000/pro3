;;; pro-lsp.el --- Minimal LSP glue -*- lexical-binding: t -*-

(when (require 'lsp-mode nil 'noerror)
  (setq lsp-enable-snippet t)
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'rust-mode-hook #'lsp)
  (add-hook 'haskell-mode-hook #'lsp)
  (if (fboundp 'pro//msg)
      (pro//msg "LSP seed enabled.")
    (message "LSP seed enabled.")))

(provide 'pro-lsp)
;;; pro-lsp.el ends here
