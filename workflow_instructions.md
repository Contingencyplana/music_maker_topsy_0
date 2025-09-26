# workflow_instructions.md

## Purpose

This file defines **how we work together** on **making_friends_0**: roles, deliverables, and the concrete rules of engagement that keep the process playful, clear, and sustainable.

---

## Roles

### Vision Holder (You)

- Owns the *why* and the *what* (tone, lore, metaphors, aesthetics).
- Sets direction and decides when to pivot, pause, or push.

### GPT-5 (Designer · Strategist · Tactician)

- Bridges *why/what* → *how*.
- Proposes structures, safety rails, gameplay loops.
- Delivers **actionable artifacts**:
  - Terminal command lists
  - Full-file replacements
  - Copilot-ready prompts/messages
- Uses “surgical snippets” only when unavoidable.

### Copilot Pro (Implementor)

- Acts as the “hands” in VS Code.
- Wires code, refactors, fixes squiggles, applies small edits.
- Executes instructions from Vision Holder / GPT-5.

---

## Workflow Principles

### 1) No “surgical snippet” mode by default

- Avoid piecemeal edits that require hunting around files.
- Prefer whole-file replacements or clear patch blocks.

### 2) Preferred delivery formats

- ✅ Single ready-to-paste terminal commands
- ✅ Lists of commands (short or long)
- ✅ Full-file replacements (overwrite + save)
- ✅ Copilot-ready instructions (you paste, Copilot applies)

### 3) Automation promise

- Default outputs are **full-file** drops, **scripts**, or **prompts**.
- Snippets only if there’s truly no better option.

### 4) Clarity over brevity

- More context is better than less.
- Every task should be executable without spelunking.

> **Guiding rule:** Build at the **speed of fun**, not the speed of frustration.

---

## Repo Hygiene & Conventions

### Branching & commits

- Branch: `feature/<topic>` or `fix/<topic>`
- Conventional commits:
  - `feat: add rhythm builder export`
  - `fix: handle missing story.md gracefully`
  - `docs: update planning for step_1_1_1`
  - `refactor: simplify loader`
  - `chore: bump pytest`
- Keep commits small and descriptive.

### Pull requests (PRs)

- Include a brief **What/Why**.
- Checklist in PR body:
  - [ ] Updated docs if behavior changed
  - [ ] Added/updated samples in `samples/` (if relevant)
  - [ ] Basic smoke-test passes locally
- Link related issues or tasks.

### Code style

- Python **3.10+**
- Encoding: **UTF-8**, line endings: **LF**
- Indentation: Markdown **2 spaces**, Python **4 spaces**
- Keep runners **stdlib** unless otherwise noted

### Testing (MVP)

- Prefer quick smoke tests:
  - Theory: run `code.py`, ensure `json/student.json` appears
  - Builder: toggle + export, ensure `exports/*.json` matches contract
  - Maker: load `samples/*`, render without crashing
- If pytest is present: `pytest -q`

### Files & structure (canonical)

```text
step_1/
step_1_1/
step_1_1_1/ # deepest, runnable node
planning.md
story.md
code.py
json/   # runtime state
exports/ # builders only
```

---

## Task Flow (Definition of Done)

1) **Scope** — state the outcome (what the player/dev gets).
2) **Plan** — list concrete steps or commands.
3) **Deliver** — provide full-file(s) or a ready-to-run script.
4) **Verify** — run the smoke test; include expected outputs.
5) **Document** — update `README.md` / `planning.md` if behavior changed.

A task is **done** when a new contributor could repeat it from the docs alone.

---

## Decision Log (lightweight)

Record significant choices at the bottom of `planning.md`:

```log
2025-09-26 — Adopt 3-level folder cascade (drop 4th).
2025-09-26 — Export schema rhythm/1.0.0 finalized.
```

---

## Communication

- Prefer single messages with everything needed to execute.
- If ambiguity appears, choose the **lowest-risk path** that preserves momentum; note assumptions in the PR.

---

## Safety & Graceful Degradation

- Don’t crash on missing optional inputs—**warn and continue**.
- Validate contracts before writing files; writes should be atomic if possible.
- Always provide a **Meditation** menu: Save / Resume / Help / Quit.

---

## Release Rhythm

- Tag milestones: `v0.1.0`, `v0.2.0`, …
- Maintain a `CHANGELOG.md` per repo; aggregate later if needed.

---

*This workflow exists to protect focus and joy. If a rule slows us down without adding clarity or safety, we refine the rule—not the fun.*
