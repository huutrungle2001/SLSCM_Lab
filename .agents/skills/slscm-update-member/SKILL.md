---
name: slscm-update-member
description: >-
  Use this skill whenever adding, updating, or retiring lab members, faculty, PhD/Master students,
  research alumni (e.g. SMU, UConn, LJMU, Warwick), or Hall of Fame achievements for SLSCM Lab.
  Enforces bilingual profiles, avatar rules, Supabase people/achievements migrations, and dual
  persistence across the monorepo.
---

# SLSCM Lab — Member & Placement Management Skill

This skill defines the standardized protocol for updating faculty, student researchers, alumni destinations, and academic honors.

## Member Categories & Placement Taxonomy

1. **`faculty`** — Leadership & Faculty
   - Displays as primary expandable cards in the **Faculty & Leadership** section.
   - Example: `vu-duc-minh`, `ha-minh-hoang`, `ta-dinh-quy`, `nguyen-thanh-hoang`, `dinh-nho-minh`.
2. **`researcher`** — Junior Researchers & Lead Authors
   - Highlighted scholars with high-impact publications (e.g. `le-ba-luat`, `tran-nam-khanh`).
3. **`student_researcher`** — Talented Student Researchers
   - Undergraduates and Master students from NEU, HUST, VNU-HUS.
4. **`alumni`** & **`hall_of_fame`** — Placements Worldwide
   - Scholars receiving PhD scholarships, postdocs, or research engineering roles globally (SMU Singapore, LJMU UK, UConn USA, Warwick UK).

---

## 4-Step Update Workflow

### Step 1: Prepare Member Profile Data
- `id`: kebab-case (e.g. `alumni-nguyen-tat-dat`).
- `avatar`: Path to square portrait in [`web/public/assets/images/people/<id>.jpg`](file:///home/orlab/Minh_ALL/td_bnc/website/web/public/assets/images/people/). If none exists, leave `""` (the frontend automatically renders a soft gradient with initial letter).
- Bilingual fields: `name`, `name_en`, `title_vi`, `title_en`, `bio_en`, `current_status`.

### Step 2: Supabase Migration
Generate a migration in [`supabase/migrations/`](file:///home/orlab/Minh_ALL/td_bnc/website/supabase/migrations/):
```sql
INSERT INTO public.people (
  id, name, name_en, title, role_badge, category,
  affiliation, affiliation_id, email, office, bio, avatar, status, display_order
) VALUES (
  'new-member-id',
  'Name in Vietnamese',
  'Name in English',
  'Lecturer / Researcher',
  'FACULTY MEMBER',
  'faculty',
  'Faculty of Data Science and AI, College of Technology, NEU',
  'neu',
  'email@neu.edu.vn',
  'Room 1613, Building A1',
  'Full English biography...',
  '/assets/images/people/new_member.jpg',
  'active',
  10
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  name_en = EXCLUDED.name_en,
  bio = EXCLUDED.bio,
  avatar = EXCLUDED.avatar;
```
Push via Supabase CLI:
```bash
supabase db push --linked
```

### Step 3: SQLite & JSON Mirroring
1. Insert / Update [`database/slscm.sqlite`](file:///home/orlab/Minh_ALL/td_bnc/website/database/slscm.sqlite) (`people`, `person_research_interests`, `person_featured_publications`, `achievements`).
2. Update [`web/src/data/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_people.json) and [`data/processed/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_people.json).
3. If new PhD scholarship or valedictorian:
   - Increment counters in [`web/src/data/slscm_overview.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_overview.json) (`phd_msc_scholarships`, `valedictorians`).
4. Re-export generated build datasets:
   ```bash
   python3 database/scripts/export_data.py
   ```

### Step 4: Verification
```bash
cd web && npm run build
```
