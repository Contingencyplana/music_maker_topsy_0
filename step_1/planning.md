# Planning — music_maker_topsy_0\step_1

**Role:** First container layer for the nurturing Music Maker (Topsy).
Hosts sibling branches (`step_1_*/`) that lead to runnable UI nodes.

---

## Goals

- Establish a gentle, **empathy-first** path to load builder artifacts and let the player hear/see them.
- Keep this layer non-runnable; it frames the branches and passes detail to children.
- Ensure consistency with contracts (rhythm/melody/harmony/form/instruments/expression/mix).

---

## Roadmap

1. **Create sub-branches**
   - Add `step_1_1/` (pilot) with its own `planning.md`.
   - Optionally stub `step_1_2/` and `step_1_3/` with `planning.md`.
   - Confirm cascade for pilot: `step_1/ → step_1_1/ → step_1_1_1/` (runnable).

2. **Define Topsy tone**
   - Friendly prompts, “it’s okay” copy, hints when files are missing.
   - “Guide mode” that suggests which builder to use next.

3. **Pass requirements downstream**
   - Children must: load artifacts, validate `"mtc_schema"`, assemble `project`, render a text-first view, and offer **Meditate** (Save/Load/Help/Quit).

---

## Sub-steps

- [ ] `step_1_1/` → **Branch A (pilot: Loader & Minimal Renderer)**
  - Target runnable node: `step_1_1_1/`
  - Scope: load rhythm + form + instruments; render 16-step view; save `json/project.topsy.json`

- [ ] `step_1_2/` → **Branch B (Composer Playground)**
  - Target runnable node: `step_1_2_1/`
  - Scope: gentle parameter tweaks (bpm, swing, section order preview), melody/harmony summaries

- [ ] `step_1_3/` → **Branch C (Guided Onboarding)**
  - Target runnable node: `step_1_3_1/`
  - Scope: demo mode loading from `samples/*`, step-by-step hints, missing-file helpers

> Runnable maker nodes live at depth **three**: `step_*_*_*/` (e.g., `step_1_1_1/`).

---

## Hand-down Requirements (to children)

- Inputs: `exports/rhythm.json`, `melody.json|.mid`, `harmony.json`, `form.json`, `instruments.json`, `expression.json`, `mix.json`
- Validate: presence + `"mtc_schema": "<domain>/<semver>"`
- Project: merge into `{ maker: "topsy", version: "1.0.0", created: "<iso>" }`
- UX: **Meditate** menu (Save / Load / Help / Quit)
- Output: `json/project.topsy.json` (pretty-printed)

---

## Decisions

- 2025-09-29 — `step_1/` is a container only (no `story.md` or `code.py` here).
- 2025-09-29 — Pilot branch set to **Loader & Minimal Renderer** at `step_1_1_1/`.
- 2025-09-29 — Topsy tone: nurturing copy + guide mode for missing artifacts.
