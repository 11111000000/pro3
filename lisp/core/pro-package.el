;;; pro-package.el --- Package system and use-package -*- lexical-binding: t -*-

(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.gnu.org/nongnu/")))
(unless (bound-and-true-p package--initialized)
  (package-initialize))
(unless package-archive-contents
  (ignore-errors (package-refresh-contents)))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(provide 'pro-package)
;;; pro-package.el ends here
