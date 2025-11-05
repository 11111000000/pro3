;;; init.el --- pro3 init -*- lexical-binding: t -*-

;; Load paths
(add-to-list 'load-path (expand-file-name "../lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "../lisp/core" user-emacs-directory))

;; Core
(require 'pro-package)
(require 'pro-ui)
(require 'pro-fonts)
(require 'pro-env-info)
(require 'pro-wm)
(require 'pro-profiles)
(require 'pro-seeds-loader)

;; Optional: load soft-disabled seeds list (if exists)
(let ((f (expand-file-name "../etc/disabled-seeds.el" user-emacs-directory)))
  (when (file-exists-p f) (load f nil t)))

;; Ensure data dirs exist
(dolist (d '("../etc" "../var" "../var/undo" "../org" "../org/notes" "../org/journal"
             "../org/archive" "../org/archive/notes" "../org/archive/journal"))
  (let ((abs (expand-file-name d user-emacs-directory)))
    (unless (file-directory-p abs) (make-directory abs t))))

;; Load profile (from PRO_PROFILE or fallback to "base")
(pro/load-profile (or (getenv "PRO_PROFILE") "base"))

;;; init.el ends here
