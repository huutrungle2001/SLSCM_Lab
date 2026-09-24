#!/usr/bin/env python3
"""
import_existing_json.py — Migrate existing SLSCM JSON data into SQLite.
Single Source of Truth (SSOT) initialization script.
"""

import json
import os
import sqlite3
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
ROOT_DIR = os.path.abspath(os.path.join(DATABASE_DIR, ".."))
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
SCHEMA_PATH = os.path.join(DATABASE_DIR, "schema.sql")

WEB_DATA_DIR = os.path.join(ROOT_DIR, "web", "src", "data")
PROCESSED_DATA_DIR = os.path.join(ROOT_DIR, "data", "processed")

def load_json(filename):
    # Try web/src/data first, fallback to data/processed
    web_file = os.path.join(WEB_DATA_DIR, filename)
    processed_file = os.path.join(PROCESSED_DATA_DIR, filename)
    if os.path.exists(web_file):
        with open(web_file, "r", encoding="utf-8") as f:
            return json.load(f)
    elif os.path.exists(processed_file):
        with open(processed_file, "r", encoding="utf-8") as f:
            return json.load(f)
    else:
        raise FileNotFoundError(f"Cannot find {filename} in {web_file} or {processed_file}")

def get_institution_id(inst_name):
    if not inst_name:
        return None
    name_lower = inst_name.lower()
    if "national economics university" in name_lower or "kinh tế quốc dân" in name_lower or "neu" in name_lower:
        return "neu"
    if "engineering and technology" in name_lower or "vnu-uet" in name_lower:
        return "vnu-uet"
    if "hanoi university of science and technology" in name_lower or "bách khoa" in name_lower or "hust" in name_lower:
        return "hust"
    if "university of science" in name_lower or "khoa học tự nhiên" in name_lower or "vnu-hus" in name_lower:
        return "vnu-hus"
    if "singapore management" in name_lower or "smu" in name_lower:
        return "smu"
    if "connecticut" in name_lower or "uconn" in name_lower:
        return "uconn"
    if "liverpool" in name_lower or "ljmu" in name_lower:
        return "ljmu"
    if "south florida" in name_lower or "usf" in name_lower:
        return "usf"
    if "vinuni" in name_lower or "vinuniversity" in name_lower:
        return "vinuni"
    if "phenikaa" in name_lower:
        return "phenikaa"
    if "udine" in name_lower:
        return "udine"
    if "brescia" in name_lower:
        return "brescia"
    if "graz" in name_lower:
        return "graz"
    if "inria" in name_lower:
        return "inria"
    return None

def main():
    print("======================================================================")
    print("📦 SLSCM Lab: Initializing SQLite Single Source of Truth (SSOT)")
    print("======================================================================")
    print(f"Target Database: {SQLITE_PATH}")

    # Remove existing sqlite to start completely clean and idempotent
    if os.path.exists(SQLITE_PATH):
        os.remove(SQLITE_PATH)

    conn = sqlite3.connect(SQLITE_PATH)
    conn.execute("PRAGMA foreign_keys = ON;")
    cursor = conn.cursor()

    # 1. Execute Schema
    print("📜 Applying database schema (schema.sql)...")
    with open(SCHEMA_PATH, "r", encoding="utf-8") as f:
        schema_sql = f.read()
    cursor.executescript(schema_sql)

    # 2. Seed Standard Institutions
    print("🏛️ Seeding institutions...")
    institutions = [
        ("neu", "National Economics University", "NEU", "Vietnam", "Hanoi", "https://neu.edu.vn"),
        ("vnu-hus", "VNU University of Science", "VNU-HUS", "Vietnam", "Hanoi", "https://hus.vnu.edu.vn"),
        ("vnu-uet", "VNU University of Engineering and Technology", "VNU-UET", "Vietnam", "Hanoi", "https://uet.vnu.edu.vn"),
        ("hust", "Hanoi University of Science and Technology", "HUST", "Vietnam", "Hanoi", "https://hust.edu.vn"),
        ("smu", "Singapore Management University", "SMU", "Singapore", "Singapore", "https://smu.edu.sg"),
        ("uconn", "University of Connecticut", "UConn", "United States", "Storrs", "https://uconn.edu"),
        ("ljmu", "Liverpool John Moores University", "LJMU", "United Kingdom", "Liverpool", "https://ljmu.ac.uk"),
        ("usf", "University of South Florida", "USF", "United States", "Tampa", "https://usf.edu"),
        ("vinuni", "VinUniversity", "VinUni", "Vietnam", "Hanoi", "https://vinuni.edu.vn"),
        ("phenikaa", "Phenikaa University", "Phenikaa", "Vietnam", "Hanoi", "https://phenikaa-uni.edu.vn"),
        ("udine", "University of Udine", "UniUd", "Italy", "Udine", "https://uniud.it"),
        ("brescia", "University of Brescia", "UniBs", "Italy", "Brescia", "https://unibs.it"),
        ("graz", "University of Graz", "UniGraz", "Austria", "Graz", "https://uni-graz.at"),
        ("inria", "INRIA", "Inria", "France", "Paris", "https://inria.fr")
    ]
    cursor.executemany(
        "INSERT INTO institutions (id, name, short_name, country, city, website) VALUES (?, ?, ?, ?, ?, ?)",
        institutions
    )

    # 3. Import Research Pillars
    print("🧭 Importing research pillars from slscm_overview.json...")
    overview_data = load_json("slscm_overview.json")
    for idx, pillar in enumerate(overview_data.get("research_pillars", [])):
        cursor.execute(
            """INSERT INTO research_pillars (id, title, description, topics, featured_venues, display_order)
               VALUES (?, ?, ?, ?, ?, ?)""",
            (
                pillar["id"],
                pillar["title"],
                pillar["description"],
                json.dumps(pillar.get("topics", []), ensure_ascii=False),
                json.dumps(pillar.get("featured_journals", pillar.get("featured_venues", [])), ensure_ascii=False),
                idx
            )
        )

    # 4. Import People (Faculty, Web Tech Lead, Student Researchers, Alumni)
    print("👥 Importing people profiles from slscm_people.json...")
    people_data = load_json("slscm_people.json")

    # Faculty & Leadership
    for idx, person in enumerate(people_data.get("leadership_and_faculty", [])):
        inst_id = get_institution_id(person.get("affiliation", "")) or "neu"
        cursor.execute(
            """INSERT INTO people (id, name, name_en, title, role_badge, category, affiliation, affiliation_id, email, office, bio, avatar, display_order)
               VALUES (?, ?, ?, ?, ?, 'faculty', ?, ?, ?, ?, ?, ?, ?)""",
            (
                person["id"],
                person["name"],
                person.get("name_en", person["name"]),
                person.get("title", ""),
                person.get("role_badge", ""),
                person.get("affiliation", ""),
                inst_id,
                person.get("email", ""),
                person.get("office", ""),
                person.get("bio", ""),
                person.get("avatar", ""),
                idx
            )
        )
        for order_idx, interest in enumerate(person.get("research_interests", [])):
            cursor.execute(
                "INSERT INTO person_research_interests (person_id, interest, order_index) VALUES (?, ?, ?)",
                (person["id"], interest, order_idx)
            )

    # Web Tech Lead
    tech_leads = people_data.get("web_tech_lead", [])
    if isinstance(tech_leads, dict):
        tech_leads = [tech_leads]
    for idx, tech_lead in enumerate(tech_leads):
        tech_id = tech_lead.get("id", f"tech-lead-{idx+1}")
        inst_id = get_institution_id(tech_lead.get("affiliation", "")) or "neu"
        cursor.execute(
            """INSERT OR REPLACE INTO people (id, name, name_en, title, role_badge, category, affiliation, affiliation_id, email, avatar, current_status, display_order)
               VALUES (?, ?, ?, ?, ?, 'web_tech_lead', ?, ?, ?, ?, ?, ?)""",
            (
                tech_id,
                tech_lead["name"],
                tech_lead.get("name_en", tech_lead["name"]),
                tech_lead.get("role", ""),
                tech_lead.get("role_badge", "WEB & TECH LEAD / RESEARCHER"),
                tech_lead.get("affiliation", ""),
                inst_id,
                tech_lead.get("email", ""),
                tech_lead.get("avatar", ""),
                tech_lead.get("current_status", ""),
                90 + idx
            )
        )
        for order_idx, pub in enumerate(tech_lead.get("featured_publications", [])):
            cursor.execute(
                "INSERT OR IGNORE INTO person_featured_publications (person_id, publication_title, order_index) VALUES (?, ?, ?)",
                (tech_id, pub, order_idx)
            )
        for order_idx, interest in enumerate(tech_lead.get("research_interests", [])):
            cursor.execute(
                "INSERT OR IGNORE INTO person_research_interests (person_id, interest, order_index) VALUES (?, ?, ?)",
                (tech_id, interest, order_idx)
            )

    # Student Researchers
    for idx, student in enumerate(people_data.get("graduate_and_undergraduate_student_researchers", [])):
        student_id = student.get("id") or f"student-{idx+1}-{student['name'].lower().replace(' ', '-')}"
        inst_id = get_institution_id(student.get("institution", "")) or "neu"
        cursor.execute(
            """INSERT INTO people (id, name, name_en, category, affiliation, affiliation_id, email, avatar, major, current_status, display_order)
               VALUES (?, ?, ?, 'student_researcher', ?, ?, ?, ?, ?, ?, ?)""",
            (
                student_id,
                student["name"],
                student.get("name_en", student["name"]),
                student.get("institution", "National Economics University"),
                inst_id,
                student.get("email", ""),
                student.get("avatar", ""),
                student.get("major", ""),
                student.get("current_status", ""),
                100 + idx
            )
        )
        for order_idx, pub in enumerate(student.get("featured_publications", [])):
            cursor.execute(
                "INSERT OR IGNORE INTO person_featured_publications (person_id, publication_title, order_index) VALUES (?, ?, ?)",
                (student_id, pub, order_idx)
            )
        for order_idx, interest in enumerate(student.get("research_interests", [])):
            cursor.execute(
                "INSERT OR IGNORE INTO person_research_interests (person_id, interest, order_index) VALUES (?, ?, ?)",
                (student_id, interest, order_idx)
            )

    # Alumni Members
    for idx, alum in enumerate(people_data.get("alumni", [])):
        alum_id = alum.get("id") or f"alumni-{idx+1}-{alum['name'].lower().replace(' ', '-')}"
        inst_id = get_institution_id(alum.get("institution", ""))
        cursor.execute(
            """INSERT INTO people (id, name, name_en, title, category, affiliation, affiliation_id, email, avatar, current_status, display_order)
               VALUES (?, ?, ?, ?, 'alumni', ?, ?, ?, ?, ?, ?)""",
            (
                alum_id,
                alum["name"],
                alum.get("name_en", alum["name"]),
                alum.get("former_role_en", alum.get("former_role", "")),
                alum.get("institution", ""),
                inst_id,
                alum.get("email", ""),
                alum.get("avatar", ""),
                alum.get("current_position_en", alum.get("current_position", "")),
                200 + idx
            )
        )

    # 5. Import Achievements & Hall of Fame
    print("🏆 Importing Hall of Fame & Achievements...")
    for idx, hall in enumerate(people_data.get("hall_of_fame", [])):
        inst_id = get_institution_id(hall.get("destination_institution", ""))
        cursor.execute(
            """INSERT INTO achievements (id, name, name_en, avatar, achievement, achievement_en, destination_institution, institution_id, country, year, award_type, field, former_background_en, display_order, featured)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)""",
            (
                hall["id"],
                hall["name"],
                hall.get("name_en", hall["name"]),
                hall.get("avatar", ""),
                hall.get("achievement", ""),
                hall.get("achievement_en", hall.get("achievement", "")),
                hall.get("destination_institution", ""),
                inst_id,
                hall.get("country", ""),
                int(hall.get("year", 2025)),
                hall.get("award_type", ""),
                hall.get("field", ""),
                hall.get("former_background_en", ""),
                idx
            )
        )

    # 6. Global Academic Partners
    print("🌐 Importing global academic partners...")
    for idx, partner in enumerate(people_data.get("global_academic_partners", [])):
        part_id = f"partner-{idx+1}-{partner['institution'].lower()[:15].replace(' ', '-')}"
        inst_id = get_institution_id(partner.get("institution", ""))
        collabs = partner.get("key_collaborators") or partner.get("collaborators", "")
        collab_str = ", ".join(collabs) if isinstance(collabs, list) else str(collabs)
        research_focus = partner.get("research_focus") or partner.get("scope", "")
        cursor.execute(
            """INSERT INTO global_academic_partners (id, institution, institution_id, country, key_collaborators, research_focus, order_index)
               VALUES (?, ?, ?, ?, ?, ?, ?)""",
            (
                part_id,
                partner["institution"],
                inst_id,
                partner["country"],
                collab_str,
                research_focus,
                idx
            )
        )

    # 7. Import Publications
    print("📚 Importing publications...")
    try:
        pubs_data = load_json("slscm_publications.json")
    except FileNotFoundError:
        pubs_data = load_json("slscm_publications_2025_2026.json")
    for pub in pubs_data:
        legacy_pillar = pub.get("research_pillar", "")
        # Map primary pillar id based on legacy taxonomy unless explicitly curated.
        if legacy_pillar == "ml_optimization":
            primary_pillar = "ai_supply_chain_intelligence"
        elif legacy_pillar == "green_transportation":
            primary_pillar = "supply_chain_optimization"
        elif legacy_pillar == "operational_optimization":
            primary_pillar = "supply_chain_optimization"
        else:
            primary_pillar = "decision_analytics"
        primary_pillar = pub.get("primary_pillar_id") or primary_pillar

        cursor.execute(
            """INSERT INTO publications (id, title, year, venue, type, doi, link, abstract, abstract_source, bibtex, research_pillar, primary_pillar_id, keywords, is_featured, badge)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
            (
                pub["id"],
                pub["title"],
                int(pub["year"]),
                pub["venue"],
                pub["type"],
                pub.get("doi", ""),
                pub.get("link", ""),
                pub.get("abstract", ""),
                pub.get("abstract_source", ""),
                pub.get("bibtex", ""),
                legacy_pillar,
                primary_pillar,
                json.dumps(pub.get("keywords", []), ensure_ascii=False),
                1 if pub.get("is_featured", False) else 0,
                pub.get("badge", "")
            )
        )

        authors = pub.get("authors", [])
        highlighted = pub.get("highlighted_authors", [])
        for order_idx, author_name in enumerate(authors):
            is_hl = 1 if author_name in highlighted else 0
            cursor.execute(
                """INSERT INTO publication_authors (publication_id, author_name, author_order, is_highlighted)
                   VALUES (?, ?, ?, ?)""",
                (pub["id"], author_name, order_idx, is_hl)
            )

    # 8. Import Projects
    print("🔬 Importing research projects...")
    projects_data = load_json("slscm_projects.json")
    for proj in projects_data:
        cursor.execute(
            """INSERT INTO projects (id, title_en, title_vi, category, category_en, sponsor, grant_code, period, status, research_domain, collaboration, description_en, description_vi, methodology)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
            (
                proj["id"],
                proj.get("title_en", proj.get("title_vi", "")),
                proj.get("title_vi", ""),
                proj.get("category", ""),
                proj.get("category_en", proj.get("category", "")),
                proj.get("sponsor", ""),
                proj.get("grant_code", ""),
                proj.get("period", ""),
                proj.get("status", "Active"),
                proj.get("research_domain", ""),
                proj.get("collaboration", ""),
                proj.get("description_en", proj.get("description_vi", "")),
                proj.get("description_vi", ""),
                proj.get("methodology", "")
            )
        )

        # Project leads
        for order_idx, lead in enumerate(proj.get("leads") or []):
            cursor.execute(
                """INSERT INTO project_leads (project_id, name, email, role, affiliation, order_index)
                   VALUES (?, ?, ?, ?, ?, ?)""",
                (
                    proj["id"],
                    lead.get("name", ""),
                    lead.get("email", ""),
                    lead.get("role", ""),
                    lead.get("affiliation", ""),
                    order_idx
                )
            )

        # Project publications
        for order_idx, rel_pub in enumerate(proj.get("related_publications") or []):
            pub_id = rel_pub.get("id")
            # Check if publication exists in publications table
            cursor.execute("SELECT id FROM publications WHERE id = ?", (pub_id,))
            if cursor.fetchone():
                cursor.execute(
                    """INSERT OR IGNORE INTO project_publications (project_id, publication_id, display_order)
                       VALUES (?, ?, ?)""",
                    (proj["id"], pub_id, order_idx)
                )

        # Outcomes
        outcomes_en = proj.get("outcomes_en") or proj.get("outcomes") or []
        outcomes_vi = proj.get("outcomes") or []
        for order_idx, out_en in enumerate(outcomes_en):
            out_vi = outcomes_vi[order_idx] if order_idx < len(outcomes_vi) else out_en
            cursor.execute(
                """INSERT INTO project_outcomes (project_id, outcome_en, outcome_vi, order_index)
                   VALUES (?, ?, ?, ?)""",
                (proj["id"], out_en, out_vi, order_idx)
            )

        # Tags
        for tag in proj.get("tags") or []:
            cursor.execute(
                """INSERT OR IGNORE INTO project_tags (project_id, tag)
                   VALUES (?, ?)""",
                (proj["id"], tag)
            )

        # Pillars
        for pillar in proj.get("pillars") or []:
            cursor.execute(
                """INSERT INTO project_pillars (project_id, pillar, description_en, description_vi)
                   VALUES (?, ?, ?, ?)""",
                (
                    proj["id"],
                    pillar.get("pillar", ""),
                    pillar.get("description_en", pillar.get("description_vi", "")),
                    pillar.get("description_vi", "")
                )
            )

        # Curriculum (training projects)
        for order_idx, module in enumerate(proj.get("curriculum") or []):
            cursor.execute(
                """INSERT INTO project_curriculum (project_id, module_en, module_vi, content_vi, order_index)
                   VALUES (?, ?, ?, ?, ?)""",
                (
                    proj["id"],
                    module.get("module_en", module.get("module_vi", "")),
                    module.get("module_vi", ""),
                    module.get("content_vi", ""),
                    order_idx
                )
            )

    # 9. Import Seminars
    print("🎤 Importing academic seminars...")
    seminars_data = load_json("slscm_seminars.json")
    for sem in seminars_data:
        inst_id = get_institution_id(sem.get("affiliation", ""))
        cursor.execute(
            """INSERT INTO seminars (id, title, title_vi, speaker, speaker_role, affiliation, affiliation_id, date, time, venue, venue_type, status, category, track, abstract, abstract_en, related_paper_id, related_project_id, slides_available, recording_available)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
            (
                sem["id"],
                sem["title"],
                sem.get("title_vi", sem["title"]),
                sem["speaker"],
                sem.get("speaker_role", ""),
                sem["affiliation"],
                inst_id,
                sem["date"],
                sem.get("time", ""),
                sem["venue"],
                sem.get("venue_type", "In-Person"),
                sem.get("status", "Archived"),
                sem.get("category", ""),
                sem.get("track", ""),
                sem.get("abstract", ""),
                sem.get("abstract_en", sem.get("abstract", "")),
                sem.get("related_paper_id", ""),
                sem.get("related_project_id", ""),
                1 if sem.get("slides_available", False) else 0,
                1 if sem.get("recording_available", False) else 0
            )
        )
        for topic in sem.get("key_topics") or []:
            cursor.execute(
                """INSERT OR IGNORE INTO seminar_topics (seminar_id, topic)
                   VALUES (?, ?)""",
                (sem["id"], topic)
            )

    # 10. Import Events
    print("📰 Importing news briefs & events...")
    events_data = load_json("slscm_events.json")
    for evt in events_data:
        cursor.execute(
            """INSERT INTO events (id, title, title_vi, event_date, category, category_vi, badge, summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
            (
                evt["id"],
                evt["title"],
                evt.get("title_vi", evt["title"]),
                evt.get("date", ""),
                evt.get("category", "General"),
                evt.get("category_vi", evt.get("category", "General")),
                evt.get("badge", ""),
                evt.get("summary", ""),
                evt.get("summary_en", evt.get("summary", "")),
                evt.get("summary_vi", evt.get("summary_vi", "")),
                evt.get("content_en", evt.get("content", "")),
                evt.get("content_vi", evt.get("content_vi", "")),
                evt.get("link", ""),
                evt.get("link_label", ""),
                1 if evt.get("featured", False) else 0
            )
        )
        for tag in evt.get("tags") or []:
            cursor.execute(
                """INSERT OR IGNORE INTO event_tags (event_id, tag)
                   VALUES (?, ?)""",
                (evt["id"], tag)
            )

    # 11. Import Social Posts
    print("📱 Importing social posts...")
    posts_data = load_json("slscm_facebook_posts.json")
    for idx, post in enumerate(posts_data):
        post_id = f"post-{idx+1}"
        authors_json = json.dumps(post.get("authors", []), ensure_ascii=False) if post.get("authors") else None
        cursor.execute(
            """INSERT INTO social_posts (id, type, title, abstract, journal, paper_title, authors, organizer, collaboration, link, action_label, venue, display_order)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
            (
                post_id,
                post.get("type", "general"),
                post.get("title", ""),
                post.get("abstract", ""),
                post.get("journal", ""),
                post.get("paper_title", ""),
                authors_json,
                post.get("organizer", ""),
                post.get("collaboration", ""),
                post.get("link", ""),
                post.get("action_label", ""),
                post.get("venue", ""),
                idx
            )
        )

    # 12. Lab Overview Metadata
    print("ℹ️ Storing lab overview metadata...")
    for k in ["name", "abbreviation", "affiliation", "faculty_department", "address", "head_of_lab", "social", "official_kpi_2025"]:
        if k in overview_data:
            val_str = json.dumps(overview_data[k], ensure_ascii=False) if isinstance(overview_data[k], (dict, list)) else str(overview_data[k])
            cursor.execute("INSERT OR REPLACE INTO lab_overview (key, value) VALUES (?, ?)", (k, val_str))

    conn.commit()

    # 13. Audit & Verification Counts
    print("\n----------------------------------------------------------------------")
    print("📊 MIGRATION SUMMARY AUDIT")
    print("----------------------------------------------------------------------")
    tables = [
        "institutions", "research_pillars", "people", "person_research_interests",
        "publications", "publication_authors", "projects", "project_leads",
        "project_publications", "seminars", "seminar_topics", "events",
        "event_tags", "achievements", "global_academic_partners", "social_posts"
    ]
    for table in tables:
        cursor.execute(f"SELECT COUNT(*) FROM {table}")
        count = cursor.fetchone()[0]
        print(f"  • {table:<28}: {count} records")

    conn.close()
    print("----------------------------------------------------------------------")
    print("✅ Migration completed successfully! Database created at:")
    print(f"   {SQLITE_PATH}")
    print("======================================================================\n")

if __name__ == "__main__":
    main()
