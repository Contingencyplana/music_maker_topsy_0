import json, os, sys, re

STATE_DIR = "json"
STATE_PATH = os.path.join(STATE_DIR, "student.json")
DEFAULT = {
    "version": "1.0.0",
    "role": "student",
    "notes_played": [],
    "faculties": {"listening": 1, "comprehension": 0}
}
CHOICES = {
    "1": "Do", "2": "Re", "3": "Mi", "4": "Fa",
    "5": "Sol", "6": "La", "7": "Ti", "8": "Meditate"
}

def load_state():
    os.makedirs(STATE_DIR, exist_ok=True)
    if os.path.exists(STATE_PATH):
        with open(STATE_PATH, "r", encoding="utf-8") as f:
            return json.load(f)
    return DEFAULT.copy()

def save_state(s):
    with open(STATE_PATH, "w", encoding="utf-8") as f:
        json.dump(s, f, ensure_ascii=False, indent=2)

def read_sections(md_path="story.md"):
    with open(md_path, "r", encoding="utf-8") as f:
        txt = f.read()
    out = {}
    for name in ["Do", "Re", "Mi", "Fa", "Sol", "La", "Ti"]:
        m = re.search(rf"^## {name}\n(.*?)(?=^## |\Z)", txt, re.S | re.M)
        out[name] = (m.group(1).strip() if m else "")
    return out

def meditate(state):
    while True:
        print("\n[ Meditation ] 1) Save  2) Resume  3) Help  4) Quit")
        c = input("> ").strip()
        if c == "1":
            save_state(state); print("Saved.")
        elif c == "2":
            return
        elif c == "3":
            print("Pick 1–7 to play notes (Do–Ti). 8 opens this menu.")
        elif c == "4":
            save_state(state); print("Saved. Goodbye."); sys.exit(0)

def main():
    s = load_state()
    # Resolve path relative to this file’s directory
    node_dir = os.path.dirname(__file__)
    story_path = os.path.join(node_dir, "story.md")
    sections = read_sections(story_path)

    while True:
        print("\n# Rhythm — The Pulse Room\nPlay a note:")
        for k in "12345678":
            print(f"{k}. {CHOICES[k]}")
        pick = input("> ").strip()
        if pick not in CHOICES:
            print("Choose 1–8."); continue
        label = CHOICES[pick]
        if label == "Meditate":
            meditate(s); continue
        s["notes_played"].append(label)
        s["faculties"]["comprehension"] = s["faculties"].get("comprehension", 0) + 1
        save_state(s)
        print(f"\n[{label}]\n{sections.get(label, '')}\n(Progress saved.)")

if __name__ == "__main__":
    main()
