#!/usr/bin/env python3
"""
add_brief.py — Automated News Brief and Announcement Publisher for SLSCM Lab.

Handles bilingual content creation, Supabase migration generation,
SQLite sync, social posts digest, and frontend static datasets export.

Usage:
    python3 add_brief.py \
      --id "brief-name-year" \
      --title "Title in English" \
      --title-vi "Tiêu đề tiếng Việt" \
      --date "YYYY-MM-DD" \
      --category "Scientific Breakthrough" \
      --badge "Badge Name" \
      --summary "Short 1-2 sentence summary" \
      --summary-vi "Tóm tắt 1-2 câu tiếng Việt" \
      --content "Detailed multi-paragraph markdown content" \
      --content-vi "Nội dung chi tiết tiếng Việt" \
      --tags "Tag1,Tag2,Tag3" \
      --link "https://..." \
      --link-label "Read More" \
      [--featured] [--dry-run]
"""

import argparse
import datetime
import json
import os
import sqlite3
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, "..", "..", "..", ".."))
DATABASE_DIR = os.path.join(ROOT_DIR, "database")
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
WEB_DIR = os.path.join(ROOT_DIR, "web")
SUPABASE_DIR = os.path.join(ROOT_DIR, "supabase")
MIGRATIONS_DIR = os.path.join(SUPABASE_DIR, "migrations")

def main():
    parser = argparse.ArgumentParser(description="Add News Brief / Announcement to SLSCM Lab")
    parser.add_argument("--id", required=True, help="Unique kebab-case brief ID (e.g. brief-comosa-2026-acceptance)")
    parser.add_argument("--title", required=True, help="Brief title in English")
    parser.add_argument("--title-vi", default="", help="Brief title in Vietnamese")
    parser.add_argument("--date", default=datetime.date.today().isoformat(), help="Event / announcement date (YYYY-MM-DD)")
    parser.add_argument("--category", default="Scientific Breakthrough", help="Category (e.g. Scientific Breakthrough, Workshops & Training, Student Honor & Placement)")
    parser.add_argument("--category-vi", default="", help="Category in Vietnamese")
    parser.add_argument("--badge", default="", help="Badge displayed on card")
    parser.add_argument("--summary", required=True, help="Brief summary in English")
    parser.add_argument("--summary-vi", default="", help="Brief summary in Vietnamese")
    parser.add_argument("--content", default="", help="Full detailed content in English")
    parser.add_argument("--content-vi", default="", help="Full detailed content in Vietnamese")
    parser.add_argument("--tags", default="", help="Comma-separated list of tags")
    parser.add_argument("--link", default="", help="External URL or DOI link")
    parser.add_argument("--link-label", default="View Details", help="Call to action button text")
    parser.add_argument("--featured", action="store_true", help="Feature prominently on Homepage")
    parser.add_argument("--dry-run", action="store_true", help="Preview only, do not write")
    args = parser.parse_args()

    tags_list = [t.strip() for t in args.tags.split(",") if t.strip()]
    now_ts = datetime.datetime.now().strftime("%Y%m%d%H%M%S")

    print("\n======================================================================")
    print(f"📢 Brief ID       : {args.id}")
    print(f"📅 Date           : {args.date}")
    print(f"🏷️ Category / Badge: {args.category} [{args.badge}]")
    print(f"📌 Title (EN)     : {args.title}")
    if args.title_vi:
        print(f"🇻🇳 Title (VI)     : {args.title_vi}")
    print(f"🏷️ Tags           : {', '.join(tags_list)}")
    print(f"🌟 Featured       : {args.featured}")
    print("======================================================================\n")

    if args.dry_run:
        print("[DRY RUN] Preview completed. No database or files modified.")
        return

    # 1. Supabase Migration
    mig_filename = f"{now_ts}_add_{args.id.replace('-', '_')}.sql"
    mig_path = os.path.join(MIGRATIONS_DIR, mig_filename)

    title_esc = args.title.replace("'", "''")
    title_vi_esc = args.title_vi.replace("'", "''")
    cat_esc = args.category.replace("'", "''")
    cat_vi_esc = (args.category_vi or args.category).replace("'", "''")
    badge_esc = args.badge.replace("'", "''")
    sum_esc = args.summary.replace("'", "''")
    sum_vi_esc = (args.summary_vi or args.summary).replace("'", "''")
    content_esc = (args.content or args.summary).replace("'", "''")
    content_vi_esc = (args.content_vi or args.summary_vi or args.summary).replace("'", "''")
    link_esc = args.link.replace("'", "''")
    link_label_esc = args.link_label.replace("'", "''")

    tags_sql = []
    for t in tags_list:
        t_esc = t.replace("'", "''")
        tags_sql.append(f"  ('{args.id}', '{t_esc}')")

    mig_sql = f"""-- Add Event Brief: {title_esc}
INSERT INTO public.events (
  id, title, title_vi, event_date, category, category_vi, badge,
  summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured
)
VALUES (
  '{args.id}',
  '{title_esc}',
  '{title_vi_esc}',
  '{args.date}',
  '{cat_esc}',
  '{cat_vi_esc}',
  '{badge_esc}',
  '{sum_esc}',
  '{sum_esc}',
  '{sum_vi_esc}',
  '{content_esc}',
  '{content_vi_esc}',
  '{link_esc}',
  '{link_label_esc}',
  {'true' if args.featured else 'false'}
)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  title_vi = EXCLUDED.title_vi,
  event_date = EXCLUDED.event_date,
  category = EXCLUDED.category,
  category_vi = EXCLUDED.category_vi,
  badge = EXCLUDED.badge,
  summary = EXCLUDED.summary,
  summary_en = EXCLUDED.summary_en,
  summary_vi = EXCLUDED.summary_vi,
  content_en = EXCLUDED.content_en,
  content_vi = EXCLUDED.content_vi,
  link = EXCLUDED.link,
  link_label = EXCLUDED.link_label,
  featured = EXCLUDED.featured;

DELETE FROM public.event_tags WHERE event_id = '{args.id}';
"""
    if tags_sql:
        mig_sql += f"""
INSERT INTO public.event_tags (event_id, tag)
VALUES
{',\n'.join(tags_sql)}
ON CONFLICT (event_id, tag) DO NOTHING;
"""

    with open(mig_path, "w", encoding="utf-8") as f:
        f.write(mig_sql)
    print(f"[*] Generated Supabase migration: {mig_path}")

    # Push to Supabase via Supabase CLI
    print("[*] Pushing migration to remote Supabase via Supabase CLI...")
    res = subprocess.run(["supabase", "db", "push", "--linked"], cwd=ROOT_DIR, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"[!] Warning: supabase db push: {res.stderr or res.stdout}")
    else:
        print("✅ Pushed migration to remote Supabase successfully!")

    # 2. Update SQLite
    print("[*] Updating SQLite database (database/slscm.sqlite)...")
    conn = sqlite3.connect(SQLITE_PATH)
    c = conn.cursor()
    c.execute("""
    INSERT INTO events (
      id, title, title_vi, event_date, category, category_vi, badge,
      summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ON CONFLICT(id) DO UPDATE SET
      title=excluded.title, title_vi=excluded.title_vi, event_date=excluded.event_date,
      category=excluded.category, category_vi=excluded.category_vi, badge=excluded.badge,
      summary=excluded.summary, summary_en=excluded.summary_en, summary_vi=excluded.summary_vi,
      content_en=excluded.content_en, content_vi=excluded.content_vi, link=excluded.link,
      link_label=excluded.link_label, featured=excluded.featured
    """, (
        args.id, args.title, args.title_vi, args.date, args.category, args.category_vi or args.category,
        args.badge, args.summary, args.summary, args.summary_vi or args.summary,
        args.content or args.summary, args.content_vi or args.summary_vi or args.summary,
        args.link, args.link_label, 1 if args.featured else 0
    ))
    c.execute("DELETE FROM event_tags WHERE event_id = ?", (args.id,))
    for t in tags_list:
        c.execute("INSERT INTO event_tags (event_id, tag) VALUES (?, ?)", (args.id, t))
    conn.commit()

    # 3. Export generated JSON build artifacts
    export_script = os.path.join(DATABASE_DIR, "scripts", "export_data.py")
    if os.path.exists(export_script):
        print("[*] Rebuilding generated frontend JSON datasets...")
        subprocess.run([sys.executable, export_script], cwd=ROOT_DIR, check=True)

    print("\n🎉 News Brief successfully published and synchronized!")

if __name__ == "__main__":
    main()
