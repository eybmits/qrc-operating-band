#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

./paper/build_variants.sh

mkdir -p dist
bundle="dist/qrc_operating_band_submission_package.zip"
rm -f "$bundle"

zip -rq "$bundle" \
  README.md \
  LICENSE \
  SECURITY.md \
  requirements.txt \
  reproduce.sh \
  reproduce_from_artifacts.sh \
  docs \
  data \
  scripts \
  paper \
  -x '*/.DS_Store' \
  -x 'paper/build/*' \
  -x 'paper/gfx/*.png' \
  -x '__pycache__/*' \
  -x '*.pyc' \
  -x 'tmp/*' \
  -x 'outputs/*' \
  -x '.venv/*' \
  -x 'venv/*' \
  -x 'env/*'

echo "$bundle"
