---
name: slscm-update-brief
description: >-
  Use this skill whenever creating, updating, or publishing news briefs, academic milestone
  announcements, paper highlights, workshop launches, or student honors for SLSCM Lab. Manages
  bilingual content (EN/VI), updates Supabase events and social posts via migrations, syncs SQLite,
  and updates homepage/events page datasets.
---

# SLSCM Lab — News Briefs & Announcements Skill

This skill defines the operational workflow for authoring, publishing, and synchronizing news briefs, research spotlights, and workshop announcements.

## Display Locations on Website
- **Homepage** (`/`): Top 4 recent briefs appear in the **"News Briefs & Announcements"** section.
- **Events & Briefs Page** (`/events`): Complete archive of news briefs, filterable by categories (`All`, `Workshops & Training`, `Scientific Breakthroughs`, `Scholarships & Placements`, `Project Launches`), with language toggle (EN/VI) and expandable detail views.

---

## Quick Automated Execution

Use the pre-built script [scripts/add_brief.py](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-brief/scripts/add_brief.py):

```bash
python3 .agents/skills/slscm-update-brief/scripts/add_brief.py \
  --id "brief-paper-title-2026" \
  --title "Brief Title in English" \
  --title-vi "Tiêu đề tiếng Việt" \
  --date "2026-09-05" \
  --category "Scientific Breakthrough" \
  --badge "Springer OPSEARCH" \
  --summary "Concise 1-2 sentence overview in English." \
  --summary-vi "Tóm tắt ngắn gọn 1-2 câu tiếng Việt." \
  --content "Comprehensive English background, methodology, and significance." \
  --content-vi "Bối cảnh nghiên cứu, phương pháp giải thuật và ý nghĩa khoa học." \
  --tags "OPSEARCH,Branch-and-Bound,Exact Algorithms" \
  --link "https://doi.org/10.1007/..." \
  --link-label "View Publication" \
  --featured
```

---

## Standard Brief Schema

| Field | Type | Description | Example |
| :--- | :--- | :--- | :--- |
| `id` | `TEXT` | Unique kebab-case ID prefixed with `brief-` | `brief-comosa-2026-acceptance` |
| `title` | `TEXT` | English title | `3 Research Papers Accepted at COMOSA 2026` |
| `title_vi` | `TEXT` | Vietnamese title | `3 Công trình Nghiên cứu được Chấp nhận tại COMOSA 2026` |
| `event_date` | `TEXT` | `YYYY-MM-DD` | `2026-04-15` |
| `category` | `TEXT` | Standard category name | `Scientific Breakthrough`, `Workshops & Training`, `Student Honor & Placement`, `Research Collaboration` |
| `badge` | `TEXT` | Visual badge pill | `Q1 Journal`, `COMOSA 2026`, `SMU Placement` |
| `summary` / `summary_vi` | `TEXT` | 1-2 sentence card teaser | Displayed on Homepage and collapsed card |
| `content_en` / `content_vi` | `TEXT` | Detailed multi-paragraph text | Displayed upon clicking "Read Brief →" |
| `tags` | `TEXT[]` | 2-5 taxonomy hashtags | `['Drone Routing', 'FSTSP', 'Matheuristics']` |
| `link` / `link_label` | `TEXT` | Action link | `https://doi.org/...` / `View Paper DOI` |
| `featured` | `BOOLEAN` | Highlight flag | `true` |

---

## Verification
1. Verify Supabase query:
   ```bash
   supabase db query --linked "SELECT id, title, event_date FROM public.events ORDER BY event_date DESC LIMIT 4;"
   ```
2. Build check:
   ```bash
   cd web && npm run build
   ```
