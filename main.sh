#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v nix >/dev/null 2>&1; then
  echo "Error: nix is not installed or not in PATH." >&2
  exit 1
fi

nix run .#default
