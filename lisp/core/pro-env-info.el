;;; pro-env-info.el --- Environment info utilities -*- lexical-binding: t -*-

(defun pro/print-env-info ()
  "Show current environment info in minibuffer."
  (interactive)
  (let ((guix (and (getenv "GUIX_ENVIRONMENT") "yes"))
        (nix  (and (getenv "IN_NIX_SHELL") "yes")))
    (message
     (mapconcat #'identity
                (list
                 (format "Profile: %s" (or (getenv "PRO_PROFILE") "base"))
                 (format "Guix shell: %s" (or guix "no"))
                 (format "Nix shell: %s" (or nix "no"))
                 (format "Emacs: %s" emacs-version)
                 (format "OS: %s" (format "%s" system-type))
                 (format "init-dir: %s" (expand-file-name user-emacs-directory)))
                " | "))))

(provide 'pro-env-info)
;;; pro-env-info.el ends here
