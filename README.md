# Quantum Reservoir Operating Band

Reproducibility package for the paper **Where a Quantum Reservoir Works: A Transferable Operating Band**.

This repository contains the simulator, checked-in result artifacts, analysis scripts, manuscript sources, and generated figures needed to reproduce the operating-band results for a dissipative quantum reservoir.

## Reproducibility package

This package contains:

- Simulator and experiment code under `scripts/`
- Fixed configuration and search setup for the reported experiments
- Checked-in result files under `data/` (CSV/JSON)
- Figure and table generation scripts
- Manuscript source, anonymous and author PDFs, generated number macros, and figure assets under `paper/`
- Reproduction scripts for artifact-based rebuilds and full recomputation

The default manuscript build is the anonymous review version. The author-identifying version is generated from the same canonical source and stored separately under `paper/variants/`.

## Exact reproducibility contract

From checked-in artifacts, regenerate the manuscript figures, LaTeX number macros, and manuscript PDF:

```bash
./reproduce_from_artifacts.sh
```

This runs:

```bash
python scripts/analyze_phase_map_generalization.py
python scripts/make_figures_and_build_data.py
./paper/build.sh --update-pdf
```

To rebuild both manuscript PDFs from the same canonical source:

```bash
./paper/build_variants.sh
```

For full re-computation from raw simulations:

```bash
./reproduce.sh
```

## Operating-band result

The main artifact is a validation-defined operating band in the reservoir control space over input drive `beta`, coupling `lambda`, and amplitude damping `gamma`. The band is selected from validation ranks, audited on holdout data, stress-tested with leave-one-task and leave-one-seed transfer, and compared against mechanism ablations and memory diagnostics.

## Quick Start

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

```bash
./reproduce_from_artifacts.sh
```

## Expected outputs

- `paper/qrc_phase_diagram.pdf`
- `paper/variants/qrc_phase_diagram_anonymous.pdf`
- `paper/variants/qrc_phase_diagram_author.pdf`
- `paper/generated/phase_map_numbers.tex`
- `paper/gfx/fig1_short_phase_maps.pdf`
- `paper/gfx/fig4_gamma_slices_compact.pdf`
- `paper/gfx/fig2_short_evidence.pdf`
- `paper/gfx/fig3_memory_capacity_screens.pdf`
- `paper/gfx/gamma_regime_slices_only.pdf`

## Repository layout

```text
.
├── data/                       # fixed CSV/JSON outputs
├── docs/                       # reproducibility and manifest documentation
├── scripts/                    # simulation, analysis, and plotting code
├── paper/                      # manuscript sources and generated outputs
├── reproduce.sh                # full pipeline, including simulation recompute
└── reproduce_from_artifacts.sh # fast artifact-based rebuild
```

## Main files

- Manuscript source: `paper/qrc_phase_diagram.tex`
- Default anonymous PDF: `paper/qrc_phase_diagram.pdf`
- Explicit anonymous PDF: `paper/variants/qrc_phase_diagram_anonymous.pdf`
- Author PDF: `paper/variants/qrc_phase_diagram_author.pdf`
- Data manifest: `docs/data_manifest.md`
- Reproducibility guide: `docs/reproducibility.md`
