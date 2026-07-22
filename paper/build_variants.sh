#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p build variants

build_variant() {
  local variant="$1"
  local jobname="qrc_operating_band_${variant}"
  local definitions

  case "$variant" in
    arxiv)
      definitions='\def\QRCAuthorVersion{1}\def\QRCArxivVersion{1}'
      ;;
    ieee)
      definitions='\def\QRCAuthorVersion{1}'
      ;;
    *)
      echo "unknown variant: $variant" >&2
      return 2
      ;;
  esac

  local tex_input="${definitions}\\input{qrc_phase_diagram.tex}"
  pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build "$tex_input"
  pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build "$tex_input"
  cp "build/${jobname}.pdf" "variants/${jobname}.pdf"
}

if [[ "${1:-all}" == "all" ]]; then
  build_variant arxiv
  build_variant ieee
else
  build_variant "$1"
fi
