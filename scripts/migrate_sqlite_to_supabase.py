#!/usr/bin/env python3
"""
migrate_sqlite_to_supabase.py
Reads all relational data from database/slscm.sqlite, generates clean,
PostgreSQL-compliant SQL inserts with proper type mapping, and prepares
it for execution against remote Supabase.
"""

import sqlite3
import json
import os
import sys

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SQLITE_PATH = os.path.join(BASE_DIR, "database", "slscm.sqlite")
OUTPUT_SQL_PATH = os.path.join(BASE_DIR, "supabase", "seed_data.sql")

TABLE_ORDER = [
    "institutions",
    "research_pillars",
    "people",
    "person_research_interests",
    "person_featured_publications",
    "publications",
    "publication_authors",
    "projects",
    "project_leads",
    "project_publications",
    "project_outcomes",
    "project_tags",
    "project_pillars",
    "project_curriculum",
    "seminars",
    "seminar_topics",
    "events",
    "event_tags",
    "achievements",
    "global_academic_partners",
    "social_posts",
    "lab_overview",
]

BOOLEAN_COLUMNS = {
    "publications": ["is_featured"],
    "publication_authors": ["is_highlighted"],
    "seminars": ["slides_available", "recording_available"],
    "events": ["featured"],
    "achievements": ["featured"],
}

JSONB_COLUMNS = {
    "research_pillars": ["topics", "featured_venues"],
    "publications": ["keywords"],
    "social_posts": ["authors"],
}

def escape_sql_val(table, col, val):
    if val is None or val == "":
        if col.endswith("_id") or col in ("related_paper_id", "related_project_id", "speaker_person_id"):
            return "NULL"
    if val is None:
        return "NULL"
    
    # Check booleans
    if table in BOOLEAN_COLUMNS and col in BOOLEAN_COLUMNS[table]:
        return "true" if val in (1, True, "1", "true") else "false"

    # Check JSONB
    if table in JSONB_COLUMNS and col in JSONB_COLUMNS[table]:
        if isinstance(val, str):
            try:
                parsed = json.loads(val)
                serialized = json.dumps(parsed).replace("'", "''")
                return f"'{serialized}'::jsonb"
            except Exception:
                serialized = val.replace("'", "''")
                return f"'{serialized}'::jsonb"
        else:
            serialized = json.dumps(val).replace("'", "''")
            return f"'{serialized}'::jsonb"

    if isinstance(val, (int, float)):
        return str(val)

    # String escaping
    escaped_str = str(val).replace("'", "''")
    return f"'{escaped_str}'"

def main():
    if not os.path.exists(SQLITE_PATH):
        print(f"Error: SQLite database not found at {SQLITE_PATH}")
        sys.exit(1)

    conn = sqlite3.connect(SQLITE_PATH)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- SLSCM Lab — Automated Seed Data Export for Supabase")
    sql_statements.append("-- Generated from authoritative database/slscm.sqlite")
    sql_statements.append("-- ==============================================================================\n")
    sql_statements.append("BEGIN;\n")

    total_rows = 0

    for table in TABLE_ORDER:
        cursor.execute(f"PRAGMA table_info({table})")
        columns = [row["name"] for row in cursor.fetchall()]
        
        cursor.execute(f"SELECT * FROM {table}")
        rows = cursor.fetchall()
        
        if not rows:
            continue

        print(f"• Exporting {table:30} ({len(rows)} rows)")
        sql_statements.append(f"-- ------------------------------------------------------------------------------")
        sql_statements.append(f"-- Table: {table} ({len(rows)} rows)")
        sql_statements.append(f"-- ------------------------------------------------------------------------------")
        
        col_list = ", ".join(f'"{c}"' for c in columns)
        
        # Batch insert chunks of 50
        chunk_size = 50
        for i in range(0, len(rows), chunk_size):
            chunk = rows[i:i + chunk_size]
            value_rows = []
            for r in chunk:
                vals = [escape_sql_val(table, c, r[c]) for c in columns]
                value_rows.append(f"({', '.join(vals)})")
            
            insert_stmt = f"INSERT INTO public.{table} ({col_list})\nVALUES\n  " + ",\n  ".join(value_rows) + "\nON CONFLICT DO NOTHING;\n"
            sql_statements.append(insert_stmt)
            total_rows += len(chunk)

    sql_statements.append("COMMIT;\n")

    os.makedirs(os.path.dirname(OUTPUT_SQL_PATH), exist_ok=True)
    with open(OUTPUT_SQL_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_statements))

    print("----------------------------------------------------------------------")
    print(f"✅ Generated {total_rows} total rows in {OUTPUT_SQL_PATH}")

if __name__ == "__main__":
    main()
