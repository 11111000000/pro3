;;; pro-health.el --- Simple doctor/diagnostics -*- lexical-binding: t -*-

(require 'pro-seeds-loader)

(defun pro/doctor ()
  "Show brief diagnostics in a dedicated buffer."
  (interactive)
  (let* ((buf (get-buffer-create "*pro:doctor*"))
         (guix (and (getenv "GUIX_ENVIRONMENT") "yes"))
         (nix  (and (getenv "IN_NIX_SHELL") "yes")))
    (with-current-buffer buf
      (erase-buffer)
      (insert (format "Profile: %s\n" (or (getenv "PRO_PROFILE") "base")))
      (insert (format "Guix shell: %s\n" (or guix "no")))
      (insert (format "Nix shell: %s\n" (or nix "no")))
      (insert (format "Emacs: %s | OS: %s\n" emacs-version (format "%s" system-type)))
      (insert (format "Seeds root: %s\n" (expand-file-name pro/seeds-root)))
      (insert (format "Disabled seeds: %s\n" (mapconcat (lambda (s) (symbol-name s)) pro/disabled-seeds ", ")))
      (goto-char (point-min))
      (view-mode 1))
    (pop-to-buffer buf)))

;; Quick key for doctor
(global-set-key (kbd "C-c h") #'pro/doctor)

(provide 'pro-health)
;;; pro-health.el ends here
