# SLSCM Lab — Workspace Maintenance Skills

This directory provides standardized Antigravity skills and automated CLI scripts to easily maintain, update, and deploy the SLSCM Lab website.

## Directory Structure

```text
.agents/skills/
├── slscm-update-publication/       # Add & update scientific papers via DOI
│   ├── SKILL.md
│   └── scripts/add_publication.py
├── slscm-update-brief/             # Publish news briefs & announcements
│   ├── SKILL.md
│   └── scripts/add_brief.py
├── slscm-update-topic/             # Manage research pillars & topic keywords
│   ├── SKILL.md
│   └── scripts/update_topics.py
├── slscm-update-member/            # Manage faculty, researchers & alumni
│   └── SKILL.md
└── slscm-deploy-production/        # Automated GitHub Pages & Vercel deployment
    └── SKILL.md
```

## Available Skills & Runbooks

1. [**`slscm-update-publication`**](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-publication/SKILL.md)
   - Automated DOI harvesting (Crossref, OpenAlex, SpringerLink, BibTeX).
   - Resolves and highlights SLSCM Lab authors.
   - Pushes Supabase migration and syncs SQLite & JSON datasets.

2. [**`slscm-update-brief`**](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-brief/SKILL.md)
   - Authors bilingual news briefs (English & Vietnamese).
   - Updates Homepage carousel and Events archive page (`/events`).
   - Syncs Facebook feed digest (`social_posts`).

3. [**`slscm-update-topic`**](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-topic/SKILL.md)
   - Manages research pillars: `supply_chain_optimization`, `ai_supply_chain_intelligence`, `decision_analytics`.
   - Adds topic keywords to `research_keywords.json` and `ResearchTopicsPage.tsx`.

4. [**`slscm-update-member`**](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-member/SKILL.md)
   - Updates faculty, student researchers, and global placements (SMU, LJMU, UConn, Warwick).
   - Enforces avatar fallbacks and bilingual profiles.

5. [**`slscm-deploy-production`**](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-deploy-production/SKILL.md)
   - Verifies frontend build.
   - Runs `./scripts/sync_to_production.sh` to subtree split, re-sign commits with SSH key, and push to GitHub Pages and Vercel.
