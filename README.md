# Where a Quantum Reservoir Works: A Transferable Operating Band

[![arXiv](https://img.shields.io/badge/arXiv-2606.13284-b31b1b.svg)](https://arxiv.org/abs/2606.13284)
[![Accepted at QCE26](https://img.shields.io/badge/QCE26-accepted-00629B.svg)](https://qce.quantum.ieee.org/2026/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Complete reproducibility package for the paper *Where a Quantum Reservoir
Works: A Transferable Operating Band*.

**Publication status:** accepted as a workshop paper at the
**4th International Workshop on Quantum Machine Learning: From Research to
Practice**, part of the 2026 IEEE International Conference on Quantum Computing
and Engineering (QCE26 / IEEE Quantum Week 2026).

| Resource | Link |
|---|---|
| Paper | [arXiv:2606.13284](https://arxiv.org/abs/2606.13284) |
| Venue | [IEEE Quantum Week 2026 (QCE26)](https://qce.quantum.ieee.org/2026/) |
| Reproducibility guide | [`docs/reproducibility.md`](docs/reproducibility.md) |
| Data manifest | [`docs/data_manifest.md`](docs/data_manifest.md) |
| Citation metadata | [`CITATION.cff`](CITATION.cff) |

## Result

The package maps a validation-defined operating band in a dissipative quantum
reservoir over input drive `beta`, coupling `lambda`, and amplitude damping
`gamma`. The band is:

- selected using validation ranks rather than holdout performance;
- tested across tasks, reservoir initializations, and chronological holdout
  data;
- stress-tested with leave-one-task and leave-one-seed analyses;
- compared with mechanism ablations and task-free memory diagnostics.

The practical result is a reusable operating regime that can be screened with a
memory diagnostic before target-task tuning.

## Package contents

- `scripts/` — simulation, analysis, and figure-generation code.
- `data/` — checked CSV and JSON result artifacts.
- `docs/` — the reproducibility guide and data manifest.
- `paper/` — canonical manuscript source, generated number macros, and figure
  assets.
- `reproduce_from_artifacts.sh` — fast rebuild from checked result artifacts.
- `reproduce.sh` — full simulation recomputation.

## Fast reproduction from checked artifacts

Create an environment and install the pinned Python dependencies:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

Regenerate the analysis, figures, number macros, and manuscript PDF:

```bash
./reproduce_from_artifacts.sh
```

This runs:

```bash
python scripts/analyze_phase_map_generalization.py
python scripts/make_figures_and_build_data.py
./paper/build.sh --update-pdf
```

A local LaTeX installation with `pdflatex` is required for the manuscript
build.

## Publication builds

The arXiv and IEEE/CPS PDFs are generated from the same canonical manuscript
source:

```bash
./paper/build_variants.sh
```

To rebuild both PDFs and create minimal upload archives:

```bash
./scripts/build_submission_zip.sh
```

Generated publication files are written to:

- `paper/qrc_phase_diagram.pdf`
- `paper/variants/qrc_operating_band_arxiv.pdf`
- `paper/variants/qrc_operating_band_ieee.pdf`
- `dist/qrc_operating_band_arxiv_upload.zip`
- `dist/qrc_operating_band_ieee_upload.zip`

These generated paths are intentionally absent from a fresh clone until the
corresponding build command is run.

## Full recomputation

To rerun the simulation pipeline rather than rebuilding from the checked
artifacts:

```bash
./reproduce.sh
```

The artifact-based route is the recommended reviewer path; the full route is
substantially more expensive.

## Scope

The evidence is for simulated instances of the documented dissipative
gate-model reservoir family. The package supports the paper's operating-band,
transfer, ablation, and memory-screening claims. It does not make a hardware
quantum-advantage claim, and it does not cover finite-shot noise, calibration
drift, or measurement back-action.

## Citation and license

Please cite the paper and repository using [`CITATION.cff`](CITATION.cff).
The software is released under the [MIT License](LICENSE). The manuscript and
publication PDFs remain subject to the applicable IEEE publication terms.
