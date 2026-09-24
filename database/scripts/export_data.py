#!/usr/bin/env python3
"""
export_data.py — Export SQLite database to frontend-ready JSON build artifacts.
Outputs to web/src/data/generated/ for static deployment and repository consumption.
"""

import json
import os
import re
import sqlite3
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
ROOT_DIR = os.path.abspath(os.path.join(DATABASE_DIR, ".."))
SQLITE_PATH = os.path.join(DATABASE_DIR, "slscm.sqlite")
GENERATED_DIR = os.path.join(ROOT_DIR, "web", "src", "data", "generated")

HEADER_NOTE = {
    "_comment": "GENERATED FILE — DO NOT EDIT MANUALLY. Source of truth is database/slscm.sqlite"
}

def write_json(filename, data):
    filepath = os.path.join(GENERATED_DIR, filename)
    with open(filepath, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"  • Generated {filename:<25} -> {filepath}")

def main():
    print("======================================================================")
    print("🚀 SLSCM Lab: Exporting SQLite to Frontend Build Artifacts")
    print("======================================================================")
    print(f"Reading from: {SQLITE_PATH}")
    print(f"Output to:   {GENERATED_DIR}\n")

    if not os.path.exists(SQLITE_PATH):
        print(f"❌ Error: Database not found at {SQLITE_PATH}. Run import script first.")
        sys.exit(1)

    os.makedirs(GENERATED_DIR, exist_ok=True)
    conn = sqlite3.connect(SQLITE_PATH)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # 1. Research Pillars
    cursor.execute("SELECT id, title, description, topics, featured_venues, display_order FROM research_pillars ORDER BY display_order ASC")
    pillars = []
    for r in cursor.fetchall():
        pillars.append({
            "id": r["id"],
            "title": r["title"],
            "description": r["description"],
            "topics": json.loads(r["topics"]) if r["topics"] else [],
            "featured_venues": json.loads(r["featured_venues"]) if r["featured_venues"] else []
        })
    write_json("research_pillars.json", pillars)

    # 2. Publications
    cursor.execute("SELECT * FROM publications ORDER BY year DESC, id ASC")
    pub_rows = cursor.fetchall()
    publications = []
    for p in pub_rows:
        # Get authors
        cursor.execute(
            "SELECT author_name, is_highlighted FROM publication_authors WHERE publication_id = ? ORDER BY author_order ASC",
            (p["id"],)
        )
        author_rows = cursor.fetchall()
        authors = [a["author_name"] for a in author_rows]
        highlighted = [a["author_name"] for a in author_rows if a["is_highlighted"] == 1]

        publications.append({
            "id": p["id"],
            "title": p["title"],
            "authors": authors,
            "venue": p["venue"],
            "year": p["year"],
            "type": p["type"],
            "doi": p["doi"] or None,
            "link": p["link"] or None,
            "research_pillar": p["research_pillar"],
            "primary_pillar_id": p["primary_pillar_id"],
            "keywords": json.loads(p["keywords"]) if p["keywords"] else [],
            "abstract": p["abstract"] or None,
            "abstract_source": p["abstract_source"] or None,
            "bibtex": p["bibtex"] or None,
            "is_featured": bool(p["is_featured"]),
            "highlighted_authors": highlighted,
            "badge": p["badge"] or None
        })
    write_json("publications.json", publications)

    # 3. People
    # Leadership and Faculty
    cursor.execute("SELECT * FROM people WHERE category = 'faculty' ORDER BY display_order ASC")
    faculty_rows = cursor.fetchall()
    faculty_list = []
    for f in faculty_rows:
        cursor.execute("SELECT interest FROM person_research_interests WHERE person_id = ? ORDER BY order_index ASC", (f["id"],))
        interests = [row["interest"] for row in cursor.fetchall()]
        faculty_list.append({
            "id": f["id"],
            "name": f["name"],
            "name_en": f["name_en"] or f["name"],
            "title": f["title"] or "",
            "role_badge": f["role_badge"] or "",
            "affiliation": f["affiliation"] or "",
            "email": f["email"] or "",
            "office": f["office"] or "",
            "bio": f["bio"] or "",
            "avatar": f["avatar"] or "",
            "research_interests": interests
        })

    # Web Tech Lead
    cursor.execute("SELECT * FROM people WHERE category = 'web_tech_lead' ORDER BY display_order ASC")
    tech_rows = cursor.fetchall()
    tech_list = []
    for t in tech_rows:
        cursor.execute("SELECT interest FROM person_research_interests WHERE person_id = ? ORDER BY order_index ASC", (t["id"],))
        interests = [row["interest"] for row in cursor.fetchall()]
        cursor.execute("SELECT publication_title FROM person_featured_publications WHERE person_id = ? ORDER BY order_index ASC", (t["id"],))
        pubs = [row["publication_title"] for row in cursor.fetchall()]
        tech_list.append({
            "id": t["id"],
            "name": t["name"],
            "name_en": t["name_en"] or t["name"],
            "role": t["title"] or "",
            "role_badge": t["role_badge"] or "",
            "affiliation": t["affiliation"] or "",
            "email": t["email"] or "",
            "avatar": t["avatar"] or "",
            "current_status": t["current_status"] or "",
            "featured_publications": pubs,
            "research_interests": interests
        })

    # Student Researchers
    cursor.execute("SELECT * FROM people WHERE category = 'student_researcher' ORDER BY display_order ASC")
    student_rows = cursor.fetchall()
    student_list = []
    for s in student_rows:
        cursor.execute("SELECT interest FROM person_research_interests WHERE person_id = ? ORDER BY order_index ASC", (s["id"],))
        interests = [row["interest"] for row in cursor.fetchall()]
        cursor.execute("SELECT publication_title FROM person_featured_publications WHERE person_id = ? ORDER BY order_index ASC", (s["id"],))
        pubs = [row["publication_title"] for row in cursor.fetchall()]
        student_list.append({
            "id": s["id"],
            "name": s["name"],
            "name_en": s["name_en"] or s["name"],
            "major": s["major"] or "",
            "institution": s["affiliation"] or "",
            "avatar": s["avatar"] or "",
            "email": s["email"] or "",
            "current_status": s["current_status"] or "",
            "featured_publications": pubs,
            "research_interests": interests
        })

    # Alumni
    cursor.execute("SELECT * FROM people WHERE category = 'alumni' ORDER BY display_order ASC")
    alumni_rows = cursor.fetchall()
    alumni_list = []
    for a in alumni_rows:
        alumni_list.append({
            "id": a["id"],
            "name": a["name"],
            "name_en": a["name_en"] or a["name"],
            "avatar": a["avatar"] or "",
            "period": "",
            "former_role": a["title"] or "",
            "former_role_en": a["title"] or "",
            "current_position": a["current_status"] or "",
            "current_position_en": a["current_status"] or "",
            "institution": a["affiliation"] or "",
            "email": a["email"] or ""
        })

    # Achievements / Hall of Fame
    cursor.execute("SELECT * FROM achievements ORDER BY display_order ASC, year DESC")
    hall_rows = cursor.fetchall()
    hall_list = []
    for h in hall_rows:
        hall_list.append({
            "id": h["id"],
            "name": h["name"],
            "name_en": h["name_en"] or h["name"],
            "avatar": h["avatar"] or "",
            "achievement": h["achievement"],
            "achievement_en": h["achievement_en"] or h["achievement"],
            "destination_institution": h["destination_institution"],
            "country": h["country"],
            "year": h["year"],
            "award_type": h["award_type"] or "",
            "field": h["field"] or "",
            "former_background_en": h["former_background_en"] or "",
            "advisors": h["advisors"] or ""
        })

    # Global Academic Partners
    UNIVERSITY_LOOKUP = [
        ("smu", "Singapore Management University (SMU)", "SMU", "/assets/images/universities/smu.svg", "https://smu.edu.sg"),
        ("udine", "University of Udine", "UniUd", "/assets/images/universities/udine.png", "https://uniud.it"),
        ("austria", "University of Graz & Austrian Partners", "UniGraz", "/assets/images/universities/graz.svg", "https://uni-graz.at"),
        ("graz", "University of Graz & Austrian Partners", "UniGraz", "/assets/images/universities/graz.svg", "https://uni-graz.at"),
        ("cardiff", "Cardiff University", "Cardiff", "/assets/images/universities/cardiff.svg", "https://www.cardiff.ac.uk"),
        ("lancaster", "Lancaster University", "Lancaster", "/assets/images/universities/lancaster.svg", "https://www.lancaster.ac.uk"),
        ("ljmu", "Liverpool John Moores University (LJMU)", "LJMU", "/assets/images/universities/ljmu.svg", "https://www.ljmu.ac.uk"),
        ("liverpool", "Liverpool John Moores University (LJMU)", "LJMU", "/assets/images/universities/ljmu.svg", "https://www.ljmu.ac.uk"),
        ("uconn", "University of Connecticut (UConn)", "UConn", "/assets/images/universities/uconn.svg", "https://uconn.edu"),
        ("connecticut", "University of Connecticut (UConn)", "UConn", "/assets/images/universities/uconn.svg", "https://uconn.edu"),
        ("loyola", "Loyola University Chicago", "LUC", "/assets/images/universities/loyola_chicago.svg", "https://www.luc.edu"),
        ("michigan", "University of Michigan - Flint", "UM-Flint", "/assets/images/universities/um_flint.svg", "https://www.umflint.edu"),
        ("montréal", "Université de Montréal", "UdeM", "/assets/images/universities/udem.svg", "https://www.umontreal.ca"),
        ("montreal", "Université de Montréal", "UdeM", "/assets/images/universities/udem.svg", "https://www.umontreal.ca"),
        ("cirrelt", "CIRRELT (Centre interuniversitaire)", "CIRRELT", "/assets/images/universities/cirrelt.png", "https://www.cirrelt.ca"),
        ("hust", "Hanoi University of Science and Technology (HUST)", "HUST", "/assets/images/universities/hust.svg", "https://hust.edu.vn"),
        ("hus", "VNU University of Science (VNU-HUS)", "VNU-HUS", "/assets/images/universities/vnu_hus.svg", "https://hus.vnu.edu.vn"),
        ("vnu", "VNU University of Science (VNU-HUS)", "VNU-HUS", "/assets/images/universities/vnu_hus.svg", "https://hus.vnu.edu.vn"),
        ("phenikaa", "Phenikaa University", "Phenikaa", "/assets/images/universities/phenikaa.png", "https://phenikaa-uni.edu.vn"),
        ("vinuni", "VinUniversity", "VinUni", "/assets/images/universities/vinuni.png", "https://vinuni.edu.vn"),
        ("vinuniversity", "VinUniversity", "VinUni", "/assets/images/universities/vinuni.png", "https://vinuni.edu.vn"),
    ]

    cursor.execute("SELECT * FROM global_academic_partners ORDER BY order_index ASC")
    partner_rows = cursor.fetchall()
    partner_list = []
    for p in partner_rows:
        collabs = [c.strip() for c in p["key_collaborators"].split(",") if c.strip()]
        insts = []
        seen = set()
        raw_tokens = [t.strip() for t in re.split(r'[,/]', p["institution"]) if t.strip()]
        for t in raw_tokens:
            if "partner institutes" in t.lower():
                continue
            for kw, name, short_name, logo, web in UNIVERSITY_LOOKUP:
                if kw in t.lower() and logo not in seen:
                    seen.add(logo)
                    insts.append({
                        "name": name,
                        "short_name": short_name,
                        "logo": logo,
                        "website": web
                    })
                    break

        partner_list.append({
            "country": p["country"],
            "institution": p["institution"],
            "institutions": insts,
            "collaborators": p["key_collaborators"],
            "key_collaborators": collabs,
            "scope": p["research_focus"],
            "research_focus": p["research_focus"]
        })

    people_dict = {
        "leadership_and_faculty": faculty_list,
        "web_tech_lead": tech_list,
        "hall_of_fame": hall_list,
        "graduate_and_undergraduate_student_researchers": student_list,
        "alumni": alumni_list,
        "global_academic_partners": partner_list
    }
    write_json("people.json", people_dict)
    write_json("achievements.json", hall_list)

    # 4. Projects
    cursor.execute("SELECT * FROM projects ORDER BY id ASC")
    project_rows = cursor.fetchall()
    projects = []
    for pr in project_rows:
        # Leads
        cursor.execute("SELECT name, email, role, affiliation FROM project_leads WHERE project_id = ? ORDER BY order_index ASC", (pr["id"],))
        leads = [dict(lr) for lr in cursor.fetchall()]

        # Related Publications
        cursor.execute("""
            SELECT p.id, p.title, p.venue, p.year, p.type, p.doi, p.link, p.abstract, p.bibtex, p.badge
            FROM project_publications pp
            JOIN publications p ON pp.publication_id = p.id
            WHERE pp.project_id = ?
            ORDER BY pp.display_order ASC
        """, (pr["id"],))
        rel_pubs = []
        for rpr in cursor.fetchall():
            cursor.execute("SELECT author_name FROM publication_authors WHERE publication_id = ? ORDER BY author_order ASC", (rpr["id"],))
            p_authors = [ar["author_name"] for ar in cursor.fetchall()]
            rel_pubs.append({
                "id": rpr["id"],
                "title": rpr["title"],
                "authors": p_authors,
                "venue": rpr["venue"],
                "year": rpr["year"],
                "type": rpr["type"],
                "doi": rpr["doi"] or None,
                "link": rpr["link"] or None,
                "badge": rpr["badge"] or None
            })

        # Outcomes
        cursor.execute("SELECT outcome_en, outcome_vi FROM project_outcomes WHERE project_id = ? ORDER BY order_index ASC", (pr["id"],))
        out_rows = cursor.fetchall()
        outcomes_en = [o["outcome_en"] for o in out_rows]
        outcomes_vi = [o["outcome_vi"] for o in out_rows]

        # Tags
        cursor.execute("SELECT tag FROM project_tags WHERE project_id = ?", (pr["id"],))
        tags = [t["tag"] for t in cursor.fetchall()]

        # Pillars
        cursor.execute("SELECT pillar, description_en, description_vi FROM project_pillars WHERE project_id = ?", (pr["id"],))
        pillars_proj = [dict(pir) for pir in cursor.fetchall()]

        # Curriculum
        cursor.execute("SELECT module_en, module_vi, content_vi FROM project_curriculum WHERE project_id = ? ORDER BY order_index ASC", (pr["id"],))
        curriculum = [dict(cr) for cr in cursor.fetchall()]

        projects.append({
            "id": pr["id"],
            "title_en": pr["title_en"],
            "title_vi": pr["title_vi"],
            "category": pr["category"],
            "category_en": pr["category_en"],
            "sponsor": pr["sponsor"],
            "grant_code": pr["grant_code"],
            "period": pr["period"],
            "status": pr["status"],
            "research_domain": pr["research_domain"],
            "collaboration": pr["collaboration"],
            "leads": leads,
            "description_en": pr["description_en"],
            "description_vi": pr["description_vi"],
            "methodology": pr["methodology"],
            "outcomes": outcomes_vi,
            "outcomes_en": outcomes_en,
            "tags": tags,
            "related_publications": rel_pubs,
            "pillars": pillars_proj,
            "curriculum": curriculum
        })
    write_json("projects.json", projects)

    # 5. Seminars
    cursor.execute("SELECT * FROM seminars ORDER BY date DESC, id ASC")
    seminar_rows = cursor.fetchall()
    seminars = []
    for s in seminar_rows:
        cursor.execute("SELECT topic FROM seminar_topics WHERE seminar_id = ?", (s["id"],))
        topics = [t["topic"] for t in cursor.fetchall()]
        seminars.append({
            "id": s["id"],
            "title": s["title"],
            "title_vi": s["title_vi"],
            "speaker": s["speaker"],
            "speaker_role": s["speaker_role"] or "",
            "affiliation": s["affiliation"],
            "date": s["date"],
            "time": s["time"] or "",
            "venue": s["venue"],
            "venue_type": s["venue_type"],
            "status": s["status"],
            "category": s["category"] or "",
            "track": s["track"] or "",
            "abstract": s["abstract"],
            "abstract_en": s["abstract_en"] or s["abstract"],
            "key_topics": topics,
            "related_paper_id": s["related_paper_id"] or None,
            "related_project_id": s["related_project_id"] or None,
            "slides_available": bool(s["slides_available"]),
            "recording_available": bool(s["recording_available"])
        })
    write_json("seminars.json", seminars)

    # 6. Events
    cursor.execute("SELECT * FROM events ORDER BY event_date DESC, id ASC")
    event_rows = cursor.fetchall()
    events = []
    for e in event_rows:
        cursor.execute("SELECT tag FROM event_tags WHERE event_id = ?", (e["id"],))
        tags = [t["tag"] for t in cursor.fetchall()]
        events.append({
            "id": e["id"],
            "title": e["title"],
            "title_vi": e["title_vi"],
            "date": e["event_date"],
            "category": e["category"],
            "category_vi": e["category_vi"],
            "badge": e["badge"] or None,
            "summary": e["summary"],
            "summary_en": e["summary_en"] or e["summary"],
            "summary_vi": e["summary_vi"] or "",
            "content_en": e["content_en"] or "",
            "content_vi": e["content_vi"] or "",
            "link": e["link"] or None,
            "link_label": e["link_label"] or None,
            "featured": bool(e["featured"]),
            "tags": tags
        })
    write_json("events.json", events)

    # 7. Social Posts
    cursor.execute("SELECT * FROM social_posts ORDER BY display_order ASC")
    social_rows = cursor.fetchall()
    posts = []
    for sp in social_rows:
        posts.append({
            "type": sp["type"],
            "title": sp["title"],
            "abstract": sp["abstract"] or None,
            "journal": sp["journal"] or None,
            "paper_title": sp["paper_title"] or None,
            "authors": json.loads(sp["authors"]) if sp["authors"] else None,
            "organizer": sp["organizer"] or None,
            "collaboration": sp["collaboration"] or None,
            "link": sp["link"] or None,
            "action_label": sp["action_label"] or None,
            "venue": sp["venue"] or None
        })
    write_json("social_posts.json", posts)

    # 8. Derived Site Metrics (Calculated entirely via SQL queries)
    cursor.execute("SELECT COUNT(*) FROM publications")
    total_pubs = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM publications WHERE type = 'Journal'")
    journal_articles = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM publications WHERE venue LIKE '%Computing%' OR venue LIKE '%Transportation Research Part C%' OR venue LIKE '%European Journal%' OR venue LIKE '%Computers & Operations%' OR venue LIKE '%International Transactions%' OR venue LIKE '%Energy Research%'")
    q1_pubs = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM projects WHERE status = 'Active'")
    active_projects = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM achievements WHERE achievement LIKE '%PhD%' OR achievement LIKE '%Master%' OR achievement_en LIKE '%PhD%'")
    scholarships = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM achievements WHERE achievement LIKE '%Valedictorian%' OR achievement_en LIKE '%Valedictorian%' OR achievement LIKE '%Thủ khoa%'")
    valedictorians = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM people WHERE category = 'student_researcher'")
    student_count = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(DISTINCT country) FROM global_academic_partners")
    partner_countries = cursor.fetchone()[0]

    metrics = {
        "total_publications": total_pubs,
        "journal_articles": journal_articles,
        "q1_journals": q1_pubs,
        "active_projects": active_projects,
        "phd_msc_scholarships": scholarships,
        "valedictorians": valedictorians,
        "student_researchers": student_count,
        "international_partner_countries": partner_countries
    }
    write_json("site_metrics.json", metrics)

    # 9. Overview (Merged lab overview + metrics + research_pillars)
    cursor.execute("SELECT key, value FROM lab_overview")
    overview = {}
    for row in cursor.fetchall():
        try:
            overview[row["key"]] = json.loads(row["value"])
        except Exception:
            overview[row["key"]] = row["value"]

    overview["metrics"] = metrics
    overview["research_pillars"] = pillars
    write_json("overview.json", overview)

    conn.close()

    print("\n----------------------------------------------------------------------")
    print("✅ All 9 build artifacts exported successfully!")
    print("======================================================================\n")

if __name__ == "__main__":
    main()
