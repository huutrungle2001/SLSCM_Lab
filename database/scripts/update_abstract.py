#!/usr/bin/env python3
"""
update_abstract.py — Utility script to update publication abstracts in SLSCM Lab.
Supports updating via string, text file, or fetching automatically via DOI (Crossref / OpenAlex).
"""

import argparse
import html
import json
import os
import re
import sqlite3
import sys
import urllib.request

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")

def clean_jats_tags(text):
    if not text:
        return ""
    text = re.sub(r"<jats:[^>]+>", "", text)
    text = re.sub(r"</jats:[^>]+>", "", text)
    text = re.sub(r"<[^>]+>", "", text)
    text = html.unescape(text)
    return " ".join(text.split())

def fetch_abstract_from_doi(doi):
    print(f"🌐 Querying Crossref API for DOI: {doi}...")
    try:
        url = f"https://api.crossref.org/works/{doi}"
        req = urllib.request.Request(url, headers={"User-Agent": "SLSCMBot/1.0 (mailto:minhvd@neu.edu.vn)"})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode("utf-8"))
            abstract = data.get("message", {}).get("abstract")
            if abstract:
                return clean_jats_tags(abstract)
    except Exception as e:
        print(f"  ⚠️ Crossref query note: {e}")

    print(f"🌐 Querying OpenAlex API for DOI: {doi}...")
    try:
        url = f"https://api.openalex.org/works/doi:{doi}"
        req = urllib.request.Request(url, headers={"User-Agent": "SLSCMBot/1.0 (mailto:minhvd@neu.edu.vn)"})
        with urllib.request.urlopen(req, timeout=10) as response:
            data = json.loads(response.read().decode("utf-8"))
            inv_index = data.get("abstract_inverted_index")
            if inv_index:
                word_positions = [(pos, word) for word, positions in inv_index.items() for pos in positions]
                abstract = " ".join(word for _, word in sorted(word_positions))
                return abstract.strip()
    except Exception as e:
        print(f"  ⚠️ OpenAlex query note: {e}")

    return None

def main():
    parser = argparse.ArgumentParser(description="Update publication abstract in SQLite database.")
    parser.add_argument("--id", required=True, help="Publication ID (e.g. hong-2026-rvfstsp-trc, le-2026-cfl-ijoc)")
    parser.add_argument("--abstract", help="New abstract text string.")
    parser.add_argument("--file", help="Path to text file containing the new abstract.")
    parser.add_argument("--fetch-doi", action="store_true", help="Attempt to automatically fetch authentic abstract via paper's DOI.")

    args = parser.parse_args()

    if not os.path.exists(SQLITE_PATH):
        print(f"❌ Error: Database not found at {SQLITE_PATH}")
        sys.exit(1)

    conn = sqlite3.connect(SQLITE_PATH)
    cursor = conn.cursor()

    cursor.execute("SELECT id, title, doi, abstract FROM publications WHERE id = ?", (args.id,))
    row = cursor.fetchone()
    if not row:
        print(f"❌ Error: Publication with id '{args.id}' not found in database.")
        cursor.execute("SELECT id FROM publications LIMIT 10")
        print("Available publication IDs (first 10):")
        for p in cursor.fetchall():
            print(f"  - {p[0]}")
        sys.exit(1)

    paper_id, title, doi, current_abstract = row
    print(f"📄 Found Paper: [{paper_id}] {title}")
    if doi:
        print(f"🔗 DOI: {doi}")

    new_abstract = None

    if args.abstract:
        new_abstract = args.abstract.strip()
    elif args.file:
        if not os.path.exists(args.file):
            print(f"❌ Error: Abstract file not found at {args.file}")
            sys.exit(1)
        with open(args.file, "r", encoding="utf-8") as f:
            new_abstract = f.read().strip()
    elif args.fetch_doi:
        if not doi:
            print(f"❌ Error: Publication '{args.id}' has no registered DOI.")
            sys.exit(1)
        fetched = fetch_abstract_from_doi(doi)
        if fetched:
            new_abstract = fetched
        else:
            print("❌ Failed to automatically retrieve abstract via DOI APIs.")
            sys.exit(1)
    else:
        print("❌ Error: Must provide either --abstract, --file, or --fetch-doi.")
        sys.exit(1)

    # Perform update
    cursor.execute("UPDATE publications SET abstract = ? WHERE id = ?", (new_abstract, args.id))
    conn.commit()
    conn.close()

    print(f"\n✅ Successfully updated abstract for '{args.id}' ({len(new_abstract)} characters)!")
    print("\n💡 NEXT STEP: Run the following command to update the frontend build artifacts:")
    print("   npm run data:generate")

if __name__ == "__main__":
    main()
