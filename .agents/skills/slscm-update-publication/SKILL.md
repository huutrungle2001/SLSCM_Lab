---
name: slscm-update-publication
description: >-
  Use this skill whenever adding, updating, or verifying scientific publications (journal articles,
  conference papers, book chapters) for SLSCM Lab. Adheres to the Academic Abstract Harvesting Protocol
  (Crossref, OpenAlex, SpringerLink, BibTeX), updates remote Supabase database via Supabase CLI migrations,
  links author profiles, synchronizes SQLite, and regenerates frontend build datasets.
---

# SLSCM Lab — Publication Cataloging & Synchronization Skill

This skill defines the standardized protocol and automated workflow for cataloging, updating, and synchronizing scientific publications for SLSCM Lab.

## Quick Automated Execution

A pre-built harvester and synchronizer is provided at [scripts/add_publication.py](file:///home/orlab/Minh_ALL/website/.agents/skills/slscm-update-publication/scripts/add_publication.py).

### 1. Dry Run / Preview
```bash
python3 .agents/skills/slscm-update-publication/scripts/add_publication.py \
  --doi "10.1007/s12597-026-01275-y" \
  --pillar "supply_chain_optimization" \
  --dry-run
```

### 2. Full Live Execution
```bash
python3 .agents/skills/slscm-update-publication/scripts/add_publication.py \
  --doi "10.1007/s12597-026-01275-y" \
  --pillar "supply_chain_optimization"
```
Flags:
- `--doi`: The DOI of the paper (e.g. `10.1016/j.trc.2026.105906`).
- `--pillar`: One of `supply_chain_optimization`, `ai_supply_chain_intelligence`, `decision_analytics`.
- `--featured`: Set to make this paper appear in the Featured Research section on the homepage.
- `--dry-run`: Preview metadata without modifying databases or files.

---

## The 5-Step Synchronization Architecture

When performing manual updates or customizing the pipeline:

### Step 1: Academic Abstract Harvesting Protocol
Strictly adhere to author-written abstracts (no fabricated summaries):
1. **Tier 1 — Crossref API**: `curl -s "https://api.crossref.org/works/{doi}" -H "User-Agent: SLSCMBot/1.0"`
2. **Tier 2 — OpenAlex API**: `curl -s "https://api.openalex.org/works/doi:{doi}"` (reconstruct from `abstract_inverted_index`)
3. **Tier 3 — Publisher Landing Page**: Fetch HTML from SpringerLink, INFORMS, Wiley, or ScienceDirect to extract `<meta name="dc.description">` or `<div id="Abs1-content">`. Strip all raw JATS/XML tags (`<jats:p>`, `&lt;jats:p&gt;`).
4. **Tier 4 — BibTeX**: `curl -sLH "Accept: application/x-bibtex" https://doi.org/{doi}`.

### Step 2: Supabase Migration & Remote Execution
Create a versioned migration under [`supabase/migrations/`](file:///home/orlab/Minh_ALL/website/supabase/migrations/):
```sql
-- Format: <YYYYMMDDHHMMSS>_add_<pub_id>.sql
INSERT INTO public.publications (
  id, title, year, venue, type, doi, link, abstract, abstract_source,
  bibtex, research_pillar, primary_pillar_id, keywords, is_featured, status
) VALUES (...);

INSERT INTO public.publication_authors (
  publication_id, person_id, author_name, author_order, is_highlighted
) VALUES (...);
```
Apply via Supabase CLI:
```bash
supabase db push --linked
```

### Step 3: Local SQLite Sync
Update [`database/slscm.sqlite`](file:///home/orlab/Minh_ALL/website/database/slscm.sqlite) using SQLite Python API so local dev and offline tests remain functional.

### Step 4: Frontend Data & Build Artifacts Sync
1. Prepend publication to [`web/src/data/slscm_publications.json`](file:///home/orlab/Minh_ALL/website/web/src/data/slscm_publications.json) and [`data/processed/slscm_publications.json`](file:///home/orlab/Minh_ALL/website/data/processed/slscm_publications.json).
2. Increment `total_publications` and `journal_articles` in [`web/src/data/slscm_overview.json`](file:///home/orlab/Minh_ALL/website/web/src/data/slscm_overview.json).
3. Re-export generated build artifacts:
   ```bash
   python3 database/scripts/export_data.py
   ```

### Step 5: Verification & Safety Checks
1. Query remote Supabase database:
   ```bash
   supabase db query --linked "SELECT id, title FROM public.publications WHERE id = '<pub-id>';"
   ```
2. Verify TypeScript build:
   ```bash
   cd web && npm run build
   ```
