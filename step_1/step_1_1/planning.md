# Planning — music_maker_topsy_0\step_1\step_1_1

**Role:** Intermediate container for the nurturing Music Maker (Topsy).
Bridges the outer container (`step_1/`) and the runnable UI node (`step_1_1_1/`).

---

## Goals

- Act as a **transition layer**: no direct code here, only framing.
- Define the scope and tone for the pilot runnable node.
- Pass down empathy-first design cues and technical requirements.

---

## Roadmap

1. **Scaffold pilot node**
   - Create `step_1_1_1/` with:
     - `planning.md`
     - `story.md` (Do–Ti interactions for loading/rendering)
     - `code.py` (loader + minimal renderer)
     - `json/` (runtime state)
     - `samples/` (starter artifacts)

2. **Define pilot requirements**
   - Must load at minimum: `rhythm.json`, `form.json`, and `instruments.json`.
   - Merge into `json/project.topsy.json`.
   - Render rhythm in a **16-step view** with section order and instruments.

3. **Tone alignment**
   - Copy should reassure and encourage (“It’s okay, try again”, “Nice progress”).
   - Provide hints if artifacts are missing and suggest next builder.

---

## Sub-steps

- [ ] `step_1_1_1/` → **Pilot Node (Loader & Minimal Renderer)**
  - `planning.md` → node-level scroll
  - `story.md` → Do–Ti prompts for artifact loading/rendering
  - `code.py` → safe loaders, minimal renderer, Meditate menu
  - Outputs: `json/project.topsy.json`

- [ ] `step_1_1_2/` → **Extended Renderer (Optional)**
  - Adds melody/harmony summaries, bpm/swing tweaks

- [ ] `step_1_1_3/` → **Onboarding Variant (Optional)**
  - Demo mode with `samples/`, step-by-step helper text

---

## Decisions

- 2025-09-29 — `step_1_1/` is a structural bridge, not runnable.
- 2025-09-29 — Pilot node fixed at `step_1_1_1/` with minimal loader/renderer.
- 2025-09-29 — Empathy-first tone and guide-mode requirements passed downstream.
