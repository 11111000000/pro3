;;; pro-profile-load-test.el --- ERT tests for profile loading -*- lexical-binding: t -*-

(require 'ert)

;; Stub use-package to avoid network during tests
(unless (fboundp 'use-package)
  (defmacro use-package (&rest _args) nil))

(defconst pro/test-root
  (or (locate-dominating-file (or load-file-name default-directory) ".emacs.d")
      (expand-file-name ".." (file-name-directory (or load-file-name default-directory))))
  "Project root for pro3 during tests.")

(add-to-list 'load-path (expand-file-name "lisp" pro/test-root))
(add-to-list 'load-path (expand-file-name "lisp/core" pro/test-root))

(require 'pro-profiles)
(require 'pro-seeds-loader)

(ert-deftest pro/profile-base-loads ()
  "Ensure base profile loads without errors."
  (should (progn (pro/load-profile "base") t)))

(ert-deftest pro/profile-dev-loads ()
  "Ensure dev profile loads without errors."
  (should (progn (pro/load-profile "dev") t)))

(provide 'pro-profile-load-test)
;;; pro-profile-load-test.el ends here
