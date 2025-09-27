# grand_plan.md — Creative Ecosystem Foundation

## Purpose

This scroll fixes the foundation for **Creative Ecosystem AI**: a three-octave architecture (Theory → Builders → Makers/Synergies) capped at **21 workspaces**. Music is the engine; companions and textual synergies are the living weave. Everything else grows from this bedrock.

---

## The 21 Workspaces (Master Plan)

| # | Workspace (repo name) | Role (what it owns) | Housed Synergies (inside docs/subsystems) | Primary Outputs / Artifacts |
|---|-----------------------|---------------------|-------------------------------------------|-----------------------------|
| 1 | **theory_rhythm_0** | Teach pulse, meter, subdivision | Tons-of-FUN (groove), Thorn seeding | `json/student.json` (faculties, notes_played) |
| 2 | **theory_melody_0** | Scales, motifs, contour | Topsy seeding, Brainstorming (improv) | `json/student.json` (+ melody_faculties) |
| 3 | **theory_harmony_0** | Chords, progressions, voice-leading | Blueprint (structure), Lucid Armada (key travel) | `json/student.json` (+ harmony_faculties) |
| 4 | **theory_form_0** | Sections, repeats, song forms | Blueprint, Supreme Simplicity (clarity) | `json/student.json` (+ form_faculties) |
| 5 | **theory_sound_0** | Timbre, orchestration, synthesis basics | Brainstorming (sound palettes) | `json/student.json` (+ sound_faculties) |
| 6 | **theory_expression_0** | Dynamics, articulation, rubato | Topsy (empathy), Tons-of-FUN (feel) | `json/student.json` (+ expression_faculties) |
| 7 | **theory_mix_0** | Balance, space, FX, mastering ideas | Supreme Simplicity (restraint) | `json/student.json` (+ mix_faculties) |
| 8 | **builder_rhythm_0** | Build 16-step grids, swing, tracks | Thorn (trial), FUN (groove) | `exports/rhythm.json` (`mtc_schema: rhythm/1.0.0`) |
| 9 | **builder_melody_0** | Build motifs/phrases | Topsy, Brainstorming | `exports/melody.mid` or `melody.json` |
| 10 | **builder_harmony_0** | Build progressions/voicings | Blueprint | `exports/harmony.json` (chords, hints) |
| 11 | **builder_form_0** | Arrange sections | Blueprint, Lucid Armada | `exports/form.json` (structure map) |
| 12 | **builder_sound_0** | Choose instruments/patches | Brainstorming | `exports/instruments.json` |
| 13 | **builder_expression_0** | Dynamics, humanization | Topsy, FUN | `exports/expression.json` |
| 14 | **builder_mix_0** | Levels, pan, sends/FX scenes | Supreme Simplicity | `exports/mix.json` |
| 15 | **music_maker_topsy_0** | **Maker A**: nurturing companion UI/UX | Topsy (core), Brainstorming overlay | Loads all exports → interactive play/render; `saves/project.topsy.json` |
| 16 | **music_maker_thorn_0** | **Maker B**: challenging companion UI/UX | Thorn (core), Supreme Simplicity overlay | Loads all exports → challenge modes; `saves/project.thorn.json` |
| 17 | **brainstorming_ai_0** | Idea generation notebooks & story prompts | Brainstorming (core) | `prompts/*.md`, `maps/idea_graph.json` |
| 18 | **blueprint_ai_0** | Planning/contract scrolls, schema specs | Blueprint (core) + **Spellbook/Language Maker (embedded)** | `schemas/*`, `spellbook/*.md`, `dsl/grammar.md` |
| 19 | **supreme_simplicity_ai_0** | Minimal rules, guardrails, safety | Supreme Simplicity (core) + **Labscape Maker (embedded)** | `rules/min_*`, `labscapes/templates/*` |
| 20 | **lucid_armada_ai_0** | Navigation, federation, release ops | Lucid Armada (core) + **Publishing House (embedded)** | `publishing/`, `nav/roadmaps.md`, `CHANGELOGS/` aggregation |
| 21 | **tons_of_fun_ai_0** | Playability, rewards, pitch/kickstarts | Tons-of-FUN (core) + **AI Kickstarter (embedded)** | `fun_loops/*.md`, `kickstarter/briefs/*` |

---

## Notes & Conventions

- **Cap at 21**: keeps repos, zips, and coordination sane.
- **Four-layer cascade in every repo**  

```text
step_1/
step_1_1/
step_1_1_1/  # deepest, runnable node 
planning.md
story.md
code.py
json/          # runtime state
exports/       # builders only
```

- **Makers (15–16)** load all seven builder artifacts:  
`rhythm.json`, `melody.mid/json`, `harmony.json`, `form.json`, `instruments.json`, `expression.json`, `mix.json`.
- **Synergies (17–21)** live *inside* these seven apex repos as scrolls/subsystems (no extra repos), preserving the 21 cap.
- **Schema discipline**: every export includes `"mtc_schema": "<domain>/<semver>"`; maker input contracts mirror these.

---

## Suggested Build Order (Macro)

1. **Pilot chain**: `theory_rhythm_0 → builder_rhythm_0 → music_maker_thorn_0` (or `music_maker_topsy_0`).  
2. **Clone pattern** across melody, harmony, form, sound, expression, mix.  
3. Stand up **music_maker_topsy_0** (the nurturing pole).  
4. Layer in **synergy repos (17–21)** as docs/tools that support the whole stack.

---

## Why This Works

- **14 musical repos** (7 theory + 7 builders) drive depth and practice.  
- **7 apex repos** (2 makers + 5 synergies) keep the mythos, operations, and joy alive without exploding repo count.  
- You can **play** and **make** continuously, with clear contracts and zero sprawl.

---

*Pin this file at the top of your project. Every workspace should point back here as the single source of truth for scope and structure.*
