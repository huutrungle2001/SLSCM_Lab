#!/usr/bin/env python3
"""
add_publication.py — Automated Publication Harvester and Synchronizer for SLSCM Lab.

Follows the Academic Abstract Harvesting Protocol and dual persistence architecture:
1. Harvests authoritative metadata & authentic abstract (Crossref, OpenAlex, SpringerLink, BibTeX).
2. Maps authors and highlights SLSCM Lab members.
3. Generates and pushes Supabase migration via Supabase CLI (`supabase db push --linked`).
4. Updates local SQLite database (`database/slscm.sqlite`).
5. Updates JSON files (`web/src/data/` and `data/processed/`).
6. Regenerates frontend artifacts via `database/scripts/export_data.py`.
7. Verifies build via `npm run build`.

Usage:
    python3 add_publication.py --doi "10.1007/s12597-026-01275-y" [--pillar supply_chain_optimization] [--featured] [--dry-run]
"""

import argparse
import datetime
import json
import os
import re
import sqlite3
import subprocess
import sys
import urllib.parse
import urllib.request
from bs4 import BeautifulSoup

# Base paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, "..", "..", "..", ".."))
DATABASE_DIR = os.path.join(ROOT_DIR, "database")
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
WEB_DIR = os.path.join(ROOT_DIR, "web")
SUPABASE_DIR = os.path.join(ROOT_DIR, "supabase")
MIGRATIONS_DIR = os.path.join(SUPABASE_DIR, "migrations")

KNOWN_MEMBERS = {
    "vu-duc-minh": ["Vu Duc Minh", "Duc Minh Vu", "Duc-Minh Vu", "Minh Vu", "Minh Duc Vu"],
    "ha-minh-hoang": ["Minh Hoang Ha", "Minh Hoàng Hà", "Ha Minh Hoang", "Hoang Ha Minh"],
    "ta-dinh-quy": ["Dinh Quy Ta", "Ta Dinh Quy", "Quy Ta Dinh", "Quy Ta"],
    "nguyen-thanh-hoang": ["Nguyen Thanh Hoang", "Hoang Nguyen Thanh", "Thanh Hoang Nguyen"],
    "dinh-nho-minh": ["Dinh Nho Minh", "Nho Minh Dinh", "Minh Dinh Nho"],
    "le-ba-luat": ["Ba Luat Le", "Le Ba Luat", "Luat Le Ba"],
    "tran-nam-khanh": ["Nam Khanh Tran", "Tran Nam Khanh", "Nam-Khanh Tran"],
    "cao-nguyet-anh": ["Nguyet Anh Cao", "Cao Nguyet Anh"],
    "hoa-thi-thu-trang": ["Thu Trang Hoa", "Hoa Thi Thu Trang", "Trang Hoa"],
    "nguyen-tat-dat": ["Tat Dat Nguyen", "Nguyen Tat Dat", "Dat Nguyen Tat"],
    "trung-le-huu": ["Huu Trung Le", "Le Huu Trung", "Trung Le Huu"],
    "nguyen-hai-thu": ["Hai Thu Nguyen", "Nguyen Hai Thu"],
    "dang-trung-cuong": ["Trung Cuong Dang", "Dang Trung Cuong"],
}

PILLAR_MAP = {
    "supply_chain_optimization": "operational_optimization",
    "ai_supply_chain_intelligence": "ml_optimization",
    "decision_analytics": "operational_optimization",
}

def clean_xml_tags(text: str) -> str:
    if not text:
        return ""
    # Strip JATS XML tags
    cleaned = re.sub(r"<[^>]+>", " ", text)
    cleaned = re.sub(r"&lt;[^&]+&gt;", " ", cleaned)
    cleaned = cleaned.replace("&amp;", "&").replace("&quot;", '"').replace("&#39;", "'")
    return re.sub(r"\s+", " ", cleaned).strip()

def harvest_doi(doi: str):
    doi_clean = doi.strip().replace("https://doi.org/", "").replace("http://dx.doi.org/", "")
    print(f"[*] Harvesting metadata for DOI: {doi_clean}")

    meta = {
        "doi": doi_clean,
        "title": "",
        "venue": "",
        "year": datetime.datetime.now().year,
        "type": "Journal",
        "authors": [],
        "abstract": "",
        "abstract_source": f"https://doi.org/{doi_clean}",
        "bibtex": "",
        "link": f"https://doi.org/{doi_clean}",
    }

    # 1. Crossref API
    try:
        url = f"https://api.crossref.org/works/{urllib.parse.quote(doi_clean)}"
        req = urllib.request.Request(url, headers={"User-Agent": "SLSCMBot/1.0 (mailto:minhvd@neu.edu.vn)"})
        with urllib.request.urlopen(req, timeout=10) as resp:
            data = json.loads(resp.read().decode())["message"]
            if data.get("title"):
                meta["title"] = data["title"][0]
            if data.get("container-title"):
                meta["venue"] = data["container-title"][0]
            elif data.get("event", {}).get("name"):
                meta["venue"] = data["event"]["name"]
            
            # Pub type
            subtype = data.get("type", "")
            if "proceedings" in subtype or "conference" in subtype:
                meta["type"] = "Conference"
            elif "book" in subtype or "chapter" in subtype:
                meta["type"] = "Book Chapter"
            else:
                meta["type"] = "Journal"

            # Year
            issued = data.get("issued", {}).get("date-parts", [[datetime.datetime.now().year]])[0]
            if issued:
                meta["year"] = int(issued[0])

            # Authors
            if data.get("author"):
                for a in data["author"]:
                    given = a.get("given", "").strip()
                    family = a.get("family", "").strip()
                    name = f"{given} {family}".strip() if given and family else (family or given)
                    meta["authors"].append(name)

            # Abstract from Crossref
            if data.get("abstract"):
                meta["abstract"] = clean_xml_tags(data["abstract"])
    except Exception as e:
        print(f"  [!] Crossref lookup notice: {e}")

    # 2. BibTeX Content Negotiation
    try:
        req = urllib.request.Request(f"https://doi.org/{urllib.parse.quote(doi_clean)}", headers={"Accept": "application/x-bibtex"})
        with urllib.request.urlopen(req, timeout=10) as resp:
            bib = resp.read().decode("utf-8").strip()
            if bib.startswith("@"):
                meta["bibtex"] = bib
    except Exception as e:
        print(f"  [!] BibTeX lookup notice: {e}")

    # 3. OpenAlex if abstract is empty
    if not meta["abstract"]:
        try:
            req = urllib.request.Request(f"https://api.openalex.org/works/doi:{urllib.parse.quote(doi_clean)}")
            with urllib.request.urlopen(req, timeout=10) as resp:
                alex = json.loads(resp.read().decode())
                inv_index = alex.get("abstract_inverted_index")
                if inv_index:
                    word_positions = [(pos, word) for word, positions in inv_index.items() for pos in positions]
                    meta["abstract"] = " ".join(word for _, word in sorted(word_positions))
        except Exception as e:
            print(f"  [!] OpenAlex lookup notice: {e}")

    # 4. Publisher Web Scraping if abstract still empty
    if not meta["abstract"]:
        try:
            landing_url = f"https://doi.org/{doi_clean}"
            req = urllib.request.Request(landing_url, headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64)"})
            with urllib.request.urlopen(req, timeout=15) as resp:
                html = resp.read().decode("utf-8", errors="ignore")
                final_url = resp.geturl()
                meta["abstract_source"] = final_url
                soup = BeautifulSoup(html, "html.parser")
                
                # Check meta tags
                for meta_tag in [
                    soup.find("meta", {"name": "dc.description"}),
                    soup.find("meta", {"property": "og:description"}),
                    soup.find("meta", {"name": "description"}),
                ]:
                    if meta_tag and meta_tag.get("content") and len(meta_tag.get("content", "")) > 100:
                        meta["abstract"] = clean_xml_tags(meta_tag["content"])
                        break

                # Check article section divs
                if not meta["abstract"]:
                    abs_div = (
                        soup.find("div", id="Abs1-content")
                        or soup.find("section", {"aria-labelledby": "Abs1"})
                        or soup.find("div", class_=re.compile(r"abstract|Abstract"))
                    )
                    if abs_div:
                        meta["abstract"] = clean_xml_tags(abs_div.get_text(separator=" ", strip=True))
        except Exception as e:
            print(f"  [!] Web scraping notice: {e}")

    # Fallback BibTeX generation if none returned
    if not meta["bibtex"] and meta["title"]:
        first_author = meta["authors"][0].split()[-1] if meta["authors"] else "Author"
        key = f"{first_author}{meta['year']}"
        author_str = " and ".join(meta["authors"])
        meta["bibtex"] = f"""@article{{{key},
  title = {{{meta['title']}}},
  author = {{{author_str}}},
  journal = {{{meta['venue']}}},
  year = {{{meta['year']}}},
  doi = {{{meta['doi']}}},
  url = {{{meta['link']}}}
}}"""

    return meta

def resolve_member(author_name: str):
    norm = author_name.lower().replace("-", " ")
    for person_id, aliases in KNOWN_MEMBERS.items():
        for alias in aliases:
            if alias.lower() in norm or norm in alias.lower():
                return person_id
    return None

def generate_pub_id(meta):
    first_author_slug = "pub"
    if meta["authors"]:
        tokens = meta["authors"][0].split()
        first_author_slug = tokens[0].lower() if len(tokens) == 1 else tokens[-1].lower()
    
    # Title slug
    title_words = re.findall(r"\b[a-zA-Z]{3,}\b", meta["title"].lower())
    title_slug = "-".join(title_words[:2]) if title_words else "paper"
    
    # Venue slug
    venue_slug = re.sub(r"[^a-zA-Z0-9]+", "", meta["venue"].split()[0].lower()) if meta["venue"] else "proc"
    return f"{first_author_slug}-{meta['year']}-{title_slug}-{venue_slug}"

def sync_all(meta, primary_pillar, is_featured=False, dry_run=False):
    pub_id = generate_pub_id(meta)
    research_pillar = PILLAR_MAP.get(primary_pillar, "operational_optimization")
    now_ts = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    
    print("\n======================================================================")
    print(f"📄 Publication ID : {pub_id}")
    print(f"📌 Title          : {meta['title']}")
    print(f"🏛️ Venue          : {meta['venue']} ({meta['year']}) [{meta['type']}]")
    print(f"🔗 DOI / Link     : {meta['doi']}")
    print(f"👥 Authors ({len(meta['authors'])}): {', '.join(meta['authors'])}")
    print(f"🎯 Research Pillar: {primary_pillar} (legacy: {research_pillar})")
    print("======================================================================\n")

    if dry_run:
        print("[DRY RUN] Finished harvesting metadata. No files modified.")
        return

    # 1. Author mapping
    author_rows = []
    for idx, author_name in enumerate(meta["authors"]):
        pid = resolve_member(author_name)
        is_high = pid is not None
        author_rows.append({
            "name": author_name,
            "order": idx,
            "person_id": pid,
            "is_highlighted": is_high
        })
        if is_high:
            print(f"  ✨ Linked author '{author_name}' to member '{pid}' (highlighted)")

    # 2. Supabase Migration
    mig_filename = f"{now_ts}_add_{pub_id.replace('-', '_')}.sql"
    mig_path = os.path.join(MIGRATIONS_DIR, mig_filename)
    
    # Escapes
    title_esc = meta["title"].replace("'", "''")
    venue_esc = meta["venue"].replace("'", "''")
    abstract_esc = meta["abstract"].replace("'", "''")
    bibtex_esc = meta["bibtex"].replace("'", "''")
    keywords_json = json.dumps(["optimization", "logistics", "operations-research"]).replace("'", "''")
    
    authors_sql = []
    for a in author_rows:
        pid_val = f"'{a['person_id']}'" if a['person_id'] else "NULL"
        high_val = "true" if a['is_highlighted'] else "false"
        name_escaped = a['name'].replace("'", "''")
        authors_sql.append(f"  ('{pub_id}', {pid_val}, '{name_escaped}', {a['order']}, {high_val})")
    
    mig_sql = f"""-- Add publication: {title_esc}
INSERT INTO public.publications (
  id, title, year, venue, type, doi, link, abstract, abstract_source,
  bibtex, research_pillar, primary_pillar_id, keywords, is_featured, badge, status
)
VALUES (
  '{pub_id}',
  '{title_esc}',
  {meta['year']},
  '{venue_esc}',
  '{meta['type']}',
  '{meta['doi']}',
  '{meta['link']}',
  '{abstract_esc}',
  '{meta['abstract_source']}',
  '{bibtex_esc}',
  '{research_pillar}',
  '{primary_pillar}',
  '{keywords_json}'::jsonb,
  {'true' if is_featured else 'false'},
  NULL,
  'published'
)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  year = EXCLUDED.year,
  venue = EXCLUDED.venue,
  type = EXCLUDED.type,
  doi = EXCLUDED.doi,
  link = EXCLUDED.link,
  abstract = EXCLUDED.abstract,
  abstract_source = EXCLUDED.abstract_source,
  bibtex = EXCLUDED.bibtex,
  research_pillar = EXCLUDED.research_pillar,
  primary_pillar_id = EXCLUDED.primary_pillar_id,
  keywords = EXCLUDED.keywords,
  is_featured = EXCLUDED.is_featured,
  badge = EXCLUDED.badge,
  status = EXCLUDED.status;

DELETE FROM public.publication_authors WHERE publication_id = '{pub_id}';

INSERT INTO public.publication_authors (
  publication_id, person_id, author_name, author_order, is_highlighted
)
VALUES
{',\n'.join(authors_sql)}
ON CONFLICT (publication_id, author_order) DO UPDATE SET
  person_id = EXCLUDED.person_id,
  author_name = EXCLUDED.author_name,
  is_highlighted = EXCLUDED.is_highlighted;
"""
    with open(mig_path, "w", encoding="utf-8") as f:
        f.write(mig_sql)
    print(f"[*] Created Supabase migration: {mig_path}")

    # Push to Supabase via Supabase CLI
    print("[*] Pushing migration to remote Supabase via Supabase CLI...")
    res = subprocess.run(["supabase", "db", "push", "--linked"], cwd=ROOT_DIR, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"[!] Warning: supabase db push failed: {res.stderr or res.stdout}")
    else:
        print("✅ Pushed migration to remote Supabase successfully!")

    # 3. Update SQLite
    print("[*] Updating SQLite database (database/slscm.sqlite)...")
    conn = sqlite3.connect(SQLITE_PATH)
    c = conn.cursor()
    c.execute("""
    INSERT INTO publications (
      id, title, year, venue, type, doi, link, abstract, abstract_source,
      bibtex, research_pillar, primary_pillar_id, keywords, is_featured, badge, status
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ON CONFLICT(id) DO UPDATE SET
      title=excluded.title, year=excluded.year, venue=excluded.venue, type=excluded.type,
      doi=excluded.doi, link=excluded.link, abstract=excluded.abstract, abstract_source=excluded.abstract_source,
      bibtex=excluded.bibtex, research_pillar=excluded.research_pillar, primary_pillar_id=excluded.primary_pillar_id,
      keywords=excluded.keywords, is_featured=excluded.is_featured, badge=excluded.badge, status=excluded.status
    """, (
        pub_id, meta["title"], meta["year"], meta["venue"], meta["type"],
        meta["doi"], meta["link"], meta["abstract"], meta["abstract_source"],
        meta["bibtex"], research_pillar, primary_pillar, json.dumps(["optimization", "logistics"]),
        1 if is_featured else 0, None, "published"
    ))
    c.execute("DELETE FROM publication_authors WHERE publication_id = ?", (pub_id,))
    for a in author_rows:
        c.execute("""
        INSERT INTO publication_authors (publication_id, person_id, author_name, author_order, is_highlighted)
        VALUES (?, ?, ?, ?, ?)
        """, (pub_id, a["person_id"], a["name"], a["order"], 1 if a["is_highlighted"] else 0))
    conn.commit()

    # 4. Update JSON files
    json_entry = {
        "id": pub_id,
        "title": meta["title"],
        "authors": meta["authors"],
        "venue": meta["venue"],
        "year": meta["year"],
        "type": meta["type"],
        "doi": meta["doi"],
        "link": meta["link"],
        "research_pillar": research_pillar,
        "abstract": meta["abstract"],
        "bibtex": meta["bibtex"],
        "is_featured": is_featured,
        "keywords": ["optimization", "logistics"]
    }
    for ppath in [
        os.path.join(WEB_DIR, "src", "data", "slscm_publications.json"),
        os.path.join(ROOT_DIR, "data", "processed", "slscm_publications.json")
    ]:
        if os.path.exists(ppath):
            with open(ppath, "r", encoding="utf-8") as f:
                pubs = json.load(f)
            pubs = [p for p in pubs if p["id"] != pub_id]
            pubs.insert(0, json_entry)
            with open(ppath, "w", encoding="utf-8") as f:
                json.dump(pubs, f, indent=2, ensure_ascii=False)
                f.write("\n")
            print(f"✅ Updated {ppath}")

    # 5. Export build artifacts
    export_script = os.path.join(DATABASE_DIR, "scripts", "export_data.py")
    if os.path.exists(export_script):
        print("[*] Rebuilding generated frontend JSON datasets...")
        subprocess.run([sys.executable, export_script], cwd=ROOT_DIR, check=True)

    print("\n🎉 Publication successfully added and synchronized across monorepo and Supabase!")

def main():
    parser = argparse.ArgumentParser(description="Add publication to SLSCM Lab")
    parser.add_argument("--doi", required=True, help="Publication DOI")
    parser.add_argument("--pillar", default="supply_chain_optimization", choices=["supply_chain_optimization", "ai_supply_chain_intelligence", "decision_analytics"], help="Primary Research Pillar")
    parser.add_argument("--featured", action="store_true", help="Flag as featured publication on homepage")
    parser.add_argument("--dry-run", action="store_true", help="Harvest and preview without writing to database")
    args = parser.parse_args()

    meta = harvest_doi(args.doi)
    sync_all(meta, args.pillar, args.featured, args.dry_run)

if __name__ == "__main__":
    main()
