;;; pro-fonts.el --- Cross-platform font selection -*- lexical-binding: t -*-

(require 'seq)

(defgroup pro/fonts nil
  "Font settings for pro."
  :group 'convenience)

(defcustom pro/default-fonts
  '("JetBrains Mono" "DejaVu Sans Mono" "Noto Sans Mono" "Consolas")
  "Preferred monospace fonts in order."
  :type '(repeat string))

(defcustom pro/default-font-size 120
  "Default font height (1/10 pt)."
  :type 'integer)

(defun pro//font-available-p (name)
  (find-font (font-spec :name name)))

(defun pro/set-font (&optional size)
  "Set the first available font from `pro/default-fonts'."
  (let* ((height (or size pro/default-font-size))
         (name (seq-find #'pro//font-available-p pro/default-fonts)))
    (when name
      (set-face-attribute 'default nil :font name :height height))))

;; Apply at startup
(add-hook 'emacs-startup-hook (lambda () (pro/set-font)))

(provide 'pro-fonts)
;;; pro-fonts.el ends here
