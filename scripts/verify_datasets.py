#!/usr/bin/env python3
"""
Verification suite for SLSCM Lab processed datasets.
Validates structure, integrity, constraints, cross-file consistency, and prints full statistics.
Exits with 0 on complete success, or non-zero on failure.
"""

import json
import os
import sys

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
PROCESSED_DIR = os.path.join(BASE_DIR, 'data', 'processed')

def load_json(filename):
    path = os.path.join(PROCESSED_DIR, filename)
    assert os.path.exists(path), f"File missing: {path}"
    assert os.path.getsize(path) > 0, f"File is empty: {path}"
    with open(path, 'r', encoding='utf-8') as f:
        try:
            return json.load(f)
        except Exception as e:
            raise AssertionError(f"Invalid JSON in {filename}: {e}")

def verify_publications():
    pub_file = 'slscm_publications.json' if os.path.exists(os.path.join(PROCESSED_DIR, 'slscm_publications.json')) else 'slscm_publications_2025_2026.json'
    print(f"--- 1. Verifying {pub_file} ---")
    data = load_json(pub_file)
    assert isinstance(data, list), "Publications must be a JSON array"
    assert len(data) >= 17, f"Expected at least 17 publications, found {len(data)}"
    
    seen_ids = set()
    pillar_counts = {}
    type_counts = {}
    featured_count = 0
    years_count = {}

    required_fields = [
        'id', 'title', 'authors', 'venue', 'year', 'type',
        'doi', 'link', 'research_pillar', 'abstract', 'bibtex', 'is_featured'
    ]
    valid_pillars = {'operational_optimization', 'ml_optimization', 'green_transportation'}
    valid_types = {'Journal', 'Book Chapter', 'Conference'}

    for idx, paper in enumerate(data):
        for field in required_fields:
            assert field in paper, f"Paper #{idx} missing required field '{field}'"
        
        # ID check
        pid = paper['id']
        assert isinstance(pid, str) and len(pid) > 0, f"Invalid id in paper #{idx}"
        assert pid not in seen_ids, f"Duplicate paper ID detected: {pid}"
        seen_ids.add(pid)

        # Title & Authors
        assert isinstance(paper['title'], str) and len(paper['title'].strip()) > 0, f"Empty title in {pid}"
        assert isinstance(paper['authors'], list) and len(paper['authors']) > 0, f"Empty authors list in {pid}"
        for author in paper['authors']:
            assert isinstance(author, str) and len(author.strip()) > 0, f"Invalid author string in {pid}"

        # Venue & Year
        assert isinstance(paper['venue'], str) and len(paper['venue'].strip()) > 0, f"Empty venue in {pid}"
        assert paper['year'] in (2025, 2026), f"Year out of bounds (2025/2026 expected) in {pid}: {paper['year']}"
        years_count[paper['year']] = years_count.get(paper['year'], 0) + 1

        # Type & Pillar
        assert paper['type'] in valid_types, f"Invalid type '{paper['type']}' in {pid}"
        type_counts[paper['type']] = type_counts.get(paper['type'], 0) + 1

        assert paper['research_pillar'] in valid_pillars, f"Invalid pillar '{paper['research_pillar']}' in {pid}"
        pillar_counts[paper['research_pillar']] = pillar_counts.get(paper['research_pillar'], 0) + 1

        # Content & Abstract
        assert isinstance(paper['abstract'], str) and len(paper['abstract'].strip()) > 0, f"Empty abstract in {pid}"
        assert isinstance(paper['bibtex'], str) and len(paper['bibtex'].strip()) > 0, f"Empty bibtex in {pid}"
        assert isinstance(paper['is_featured'], bool), f"is_featured must be boolean in {pid}"
        if paper['is_featured']:
            featured_count += 1

    print(f"✓ Total Publications: {len(data)} (>= 17 constraint satisfied)")
    print(f"✓ Types Breakdown: {type_counts}")
    print(f"✓ Year Breakdown: {years_count}")
    print(f"✓ Research Pillar Distribution: {pillar_counts}")
    print(f"✓ Featured Publications: {featured_count}")
    return len(data), type_counts, featured_count

def verify_people():
    print("\n--- 2. Verifying slscm_people.json ---")
    data = load_json('slscm_people.json')
    assert isinstance(data, dict), "People data must be a JSON object"

    sections = [
        'leadership_and_faculty',
        'young_researchers_and_authors',
        'hall_of_fame',
        'student_researchers',
        'global_academic_partners'
    ]
    for sec in sections:
        assert sec in data, f"Missing section in people.json: {sec}"
        assert isinstance(data[sec], list) and len(data[sec]) > 0, f"Section '{sec}' must be a non-empty list"

    # Verify Leadership
    leaders = {p['name']: p for p in data['leadership_and_faculty']}
    assert "TS. Vũ Đức Minh" in leaders, "TS. Vũ Đức Minh must be in leadership"
    assert "PGS. TS. Hà Minh Hoàng" in leaders, "PGS. TS. Hà Minh Hoàng must be in leadership"
    assert "ThS. Tạ Đình Quý" in leaders, "ThS. Tạ Đình Quý must be in leadership"
    assert leaders["TS. Vũ Đức Minh"].get("email") == "minhvd@neu.edu.vn"

    # Verify Young Researchers
    young_names = [p['name'] for p in data['young_researchers_and_authors']]
    assert ("Lê Bá Luật" in young_names or "Lê Hữu Trung" in young_names), "Young researchers must contain Lead Authors"
    assert "Trần Nam Khánh" in young_names, "Trần Nam Khánh must be in young researchers"

    # Verify Hall of Fame
    hof_names = [h['name'] for h in data['hall_of_fame']]
    assert "Lê Bá Luật" in hof_names, "Lê Bá Luật must be in Hall of Fame"
    assert ("Nguyễn Tất Đạt" in hof_names or "Trần Tất Đạt" in hof_names), "Tat Dat must be in Hall of Fame"
    assert "Nguyễn Hải Thu" in hof_names, "Nguyễn Hải Thu must be in Hall of Fame"
    
    destinations = [h['destination_institution'] for h in data['hall_of_fame']]
    assert any("Singapore Management University" in d for d in destinations)
    assert any("Liverpool John Moores University" in d for d in destinations)
    assert any("University of Connecticut" in d for d in destinations)

    # Verify Students
    students = data['student_researchers']
    assert len(students) >= 9, f"Expected at least 9 student researchers, found {len(students)}"

    # Verify Global Partners
    partners = data['global_academic_partners']
    countries = {p['country'] for p in partners}
    expected_countries = {"Singapore", "Italy", "Austria", "United Kingdom", "United States", "Canada & France", "Vietnam"}
    assert expected_countries.issubset(countries), f"Missing partner countries: {expected_countries - countries}"

    print(f"✓ Leadership & Faculty: {len(data['leadership_and_faculty'])} members")
    print(f"✓ Young Researchers & Authors: {len(data['young_researchers_and_authors'])} members")
    print(f"✓ Hall of Fame Scholars: {len(data['hall_of_fame'])} recipients")
    print(f"✓ Talented Student Researchers: {len(students)} students")
    print(f"✓ Global Academic Partners: {len(partners)} countries/regions represented")
    return len(data['hall_of_fame']), len(students), len(partners)

def verify_projects():
    print("\n--- 3. Verifying slscm_projects.json ---")
    data = load_json('slscm_projects.json')
    assert isinstance(data, list), "Projects must be a JSON array"
    assert len(data) >= 4, f"Expected at least 4 projects, found {len(data)}"

    project_ids = {p['id'] for p in data}
    expected_ids = {
        "hanoi-smart-water-network",
        "rv-fstsp-optimization",
        "vinif-cfl-cross-nested-logit",
        "training-smart-decisions"
    }
    assert expected_ids.issubset(project_ids), f"Missing projects: {expected_ids - project_ids}"

    for p in data:
        assert 'title_vi' in p and len(p['title_vi']) > 0
        assert 'title_en' in p and len(p['title_en']) > 0
        assert 'status' in p
        assert 'category' in p

    print(f"✓ Projects Verified: {len(data)} key initiatives active")
    for p in data:
        print(f"  - [{p['id']}] {p['title_vi']}")
    return len(data)

def verify_overview(pub_count, hof_count, student_count, proj_count, partner_count):
    print("\n--- 4. Verifying slscm_overview.json & Cross-Metrics Consistency ---")
    data = load_json('slscm_overview.json')
    assert isinstance(data, dict), "Overview must be a JSON object"
    assert 'metrics' in data, "Overview must have a 'metrics' object"

    metrics = data['metrics']
    assert metrics['total_publications_2025_2026'] == pub_count, "Publication count mismatch with overview"
    assert metrics['phd_scholarships'] <= hof_count, "PhD scholarship count mismatch"
    assert metrics['student_researchers'] == student_count, "Student count mismatch"
    assert metrics['active_projects'] <= proj_count, "Project count mismatch"
    assert metrics['international_partner_countries'] == partner_count, "Partner count mismatch"

    assert 'research_pillars' in data and len(data['research_pillars']) == 3
    assert 'official_kpi_2025' in data

    print("✓ Cross-file consistency verified:")
    print(f"  * Total publications: {metrics['total_publications_2025_2026']}")
    print(f"  * Q1 journals: {metrics['q1_journals']}")
    print(f"  * PhD scholarships: {metrics['phd_scholarships']}")
    print(f"  * Valedictorian honors: {metrics['valedictorians']}")
    print(f"  * Active research projects: {metrics['active_projects']}")
    print(f"  * Talented student researchers: {metrics['student_researchers']}")

def verify_facebook_posts():
    print("\n--- 5. Verifying slscm_facebook_posts.json ---")
    data = load_json('slscm_facebook_posts.json')
    assert isinstance(data, list), "Facebook posts must be a list"
    assert len(data) > 0, "Facebook posts must not be empty"
    print(f"✓ Facebook intelligence posts: {len(data)} items validated")

def main():
    print("==================================================================")
    print("SLSCM LAB DATA INTELLIGENCE VERIFICATION SUITE")
    print("==================================================================")
    try:
        pub_count, type_counts, feat_count = verify_publications()
        hof_count, student_count, partner_count = verify_people()
        proj_count = verify_projects()
        verify_overview(pub_count, hof_count, student_count, proj_count, partner_count)
        verify_facebook_posts()
        print("\n==================================================================")
        print("🎉 ALL DATASET VERIFICATION CHECKS PASSED WITH ZERO ERRORS!")
        print("==================================================================")
        sys.exit(0)
    except AssertionError as err:
        print(f"\n❌ ASSERTION FAILED: {err}", file=sys.stderr)
        sys.exit(1)
    except Exception as exc:
        print(f"\n❌ UNEXPECTED ERROR: {exc}", file=sys.stderr)
        sys.exit(2)

if __name__ == '__main__':
    main()
