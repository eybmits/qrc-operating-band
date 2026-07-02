#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p build variants

build_variant() {
  local variant="$1"
  local jobname="qrc_phase_diagram_${variant}"

  case "$variant" in
    anonymous)
      pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build qrc_phase_diagram.tex
      pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build qrc_phase_diagram.tex
      ;;
    author)
      pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build '\def\QRCAuthorVersion{1}\input{qrc_phase_diagram.tex}'
      pdflatex -interaction=nonstopmode -halt-on-error -jobname "$jobname" -output-directory build '\def\QRCAuthorVersion{1}\input{qrc_phase_diagram.tex}'
      ;;
    *)
      echo "unknown variant: $variant" >&2
      return 2
      ;;
  esac

  cp "build/${jobname}.pdf" "variants/${jobname}.pdf"
}

if [[ "${1:-all}" == "all" ]]; then
  build_variant anonymous
  build_variant author
  cp variants/qrc_phase_diagram_anonymous.pdf qrc_phase_diagram.pdf
else
  build_variant "$1"
fi
