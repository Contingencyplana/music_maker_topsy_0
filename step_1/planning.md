# Planning — music_maker_topsy_0
**Role:** Root-level plan for the nurturing Music Maker (Topsy’s pole).

---

## Goals
- Provide a welcoming, empathetic UI for composing and playing music.
- Load all builder exports:
  - `rhythm.json`
  - `melody.json` / `melody.mid`
  - `harmony.json`
  - `form.json`
  - `instruments.json`
  - `expression.json`
  - `mix.json`
- Combine these into a cohesive project state (`project.topsy.json`).
- Ensure the player feels guided, safe, and encouraged.

---

## Sub-steps
- [ ] `step_1/` → container for maker modules
- [ ] `step_1_1/` → first branch of maker steps
- [ ] `step_1_1_1/` → sub-branch
- [ ] `step_1_1_1_1/` → runnable node (UI code + state management)

---

## Deliverables
- `project.topsy.json` — saved player compositions.
- Welcoming textual interface (prototype) with room for graphics and sound later.
- Input validation against all schema contracts (rhythm, melody, harmony, form, sound, expression, mix).

---

## Decisions
- 2025-09-25 — This workspace represents the **nurture/care** pole of the twin Music Makers.
- 2025-09-25 — Output file is `project.topsy.json`.
- 2025-09-25 — All builder artifacts must be loaded before rendering the composition.

## Roadmap (workspace build steps)

1. **Scaffold**
   - Ensure 4-layer cascade exists: `step_1/step_1_1/step_1_1_1/step_1_1_1_1/`
   - Deepest node contains: `planning.md`, `story.md`, `code.py`, `json/`

2. **Define input contracts**
   - Create `INPUT_CONTRACT.md` with field expectations for:
     `rhythm.json`, `melody.json|.mid`, `harmony.json`, `form.json`,
     `instruments.json`, `expression.json`, `mix.json`
   - Note `"mtc_schema": "<domain>/<semver>"` for each

3. **Implement loaders**
   - In `.../code.py`, add safe loaders for each artifact
   - Validate presence & schema version; report friendly errors

4. **Compose project state**
   - Merge loaded artifacts into a single `project` dict
   - Include metadata: `{ "maker": "topsy", "version": "1.0.0", "created": <iso> }`

5. **Minimal renderer (text first)**
   - Render: rhythm as 16-step lines, section order from `form.json`,
     active instruments from `instruments.json`
   - Show melody/harmony summaries (counts, key, range)

6. **Save/Load UX**
   - Add Meditate menu: Save / Load / Help / Quit
   - Save to `json/project.topsy.json` (pretty-printed)

7. **Empathy polish (Topsy tone)**
   - Gentle prompts, success messages, hints when files are missing
   - “Guide mode” that suggests next builder to use if an artifact is absent

8. **Samples & quick start**
   - Place golden inputs in `samples/`
   - Add a `--demo` flag to load from `samples/*` for instant run

9. **Testing & guards**
   - Basic checks (e.g., 16 steps per track, matching section lengths)
   - Graceful fallback if melody is `.mid` vs `.json`

10. **Docs & hygiene**
    - Update `README.md` (How to Run, Inputs, Outputs)
    - Link to `builder_*` repos and the grand plan
    - Commit: `feat(topsy): loader + minimal renderer + save/load`
