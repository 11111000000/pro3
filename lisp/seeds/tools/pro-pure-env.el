;;; pro-pure-env.el --- Gentle environment check (Guix/Nix) -*- lexical-binding: t -*-

(require 'pro-seeds-loader)

(defgroup pro/pure-env nil
  "Gentle hints for running under Guix/Nix shells."
  :group 'convenience)

(defcustom pro/pure-env-gentle-reminder t
  "Show a gentle reminder when not in a Guix/Nix shell."
  :type 'boolean)

(defun pro/pure-env? ()
  "Return non-nil if running inside Guix or Nix shell."
  (or (getenv "GUIX_ENVIRONMENT")
      (getenv "IN_NIX_SHELL")))

(defun pro/show-pure-env-hint ()
  "Show a one-line hint for reproducible shell usage."
  (when (and pro/pure-env-gentle-reminder (not (pro/pure-env?)))
    (if (fboundp 'pro//msg)
        (pro//msg "Tip: use Guix or Nix shell for reproducible setup (see doc/INSTALL.md).")
      (message "Tip: use Guix or Nix shell for reproducible setup (see doc/INSTALL.md)."))))

(add-hook 'emacs-startup-hook #'pro/show-pure-env-hint)

(provide 'pro-pure-env)
;;; pro-pure-env.el ends here
