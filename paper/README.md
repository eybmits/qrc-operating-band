# Paper Sources

This directory contains the content-anonymized manuscript source and generated paper assets.

- `qrc_phase_diagram.tex`: manuscript source.
- `qrc_phase_diagram.pdf`: compiled manuscript PDF.
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
