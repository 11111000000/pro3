;;; pro-load-all-seeds-test.el --- ERT smoke tests for seeds -*- lexical-binding: t -*-

(require 'ert)

(unless (fboundp 'use-package)
  (defmacro use-package (&rest _args)
    "Stub use-package for smoke testing without network."
    nil))

(defconst pro/test-root
  (or (locate-dominating-file (or load-file-name default-directory) ".emacs.d")
      (expand-file-name ".." (file-name-directory (or load-file-name default-directory))))
  "Project root for pro3 during tests.")

(add-to-list 'load-path (expand-file-name "lisp" pro/test-root))
(add-to-list 'load-path (expand-file-name "lisp/core" pro/test-root))

(defconst pro/test-seeds-dir (expand-file-name "lisp/seeds" pro/test-root))

(ert-deftest pro/load-all-seeds-noerror ()
  "Seeds load without throwing errors."
  (should (file-directory-p pro/test-seeds-dir))
  (let ((files (directory-files-recursively pro/test-seeds-dir "\\.el\\'"))
        (count 0))
    (dolist (f files)
      (condition-case err
          (progn (load f nil 'nomessage) (setq count (1+ count)))
        (error (ert-fail (format "Seed failed: %s (%s)" f (error-message-string err)))))
      )
    (should (> count 0))))

(provide 'pro-load-all-seeds-test)
;;; pro-load-all-seeds-test.el ends here
