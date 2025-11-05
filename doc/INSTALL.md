Install and run

- Clone this repo next to your other projects.
- Run Emacs with this profile:

Guix:
  guix shell -m env/guix/manifest.scm -- emacs --init-directory $PWD/.emacs.d

Nix (manifest.nix):
  nix develop env/nix/manifest.nix -c emacs --init-directory $PWD/.emacs.d

Nix (flakes):
  nix --extra-experimental-features 'nix-command flakes' develop .# -c emacs --init-directory $PWD/.emacs.d

Shell:
  scripts/pro-install.sh

Profiles
- Set PRO_PROFILE=base|dev|writer|wm before launch to select a seed set.

Optional EXWM session
- Use scripts/pro-install-desktop.sh to create a desktop entry.
- Or run: PRO_WITH_EXWM=1 emacs --init-directory $PWD/.emacs.d

Soft-disable instead of delete
- Use M-x pro/soft-disable-seed or M-x pro/soft-enable-seed.
- Review unused seeds with M-x pro/review-unused-seeds.

Troubleshooting
- M-x pro/doctor shows a brief status.
- Ensure fonts are available or adjust in lisp/core/pro-fonts.el.
