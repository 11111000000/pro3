#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "Launching Emacs with init directory: $ROOT/.emacs.d"
exec emacs --init-directory "$ROOT/.emacs.d"
