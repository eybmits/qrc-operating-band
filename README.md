# Quantum Reservoir Operating Band

Reproducibility package for the paper **Where a Quantum Reservoir Works: A Transferable Operating Band**.

Project repository: [github.com/eybmits/qrc-operating-band](https://github.com/eybmits/qrc-operating-band)

This repository contains the simulator, checked-in result artifacts, analysis scripts, manuscript sources, and generated figures needed to reproduce the operating-band results for a dissipative quantum reservoir.

## Reproducibility package

This package contains:

- Simulator and experiment code under `scripts/`
- Fixed configuration and search setup for the reported experiments
- Checked-in result files under `data/` (CSV/JSON)
- Figure and table generation scripts
- Manuscript source, arXiv and IEEE camera-ready PDFs, generated number macros, and figure assets under `paper/`
- Reproduction scripts for artifact-based rebuilds and full recomputation

The publication-ready variants are generated from one canonical source. The arXiv build retains colored links and the IEEE accepted-manuscript notice; the IEEE/CPS build intentionally loads no `hyperref` package and contains no active links.

Two minimal source bundles are generated for upload: `dist/qrc_operating_band_arxiv_upload.zip` and `dist/qrc_operating_band_ieee_upload.zip`. Each contains only its entry point, the canonical TeX source, `IEEEtran.cls`, generated number macros, and the four included figure PDFs.

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

To rebuild both clean manuscript PDFs from the same canonical source:

```bash
./paper/build_variants.sh
```

To rebuild both PDFs and refresh both minimal upload ZIPs:

```bash
./scripts/build_submission_zip.sh
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
- `paper/variants/qrc_operating_band_arxiv.pdf`
- `paper/variants/qrc_operating_band_ieee.pdf`
- `dist/qrc_operating_band_arxiv_upload.zip`
- `dist/qrc_operating_band_ieee_upload.zip`
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
- arXiv PDF: `paper/variants/qrc_operating_band_arxiv.pdf`
- IEEE/CPS PDF: `paper/variants/qrc_operating_band_ieee.pdf`
- arXiv source upload: `dist/qrc_operating_band_arxiv_upload.zip`
- IEEE source upload: `dist/qrc_operating_band_ieee_upload.zip`
- Data manifest: `docs/data_manifest.md`
- Reproducibility guide: `docs/reproducibility.md`
