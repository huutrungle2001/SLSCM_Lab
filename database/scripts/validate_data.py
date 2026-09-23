#!/usr/bin/env python3
"""
validate_data.py — Rigorous Data Validation for SLSCM Lab SQLite Database.
Verifies integrity, foreign keys, uniqueness, required fields, and asset paths.
"""

import os
import sqlite3
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
ROOT_DIR = os.path.abspath(os.path.join(DATABASE_DIR, ".."))
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
PUBLIC_DIR = os.path.join(ROOT_DIR, "web", "public")

def main():
    print("======================================================================")
    print("🔍 SLSCM Lab: Database Integrity & Validation Gatekeeper")
    print("======================================================================")
    print(f"Inspecting: {SQLITE_PATH}")

    if not os.path.exists(SQLITE_PATH):
        print(f"❌ Error: Database file not found at {SQLITE_PATH}")
        sys.exit(1)

    conn = sqlite3.connect(SQLITE_PATH)
    conn.execute("PRAGMA foreign_keys = ON;")
    cursor = conn.cursor()

    errors = []
    warnings = []

    # 1. Foreign Key Integrity Check
    cursor.execute("PRAGMA foreign_key_check;")
    fk_violations = cursor.fetchall()
    if fk_violations:
        for row in fk_violations:
            errors.append(f"Foreign key violation in table '{row[0]}', rowid {row[1]}, target table '{row[2]}', FK index {row[3]}")
    else:
        print("  ✅ PRAGMA foreign_key_check passed (No orphan references)")

    # 2. Check Primary Key Uniqueness on core entities
    core_tables = ["people", "publications", "projects", "seminars", "events", "achievements", "institutions", "research_pillars"]
    for table in core_tables:
        cursor.execute(f"SELECT id, COUNT(*) FROM {table} GROUP BY id HAVING COUNT(*) > 1")
        dupes = cursor.fetchall()
        if dupes:
            for d in dupes:
                errors.append(f"Duplicate primary key '{d[0]}' in table '{table}' (count: {d[1]})")
        else:
            print(f"  ✅ Stable IDs unique in '{table}'")

    # 3. Check Required Fields
    # Publications: title, year, venue, type
    cursor.execute("SELECT id FROM publications WHERE title IS NULL OR title = '' OR year IS NULL OR venue IS NULL OR type IS NULL")
    bad_pubs = cursor.fetchall()
    if bad_pubs:
        for p in bad_pubs:
            errors.append(f"Publication '{p[0]}' missing required fields (title, year, venue, type)")

    # People: name, category
    cursor.execute("SELECT id FROM people WHERE name IS NULL OR name = '' OR category IS NULL OR category = ''")
    bad_people = cursor.fetchall()
    if bad_people:
        for p in bad_people:
            errors.append(f"Person '{p[0]}' missing required fields (name, category)")

    # Events: title, event_date, category
    cursor.execute("SELECT id FROM events WHERE title IS NULL OR title = '' OR event_date IS NULL OR category IS NULL")
    bad_events = cursor.fetchall()
    if bad_events:
        for e in bad_events:
            errors.append(f"Event '{e[0]}' missing required fields (title, event_date, category)")

    # Seminars: title, date, speaker, venue
    cursor.execute("SELECT id FROM seminars WHERE title IS NULL OR title = '' OR date IS NULL OR speaker IS NULL OR venue IS NULL")
    bad_seminars = cursor.fetchall()
    if bad_seminars:
        for s in bad_seminars:
            errors.append(f"Seminar '{s[0]}' missing required fields (title, date, speaker, venue)")

    # 4. Check Duplicate DOI (excluding empty)
    cursor.execute("SELECT doi, COUNT(*) FROM publications WHERE doi IS NOT NULL AND doi != '' GROUP BY doi HAVING COUNT(*) > 1")
    dupe_dois = cursor.fetchall()
    if dupe_dois:
        for d in dupe_dois:
            warnings.append(f"Duplicate DOI detected: '{d[0]}' ({d[1]} occurrences)")
    else:
        print("  ✅ All DOIs are unique across publications")

    # 5. Asset Path Validation
    # Check people avatars
    cursor.execute("SELECT id, avatar FROM people WHERE avatar IS NOT NULL AND avatar != ''")
    for row in cursor.fetchall():
        pid, avatar = row
        if avatar.startswith("/"):
            local_path = os.path.join(PUBLIC_DIR, avatar.lstrip("/"))
            if not os.path.exists(local_path):
                warnings.append(f"Avatar image not found for person '{pid}': {avatar} -> {local_path}")

    # Check achievements avatars
    cursor.execute("SELECT id, avatar FROM achievements WHERE avatar IS NOT NULL AND avatar != ''")
    for row in cursor.fetchall():
        aid, avatar = row
        if avatar.startswith("/"):
            local_path = os.path.join(PUBLIC_DIR, avatar.lstrip("/"))
            if not os.path.exists(local_path):
                warnings.append(f"Avatar image not found for achievement '{aid}': {avatar}")

    conn.close()

    print("----------------------------------------------------------------------")
    if warnings:
        print(f"⚠️ {len(warnings)} WARNING(S) ENCOUNTERED:")
        for w in warnings:
            print(f"   [WARN] {w}")
    else:
        print("  ✅ Zero warnings encountered")

    if errors:
        print(f"\n❌ {len(errors)} ERROR(S) ENCOUNTERED (Validation Failed):")
        for e in errors:
            print(f"   [ERROR] {e}")
        print("======================================================================")
        sys.exit(1)

    print("✅ VALIDATION SUCCESS: Database is 100% compliant with specifications!")
    print("======================================================================\n")

if __name__ == "__main__":
    main()
