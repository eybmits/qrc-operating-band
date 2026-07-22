#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

./paper/build_variants.sh all

mkdir -p dist
stage_root="$(mktemp -d "${TMPDIR:-/tmp}/qrc-upload.XXXXXX")"
trap 'rm -rf "$stage_root"' EXIT

figure_files=(
  fig1_short_phase_maps.pdf
  fig2_short_evidence.pdf
  fig3_memory_capacity_screens.pdf
  fig4_gamma_slices_compact.pdf
)

for variant in arxiv ieee; do
  stage="$stage_root/$variant"
  bundle="$repo_root/dist/qrc_operating_band_${variant}_upload.zip"
  mkdir -p "$stage/generated" "$stage/gfx"

  cp "paper/qrc_operating_band_${variant}.tex" "$stage/main.tex"
  cp paper/qrc_phase_diagram.tex paper/IEEEtran.cls "$stage/"
  cp paper/generated/phase_map_numbers.tex "$stage/generated/"
  for figure_file in "${figure_files[@]}"; do
    cp "paper/gfx/$figure_file" "$stage/gfx/"
  done

  rm -f "$bundle"
  (
    cd "$stage"
    zip -X -q -r "$bundle" .
  )
  echo "$bundle"
done
