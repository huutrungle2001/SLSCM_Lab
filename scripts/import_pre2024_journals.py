#!/usr/bin/env python3
"""Import DOI-verified pre-2024 journals into the database and both source catalogs.

Abstracts must come from the separately verified DOI source file. Missing abstracts
remain empty and are never replaced with generated summaries.
"""

import argparse
import json
import re
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CANDIDATES = ROOT / "data/raw/google_scholar/pre2024_journal_candidates.json"
PROCESSED = ROOT / "data/processed/slscm_publications.json"
WEB = ROOT / "web/src/data/slscm_publications.json"
DATABASE = ROOT / "database/slscm.sqlite"


def research_area(keywords):
    tags = set(keywords)
    if tags & {"healthcare-analytics", "graph-optimization", "packing", "uav-path-planning", "data-resources"} and not tags & {"vehicle-routing", "drone-logistics", "arc-routing"}:
        return "decision_analytics", "ml_optimization" if "machine-learning" in tags else "operational_optimization"
    if tags & {"machine-learning", "forecasting"}:
        return "ai_supply_chain_intelligence", "ml_optimization"
    if tags & {"drone-logistics", "electric-vehicles", "road-maintenance"}:
        return "supply_chain_optimization", "green_transportation"
    return "supply_chain_optimization", "operational_optimization"


def make_bibtex(paper, paper_id):
    fields = {
        "title": paper["title"],
        "author": " and ".join(paper["authors"]),
        "journal": paper["journal"],
        "year": str(paper["year"]),
    }
    for source, target in (("volume", "volume"), ("issue", "number"), ("pages", "pages"), ("article_number", "article-number")):
        if paper.get(source):
            fields[target] = str(paper[source])
    fields["doi"] = paper["doi"]
    fields["url"] = paper["doi_url"]
    body = ",\n".join(f"  {key} = {{{value}}}" for key, value in fields.items())
    return f"@article{{{paper_id},\n{body}\n}}"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--abstracts", type=Path, required=True, help="Verified DOI -> abstract/source JSON mapping")
    args = parser.parse_args()
    source = json.loads(args.abstracts.read_text())
    candidates = json.loads(CANDIDATES.read_text())["records"]
    current = json.loads(PROCESSED.read_text())
    assert len(candidates) == 32, "Expected 32 verified Scholar journal candidates"

    existing_by_doi = {str(paper.get("doi") or "").lower(): paper for paper in current if paper.get("doi")}
    old_records = []
    for paper in candidates:
        doi = paper["doi"].lower()
        assert paper["verification"].startswith("crossref_"), f"Unverified DOI: {doi}"
        assert paper["authors"] and paper["journal"] and paper["year"] < 2024 and paper["keywords"]
        paper_id = "journal-" + re.sub(r"[^a-z0-9]+", "-", doi).strip("-")
        if doi in existing_by_doi:
            assert existing_by_doi[doi]["id"] == paper_id, f"Conflicting existing DOI: {doi}"
        abstract_info = source.get(doi) or source.get(paper["doi"])
        assert abstract_info is not None, f"Missing abstract review: {doi}"
        abstract = abstract_info.get("abstract") or None
        abstract_source = abstract_info.get("source_url") or None
        if abstract:
            assert abstract_info.get("status") == "verified" and abstract_source, f"Unverified abstract: {doi}"
            assert not re.search(r"<[^>]+>|&(?:lt|gt|amp);", abstract), f"Abstract contains markup: {doi}"
        primary_pillar, legacy_pillar = research_area(paper["keywords"])
        old_records.append({
            "id": paper_id,
            "title": paper["title"],
            "authors": paper["authors"],
            "venue": paper["journal"],
            "year": paper["year"],
            "type": "Journal",
            "doi": paper["doi"],
            "link": paper["doi_url"],
            "research_pillar": legacy_pillar,
            "primary_pillar_id": primary_pillar,
            "keywords": paper["keywords"],
            "abstract": abstract,
            "abstract_source": abstract_source,
            "bibtex": make_bibtex(paper, paper_id),
            "is_featured": False,
        })

    assert len({paper["id"] for paper in old_records}) == 32
    assert len({paper["doi"].lower() for paper in old_records}) == 32

    with sqlite3.connect(DATABASE) as connection:
        connection.execute("PRAGMA foreign_keys = ON")
        columns = {row[1] for row in connection.execute("PRAGMA table_info(publications)")}
        if "abstract_source" not in columns:
            connection.execute("ALTER TABLE publications ADD COLUMN abstract_source TEXT")
        for paper in old_records:
            connection.execute(
                """INSERT INTO publications
                   (id, title, year, venue, type, doi, link, abstract, abstract_source,
                    bibtex, research_pillar, primary_pillar_id, keywords, is_featured)
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                   ON CONFLICT(id) DO UPDATE SET
                     title=excluded.title, year=excluded.year, venue=excluded.venue,
                     type=excluded.type, doi=excluded.doi, link=excluded.link,
                     abstract=excluded.abstract, abstract_source=excluded.abstract_source,
                     bibtex=excluded.bibtex, research_pillar=excluded.research_pillar,
                     primary_pillar_id=excluded.primary_pillar_id, keywords=excluded.keywords""",
                (
                    paper["id"], paper["title"], paper["year"], paper["venue"], paper["type"],
                    paper["doi"], paper["link"], paper["abstract"], paper["abstract_source"],
                    paper["bibtex"], paper["research_pillar"], paper["primary_pillar_id"],
                    json.dumps(paper["keywords"]), 0,
                ),
            )
            connection.execute("DELETE FROM publication_authors WHERE publication_id = ?", (paper["id"],))
            connection.executemany(
                "INSERT INTO publication_authors (publication_id, author_name, author_order) VALUES (?, ?, ?)",
                [(paper["id"], author, index) for index, author in enumerate(paper["authors"])],
            )

    imported_ids = {paper["id"] for paper in old_records}
    catalog = [paper for paper in current if paper["id"] not in imported_ids] + old_records
    for path in (PROCESSED, WEB):
        path.write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + "\n")
    provenance = {}
    for candidate in candidates:
        doi = candidate["doi"].lower()
        abstract_info = source.get(doi) or source[candidate["doi"]]
        verified = bool(abstract_info.get("abstract"))
        candidate["abstract_status"] = "verified" if verified else "unavailable"
        candidate["abstract_source"] = abstract_info.get("source_url") if verified else None
        provenance[doi] = {
            "status": candidate["abstract_status"],
            "source_url": candidate["abstract_source"],
            "source_tier": abstract_info.get("source_tier") if verified else None,
        }
    candidate_document = json.loads(CANDIDATES.read_text())
    candidate_document["description"] = (
        "Pre-2024 journal papers from the two supplied Google Scholar profiles. "
        "DOI, author, journal, and issue year were checked against Crossref or the publisher. "
        "Abstract status and source identify which original abstracts were verified; "
        "unavailable abstracts are omitted from the public catalog."
    )
    candidate_document["records"] = candidates
    CANDIDATES.write_text(json.dumps(candidate_document, ensure_ascii=False, indent=2) + "\n")
    (CANDIDATES.parent / "pre2024_abstract_provenance.json").write_text(
        json.dumps(provenance, ensure_ascii=False, indent=2) + "\n"
    )
    verified_count = sum(bool(paper["abstract"]) for paper in old_records)
    print(f"Imported {len(old_records)} journal papers; {verified_count} authentic abstracts available.")


if __name__ == "__main__":
    main()
