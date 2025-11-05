;;; pro-visual.el --- Minimal visual polish (optional) -*- lexical-binding: t -*-

(defun pro/hide-mode-line-in-empty-buffers ()
  "Hide mode-line if buffer is empty."
  (when (zerop (buffer-size))
    (setq mode-line-format nil)))
(add-hook 'window-configuration-change-hook #'pro/hide-mode-line-in-empty-buffers)

(defgroup pro/visual nil
  "Visual tweaks for pro."
  :group 'faces)

(defcustom pro/use-theme nil
  "When non-nil, load a theme at startup."
  :type 'boolean)

(defcustom pro/theme 'modus-operandi
  "Default theme symbol to load when `pro/use-theme' is non-nil."
  :type 'symbol)

(let ((theme (or (and (getenv "PRO_THEME") (intern (getenv "PRO_THEME")))
                 pro/theme)))
  (when (or pro/use-theme (getenv "PRO_THEME"))
    (ignore-errors (load-theme theme t))))

(provide 'pro-visual)
;;; pro-visual.el ends here
