Contributing guide

- Principles:
  - Minimal core, everything else is an optional seed.
  - Quiet by default; messages only when useful.
  - Soft-disable, not delete.

- Seeds:
  - Place under lisp/seeds/<category>/pro-*.el
  - Start with a brief header docstring and Commentary.
  - Prefer (use-package ... :ensure t). Keep :config safe if network is absent.
  - Feature-gate on OS/tools (executable-find/require).

- Profiles:
  - Map categories in lisp/core/pro-profiles.el
  - Avoid side effects at load time if not needed.

- Style:
  - Prefix functions/vars with pro/.
  - Keep files ASCII, comments in EN.

- Tests:
  - Add smoke tests under tests/. Do not rely on network for tests.
