# Paper Sources

This directory contains the canonical manuscript source, generated paper assets, and the camera-ready build variants.

- `qrc_phase_diagram.tex`: canonical manuscript source; direct compilation produces the author/IEEE version without active links.
- `qrc_operating_band_arxiv.tex`: clean arXiv entry point with colored links and the IEEE accepted-manuscript notice.
- `qrc_operating_band_ieee.tex`: clean IEEE/CPS entry point without `hyperref` or active links.
- `variants/qrc_operating_band_arxiv.pdf`: rendered arXiv version.
- `variants/qrc_operating_band_ieee.pdf`: rendered IEEE/CPS version.
- `generated/phase_map_numbers.tex`: generated numeric macros used by the manuscript.
- `gfx/fig1_short_phase_maps.pdf`: leave-one-task-out phase maps.
- `gfx/fig4_gamma_slices_compact.pdf`: compact 2x2 damping-slice figure included in the manuscript PDF.
- `gfx/fig2_short_evidence.pdf`: validation-band frequency and mechanism-ablation maps.
- `gfx/fig3_memory_capacity_screens.pdf`: memory map, memory-rank relation, and screening-retention figure.
- `gfx/gamma_regime_slices_only.pdf`: supplemental wide damping-slice atlas.

Build locally with:

```bash
./build.sh --update-pdf
```

The build output goes to `paper/build/`, which is ignored by Git. The `--update-pdf` flag refreshes the tracked manuscript PDF after a successful build.

Build both publication-ready variants from the same source with:

```bash
./build_variants.sh
```

From the repository root, rebuild both PDFs and refresh the tracked upload bundle with:

```bash
./scripts/build_submission_zip.sh
```

This creates `dist/qrc_operating_band_arxiv_upload.zip` and `dist/qrc_operating_band_ieee_upload.zip`. Each ZIP is deliberately minimal and contains only the files needed to compile that version.
