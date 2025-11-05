Migration from pro2 to pro3

- Namespaces and prefixes:
  - Files use pro-*, functions/variables use pro/.
  - ASCII filenames only.

- Entry and layout:
  - Single entry point: .emacs.d within repo.
  - Core in lisp/core, optional modules as seeds in lisp/seeds/<category>.

- Soft-disable instead of delete:
  - Use M-x pro/soft-disable-seed and M-x pro/soft-enable-seed.
  - Unused seeds review: M-x pro/review-unused-seeds.

- Profiles:
  - Set PRO_PROFILE=base|dev|writer|wm before launch.
  - Extend profiles by adding categories/seeds.

- Key mappings:
  - C-c s: list seeds; C-c e: env info; F11: zen mode.
  - C-c g/N: restart under Guix/Nix shells (if tools seed loaded).

- Env reproducibility:
  - Guix: env/guix/manifest.scm + channels.scm.
  - Nix: env/nix/manifest.nix (or flake.nix if you prefer flakes).

- Localization:
  - Code and comments in EN; UI translation can be layered separately.

- What not to do:
  - Do not hard-delete seeds; prefer soft-disable and archiving.
