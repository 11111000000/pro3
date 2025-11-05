;;; pro-build-restart.el --- Restart under Guix/Nix shells -*- lexical-binding: t -*-

(require 'pro-seeds-loader)
(defun pro/guix-restart ()
  "Launch a new Emacs instance in Guix shell using this profile."
  (interactive)
  (let* ((root (file-name-directory (directory-file-name user-emacs-directory)))
         (cmd (format "guix shell -m %s/env/guix/manifest.scm -- emacs --init-directory %s/.emacs.d &"
                      root root)))
    (start-process-shell-command "pro-guix-restart" nil cmd)
    (pro//msg "Started new Emacs in Guix shell.")))

(defun pro/nix-restart ()
  "Launch a new Emacs instance in Nix develop shell using this profile."
  (interactive)
  (let* ((root  (file-name-directory (directory-file-name user-emacs-directory)))
         (flake (expand-file-name "../env/nix/flake.nix" user-emacs-directory))
         (cmd   (if (file-exists-p flake)
                    (format "nix --extra-experimental-features 'nix-command flakes' develop %s/env/nix# -c emacs --init-directory %s/.emacs.d &" root root)
                  (format "nix develop %s/env/nix/manifest.nix -c emacs --init-directory %s/.emacs.d &" root root))))
    (start-process-shell-command "pro-nix-restart" nil cmd)
    (pro//msg "Started new Emacs in Nix shell.")))

;; Quick keys
(global-set-key (kbd "C-c g") #'pro/guix-restart)
(global-set-key (kbd "C-c N") #'pro/nix-restart)

(provide 'pro-build-restart)
;;; pro-build-restart.el ends here
