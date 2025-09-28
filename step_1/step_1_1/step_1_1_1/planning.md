# Planning — music_maker_topsy_0\step_1\step_1_1\step_1_1_1

**Role:** **Pilot runnable node** for Topsy (nurturing Music Maker).
Loads builder artifacts, assembles a project, and renders a gentle text-first view.

---

## Goals

- Provide an **empathy-first** loader + minimal renderer the player can run immediately.
- Validate presence and schema tags for inputs; fail softly with friendly hints.
- Save & reload a merged `project.topsy.json` for continuity.

---

## Inputs (expected)

- `exports/rhythm.json`
- `melody.json` **or** `melody.mid`
- `harmony.json`
- `form.json`
- `instruments.json`
- `expression.json`
- `mix.json`

> Each JSON input should include `"mtc_schema": "<domain>/<semver>"`.
> If melody is `.mid`, skip schema and parse MIDI metadata for summaries.

---

## Outputs

- `json/project.topsy.json` (pretty-printed; includes `maker`, `version`, `created`, `sources`)
- Console / text UI: 16-step rhythm view, section order, active instruments, basic summaries

---

## Roadmap

1. **Scaffold files**
   - Create:
     - `story.md` — player-facing copy (welcome, hints, help text)
     - `code.py` — loaders, validator stubs, renderer, Meditate menu
     - `json/` — runtime store (write `project.topsy.json` here)
     - `samples/` — minimal, valid demo artifacts for `--demo` run

2. **Implement safe loaders**
   - JSON loader with try/except, clear messages:
     - which file is missing
     - which field mismatched (expected vs found)
   - MIDI loader (if `melody.mid`): extract length, note range, channel count

3. **Assemble project**
   - Shape:
     ```json
     {
       "maker": "topsy",
       "version": "1.0.0",
       "created": "<iso>",
       "sources": { "rhythm": "...", "form": "...", "instruments": "..." },
       "views": { "rhythm_grid": [], "sections": [], "instruments": [] },
       "notes": { "melody_summary": {}, "harmony_summary": {} }
     }
     ```

4. **Minimal renderer (text-first)**
   - Rhythm: print 16-step pattern lines per track (e.g., `x . x . ...`)
   - Form: list sections in order
   - Instruments: list active instruments per track
   - Summaries: melody range, harmony count/key (if available)

5. **Meditate menu (UX)**
   - **1. Load** (scan `./` and `samples/` if `--demo`)
   - **2. Render** (print views)
   - **3. Save** (`json/project.topsy.json`)
   - **4. Load Project** (from saved file)
   - **5. Help** (explain inputs, where to get them, “it’s okay” tone)
   - **6. Quit**

6. **Demo path**
   - `python code.py --demo` loads from `samples/` and renders immediately.

---

## Validation (MVP)

- Presence check for files.
- `"mtc_schema"` string match for JSON artifacts (just existence + prefix at MVP).
- Step counts (rhythm: 16), section/form length sanity check.

---

## Run Instructions

```powershell
cd step_1\step_1_1\step_1_1_1
python code.py            # normal
python code.py --demo     # load from samples/
