# music_maker_topsy_0

This workspace is the **nurturing Music Maker** — the Topsy pole of the Creative Ecosystem.  
It loads artifacts from all seven builders (rhythm, melody, harmony, form, sound, expression, mix)  
and renders them into an interactive, playful music-making experience.

---

## Role
- Provide a **friendly, supportive UI/UX** for creating and exploring music.  
- Embody **Topsy’s aspect**: nurture, cohesion, continuity.  
- Integrate with the Thorn pole (`music_maker_thorn_0`) for balance and challenge.  

---

## Structure
- `step_1/.../step_1_1_1_1/` → deepest runnable node  
  - `story.md` → narrative choices (Do–Ti + Meditate)  
  - `code.py` → loads builder artifacts + state  
  - `json/` → runtime state  
- `planning.md` → root-level plan  
- `INPUT_CONTRACT.md` → documents expected artifacts from builders  
- `samples/` → contains golden imports (e.g., rhythm.json)

---

## Inputs
- `exports/rhythm.json` (from builder_rhythm_0)  
- `exports/melody.json` or `.mid` (from builder_melody_0)  
- `exports/harmony.json`  
- `exports/form.json`  
- `exports/instruments.json`  
- `exports/expression.json`  
- `exports/mix.json`  

Each must declare its schema version via `"mtc_schema": "<domain>/<semver>"`.

---

## How to Run

```powershell
cd step_1\step_1_1\step_1_1_1\step_1_1_1_1
```

## Outputs
- `project.topsy.json` → the player’s saved composition/project state.

---

## Notes
- **Topsy = cohesion and empathy.** The UI should feel welcoming.  
- All schema contracts must be honored.  
- This workspace pairs with `music_maker_thorn_0` for a dual Music Maker experience.
