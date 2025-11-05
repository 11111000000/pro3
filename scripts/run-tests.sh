#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

exec emacs -Q --batch \
  --eval "(setq user-emacs-directory (expand-file-name \".emacs.d/\" default-directory))" \
  -l tests/pro-load-all-seeds-test.el \
  -l tests/pro-profile-load-test.el \
  -f ert-run-tests-batch-and-exit
