#!/usr/bin/env python3
"""Validate Killercoda course manifests, referenced files and Bash scripts."""
from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COURSE = ROOT / "01-linux"


def main() -> int:
    errors: list[str] = []
    structure_file = COURSE / "structure.json"
    try:
        structure = json.loads(structure_file.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        print(f"Invalid course structure: {exc}")
        return 1

    items = structure.get("items", [])
    if len(items) != 34:
        errors.append(f"Expected 34 lessons, found {len(items)}")
    slugs = [entry.get("path") for entry in items]
    if len(slugs) != len(set(slugs)):
        errors.append("Duplicate lesson paths in structure.json")

    total_steps = 0
    checked_bash = 0
    for slug in slugs:
        if not isinstance(slug, str) or "/" in slug or slug.startswith("."):
            errors.append(f"Unsafe or invalid slug: {slug!r}")
            continue

        directory = COURSE / slug
        manifest_path = directory / "index.json"
        try:
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        except (OSError, ValueError) as exc:
            errors.append(f"{slug}: cannot read index.json: {exc}")
            continue

        if manifest.get("backend", {}).get("imageid") != "ubuntu":
            errors.append(f"{slug}: expected Ubuntu Killercoda backend")

        details = manifest.get("details", {})
        intro = details.get("intro", {})
        finish = details.get("finish", {})
        steps = details.get("steps", [])
        if not steps:
            errors.append(f"{slug}: no steps")
        total_steps += len(steps)

        references: set[str] = set()
        for section in [intro, finish, *steps]:
            if not isinstance(section, dict):
                errors.append(f"{slug}: invalid intro/step/finish entry")
                continue
            for key in ("text", "verify", "background", "foreground"):
                value = section.get(key)
                if value is None:
                    continue
                if not isinstance(value, str) or value.startswith("/") or ".." in Path(value).parts:
                    errors.append(f"{slug}: invalid path for {key}: {value!r}")
                    continue
                references.add(value)

        for reference in sorted(references):
            path = directory / reference
            if not path.is_file():
                errors.append(f"{slug}: missing referenced file {reference}")

        intro_path = directory / "intro.md"
        if intro_path.exists() and len(intro_path.read_text(encoding="utf-8")) < 800:
            errors.append(f"{slug}: theory too short (<800 characters)")

        for script in directory.rglob("*.sh"):
            result = subprocess.run(
                ["bash", "-n", str(script)],
                capture_output=True,
                text=True,
                check=False,
            )
            checked_bash += 1
            if result.returncode:
                errors.append(f"{slug}: Bash syntax {script.name}: {result.stderr.strip()}")

    if total_steps != 69:
        errors.append(f"Expected 69 practical steps, found {total_steps}")

    if errors:
        print("VALIDATION FAILED")
        for error in errors:
            print(" -", error)
        return 1

    print(f"VALIDATION OK: {len(slugs)} lessons, {total_steps} steps, {checked_bash} Bash scripts checked")
    return 0


if __name__ == "__main__":
    sys.exit(main())
