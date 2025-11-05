# pro3: minimal, portable Emacs profile

- Single entry: `.emacs.d` inside this folder.
- Core in `lisp/core/`, optional features as seeds under `lisp/seeds/<category>/`.
- Profiles: set `PRO_PROFILE=base|dev|writer|wm` before launch.
- Soft-disable seeds without deleting files: see `etc/disabled-seeds.el`.

Quick start:
- Guix: `guix shell -m env/guix/manifest.scm -- emacs --init-directory $PWD/.emacs.d`
- Nix (manifest.nix): `nix develop env/nix/manifest.nix -c emacs --init-directory $PWD/.emacs.d`
- Nix (flakes): `nix --extra-experimental-features 'nix-command flakes' develop .# -c emacs --init-directory $PWD/.emacs.d`
- Shell: `scripts/pro-install.sh`

Key commands:
- C-c s: list available seeds
- C-c e: show environment info
- C-c R: generate seeds catalog (README-seeds.org)
- F11: zen mode (toggle)

Housekeeping:
- M-x pro/soft-disable-seed, pro/soft-enable-seed
- M-x pro/review-unused-seeds (suggest soft-disabling unused seeds)
- M-x pro/doctor for quick diagnostics
- Set PRO_VERBOSE=1 to see informational messages
