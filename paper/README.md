# Paper Sources

This directory contains the canonical manuscript source, generated paper assets, and both anonymous and author-identifying PDFs.

- `qrc_phase_diagram.tex`: canonical manuscript source; it defaults to the anonymous version.
- `qrc_phase_diagram.pdf`: compiled default anonymous manuscript PDF.
- `variants/qrc_phase_diagram_anonymous.pdf`: explicit anonymous PDF built from the canonical source.
- `variants/qrc_phase_diagram_author.pdf`: author-identifying PDF built from the same canonical source.
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

Build both PDF variants from the same source with:

```bash
./build_variants.sh
```
