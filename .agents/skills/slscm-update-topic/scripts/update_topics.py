#!/usr/bin/env python3
"""
update_topics.py — Research Pillars and Topic Taxonomy Manager for SLSCM Lab.

Manages:
1. Supabase public.research_pillars table
2. SQLite database/slscm.sqlite
3. web/src/data/research_keywords.json
4. web/src/pages/ResearchTopicsPage.tsx topicIntroductions & areas
5. Build artifacts regeneration via database/scripts/export_data.py

Usage:
    python3 update_topics.py --list
    python3 update_topics.py \
      --pillar "supply_chain_optimization" \
      --topic-id "minimum-spanning-tree" \
      --topic-label "Minimum Spanning Tree" \
      --description "Finding minimum-weight trees connecting network nodes with exact and heuristic methods." \
      [--dry-run]
"""

import argparse
import datetime
import json
import os
import re
import sqlite3
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, "..", "..", "..", ".."))
DATABASE_DIR = os.path.join(ROOT_DIR, "database")
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
WEB_DIR = os.path.join(ROOT_DIR, "web")
KEYWORDS_JSON_PATH = os.path.join(WEB_DIR, "src", "data", "research_keywords.json")
TOPICS_PAGE_PATH = os.path.join(WEB_DIR, "src", "pages", "ResearchTopicsPage.tsx")
SUPABASE_DIR = os.path.join(ROOT_DIR, "supabase")
MIGRATIONS_DIR = os.path.join(SUPABASE_DIR, "migrations")

def list_topics():
    conn = sqlite3.connect(SQLITE_PATH)
    c = conn.cursor()
    c.execute("SELECT id, title, topics FROM research_pillars ORDER BY display_order ASC")
    rows = c.fetchall()
    print("\n🏛️  SLSCM Lab Research Pillars & Core Topics:")
    print("=" * 70)
    for pid, title, topics_json in rows:
        topics = json.loads(topics_json) if topics_json else []
        print(f"\n[{pid}] {title}")
        for t in topics:
            print(f"  • {t}")
    print("\n" + "=" * 70)

def add_topic(pillar_id: str, topic_id: str, topic_label: str, description: str, dry_run=False):
    print(f"\n[*] Adding topic '{topic_label}' ({topic_id}) to pillar '{pillar_id}'...")

    # 1. Update research_keywords.json
    if os.path.exists(KEYWORDS_JSON_PATH):
        with open(KEYWORDS_JSON_PATH, "r", encoding="utf-8") as f:
            keywords = json.load(f)
        if not any(k["id"] == topic_id for k in keywords):
            keywords.append({
                "id": topic_id,
                "label": topic_label,
                "kind": "topic"
            })
            if not dry_run:
                with open(KEYWORDS_JSON_PATH, "w", encoding="utf-8") as f:
                    json.dump(keywords, f, indent=2, ensure_ascii=False)
                    f.write("\n")
                print(f"  ✅ Added to {KEYWORDS_JSON_PATH}")

    # 2. Update ResearchTopicsPage.tsx
    if os.path.exists(TOPICS_PAGE_PATH):
        with open(TOPICS_PAGE_PATH, "r", encoding="utf-8") as f:
            code = f.read()

        # Add to areas if not present
        if f"'{topic_id}'" not in code:
            pattern = re.compile(rf"(id:\s*'{pillar_id}',\s*topics:\s*\[)([^\]]+)(\])", re.DOTALL)
            m = pattern.search(code)
            if m:
                existing_topics = m.group(2).strip()
                updated_topics = f"{existing_topics}\n      '{topic_id}',"
                code = code[:m.start(2)] + updated_topics + code[m.end(2):]
                print(f"  ✅ Added topic slug to ResearchTopicsPage.tsx areas")

        # Add description to topicIntroductions
        if f"'{topic_id}':" not in code and description:
            intro_marker = "const topicIntroductions: Record<string, string> = {"
            if intro_marker in code:
                idx = code.find(intro_marker) + len(intro_marker)
                desc_escaped = description.replace("'", "\\'")
                insertion = f"\n  '{topic_id}': '{desc_escaped}',"
                code = code[:idx] + insertion + code[idx:]
                print(f"  ✅ Added introduction to ResearchTopicsPage.tsx topicIntroductions")

        if not dry_run:
            with open(TOPICS_PAGE_PATH, "w", encoding="utf-8") as f:
                f.write(code)

    # 3. Update SQLite and Supabase
    conn = sqlite3.connect(SQLITE_PATH)
    c = conn.cursor()
    c.execute("SELECT topics FROM research_pillars WHERE id = ?", (pillar_id,))
    row = c.fetchone()
    if row:
        curr_topics = json.loads(row[0]) if row[0] else []
        if topic_label not in curr_topics:
            curr_topics.append(topic_label)
            if not dry_run:
                c.execute("UPDATE research_pillars SET topics = ? WHERE id = ?", (json.dumps(curr_topics), pillar_id))
                conn.commit()
                print(f"  ✅ Updated SQLite research_pillars")

                # Generate Supabase Migration
                now_ts = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
                mig_path = os.path.join(MIGRATIONS_DIR, f"{now_ts}_update_{pillar_id}_topics.sql")
                topics_esc = json.dumps(curr_topics).replace("'", "''")
                mig_sql = f"""UPDATE public.research_pillars
SET topics = '{topics_esc}'::jsonb
WHERE id = '{pillar_id}';
"""
                with open(mig_path, "w", encoding="utf-8") as f:
                    f.write(mig_sql)
                print(f"  ✅ Created migration: {mig_path}")

                # Push via Supabase CLI
                subprocess.run(["supabase", "db", "push", "--linked"], cwd=ROOT_DIR, check=False)

    # 4. Export build artifacts
    if not dry_run:
        export_script = os.path.join(DATABASE_DIR, "scripts", "export_data.py")
        subprocess.run([sys.executable, export_script], cwd=ROOT_DIR, check=True)
        print("\n🎉 Topic successfully added across monorepo and database!")

def main():
    parser = argparse.ArgumentParser(description="Manage Research Pillars & Topics for SLSCM Lab")
    parser.add_argument("--list", action="store_true", help="List existing research pillars and topics")
    parser.add_argument("--pillar", choices=["supply_chain_optimization", "ai_supply_chain_intelligence", "decision_analytics"], help="Pillar ID")
    parser.add_argument("--topic-id", help="Topic kebab-case ID (e.g. minimum-spanning-tree)")
    parser.add_argument("--topic-label", help="Topic human-readable label (e.g. Minimum Spanning Tree)")
    parser.add_argument("--description", default="", help="Short English introduction for topic card")
    parser.add_argument("--dry-run", action="store_true", help="Preview only, do not write")
    args = parser.parse_args()

    if args.list or not args.pillar:
        list_topics()
        return

    if not args.topic_id or not args.topic_label:
        print("Error: --topic-id and --topic-label are required when updating a pillar.")
        sys.exit(1)

    add_topic(args.pillar, args.topic_id, args.topic_label, args.description, args.dry_run)

if __name__ == "__main__":
    main()
