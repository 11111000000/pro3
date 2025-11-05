#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DM_SESSIONS="$HOME/.local/share/xsessions"
mkdir -p "$DM_SESSIONS"

cat > "$DM_SESSIONS/pro3-exwm.desktop" <<EOF
[Desktop Entry]
Name=pro3 EXWM (Emacs)
Comment=Emacs EXWM Session
Exec=env PRO_WITH_EXWM=1 emacs --init-directory $ROOT/.emacs.d
Type=Application
DesktopNames=EXWM
EOF

echo "Created: $DM_SESSIONS/pro3-exwm.desktop
Select 'pro3 EXWM (Emacs)' in your display manager."
