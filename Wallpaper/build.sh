#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
PKG_DIR="$SCRIPT_DIR/packages"

rm -rf "$BUILD_DIR" "$PKG_DIR"
mkdir -p "$BUILD_DIR" "$PKG_DIR"

echo "==> Cleaning old sources..."
rm -rf "$SCRIPT_DIR/src"

echo "==> Building packages..."
PKGDEST="$PKG_DIR" SRCDEST="$BUILD_DIR" BUILDDIR="$BUILD_DIR" \
    makepkg -s --cleanbuild --noconfirm

echo ""
echo "==> Packages:"
ls -lh "$PKG_DIR"/*.pkg.tar.* 2>/dev/null || echo "    (none)"
