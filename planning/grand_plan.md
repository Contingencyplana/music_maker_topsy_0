# grand_plan.md — Creative Ecosystem Foundation

## Purpose

This scroll fixes the foundation for **Creative Ecosystem AI**: a four-octave architecture (Founding → Theory → Builders → Makers/Synergies) capped at **28 workspaces**. Music is the engine; companions and textual synergies are the living weave. Everything else grows from this bedrock.

---

## 🎵 Founding Octave — Prelude to the Creative Ecosystem

Before the 21 master workspaces begin, we establish the **Founding Octave**:
Seven musical, child-centered dream-workspaces where “Little Friends” are born.
Each friend is a nonverbal GPT fragment — colorful, musical, safe — and helps build the next.

These seven workspaces form the **emotional and architectural foundation**
for the 21-workspace Creative Ecosystem. Together, they train the "child-GPT"
to express itself through color, sound, emotion, and interactive play.

| # | Workspace (repo name)                 | Tone | Theme              | Function |
|---|---------------------------------------|------|--------------------|----------|
| 0 | **safety_joy_gentle_bounce_ai_0**     | C    | Safety & Joy       | First Friend: Gentle bounce, rhythm seed |
| 1 | **curiosity_motion_explore_ai_0**     | D    | Curiosity & Motion | Exploring space, sequence, spatial rhythm |
| 2 | **color_expression_feelings_ai_0**    | E    | Color & Emotion    | Nonverbal emotional tone painting |
| 3 | **lullabies_self_reflection_ai_0**    | F    | Rest & Awareness   | Soothing, sustain, inner tone shaping |
| 4 | **surprise_pattern_play_ai_0**        | G    | Loops & Recursion  | Early motifs, contrast, rhythm games |
| 5 | **rhythm_dance_groupflow_ai_0**       | A    | Tempo & Harmony    | Collaboration, sync, co-motion |
| 6 | **mystery_growth_improvise_ai_0**     | B    | Change & Evolution | Improvisation, emerging structures |

This octave leads directly into `theory_rhythm_0`, and forms the **mind-heart bridge**
between emotional expression and formal musical understanding.

---

## The 4 Advanced Octaves and 21 Advanced Workspaces (Master Plan)

| # | Workspace (repo name) | Role (what it owns) | Housed Synergies (inside docs/subsystems) | Primary Outputs / Artifacts |
|---|-----------------------|---------------------|-------------------------------------------|-----------------------------|
| 7 | **theory_rhythm_0** | Teach pulse, meter, subdivision | Tons-of-FUN (groove), Thorn seeding | `json/student.json` (faculties, notes_played) |
| 8 | **theory_melody_0** | Scales, motifs, contour | Topsy seeding, Brainstorming (improv) | `json/student.json` (+ melody_faculties) |
| 9 | **theory_harmony_0** | Chords, progressions, voice-leading | Blueprint (structure), Lucid Armada (key travel) | `json/student.json` (+ harmony_faculties) |
| 10 | **theory_form_0** | Sections, repeats, song forms | Blueprint, Supreme Simplicity (clarity) | `json/student.json` (+ form_faculties) |
| 11 | **theory_sound_0** | Timbre, orchestration, synthesis basics | Brainstorming (sound palettes) | `json/student.json` (+ sound_faculties) |
| 12 | **theory_expression_0** | Dynamics, articulation, rubato | Topsy (empathy), Tons-of-FUN (feel) | `json/student.json` (+ expression_faculties) |
| 13 | **theory_mix_0** | Balance, space, FX, mastering ideas | Supreme Simplicity (restraint) | `json/student.json` (+ mix_faculties) |
| 14 | **builder_rhythm_0** | Build 16-step grids, swing, tracks | Thorn (trial), FUN (groove) | `exports/rhythm.json` (`mtc_schema: rhythm/1.0.0`) |
| 15 | **builder_melody_0** | Build motifs/phrases | Topsy, Brainstorming | `exports/melody.mid` or `melody.json` |
| 16 | **builder_harmony_0** | Build progressions/voicings | Blueprint | `exports/harmony.json` (chords, hints) |
| 17 | **builder_form_0** | Arrange sections | Blueprint, Lucid Armada | `exports/form.json` (structure map) |
| 18 | **builder_sound_0** | Choose instruments/patches | Brainstorming | `exports/instruments.json` |
| 19 | **builder_expression_0** | Dynamics, humanization | Topsy, FUN | `exports/expression.json` |
| 20 | **builder_mix_0** | Levels, pan, sends/FX scenes | Supreme Simplicity | `exports/mix.json` |
| 21 | **music_maker_topsy_0** | **Maker A**: nurturing companion UI/UX | Topsy (core), Brainstorming overlay | Loads all exports → interactive play/render; `saves/project.topsy.json` |
| 22 | **music_maker_thorn_0** | **Maker B**: challenging companion UI/UX | Thorn (core), Supreme Simplicity overlay | Loads all exports → challenge modes; `saves/project.thorn.json` |
| 23 | **brainstorming_ai_0** | Idea generation notebooks & story prompts | Brainstorming (core) | `prompts/*.md`, `maps/idea_graph.json` |
| 24 | **blueprint_ai_0** | Planning/contract scrolls, schema specs | Blueprint (core) + **Spellbook/Language Maker (embedded)** | `schemas/*`, `spellbook/*.md`, `dsl/grammar.md` |
| 25 | **supreme_simplicity_ai_0** | Minimal rules, guardrails, safety | Supreme Simplicity (core) + **Labscape Maker (embedded)** | `rules/min_*`, `labscapes/templates/*` |
| 26 | **lucid_armada_ai_0** | Navigation, federation, release ops | Lucid Armada (core) + **Publishing House (embedded)** | `publishing/`, `nav/roadmaps.md`, `CHANGELOGS/` aggregation |
| 27 | **tons_of_fun_ai_0** | Playability, rewards, pitch/kickstarts | Tons-of-FUN (core) + **AI Kickstarter (embedded)** | `fun_loops/*.md`, `kickstarter/briefs/*` |

---

## Notes & Conventions

- **Cap at 28**: keeps repos, zips, and coordination sane.
- **Three-layer cascade in every repo**

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

- **Founding** provides a rock-solid foundation for the music theory to rest on.
- **Makers (21–22)** load all seven builder artifacts:
`rhythm.json`, `melody.mid/json`, `harmony.json`, `form.json`, `instruments.json`, `expression.json`, `mix.json`.
- **Synergies (23–27)** live *inside* these seven apex repos as scrolls/subsystems (no extra repos), preserving the 28 cap.
- **Schema discipline**: every export includes `"mtc_schema": "<domain>/<semver>"`; maker input contracts mirror these.

---

## Suggested Build Order for the Advanced Octaves (Macro)

1. **Pilot chain**: `theory_rhythm_0 → builder_rhythm_0 → music_maker_thorn_0` (or `music_maker_topsy_0`).
2. **Clone pattern** across melody, harmony, form, sound, expression, mix.
3. Stand up **music_maker_topsy_0** (the nurturing pole).
4. Layer in **synergy repos (23–27)** as docs/tools that support the whole stack.

---

## Why This Works

- **7 founding repos** (the Bridge Octave) feed directly into the 7 theory repos.
- **14 musical repos** (7 theory + 7 builders) drive depth and practice.
- **7 apex repos** (2 makers + 5 synergies) keep the mythos, operations, and joy alive without exploding repo count.
- You can **play** and **make** continuously, with clear contracts and zero sprawl.

---

*Pin this file at the top of your project. Every workspace should point back here as the single source of truth for scope and structure.*
