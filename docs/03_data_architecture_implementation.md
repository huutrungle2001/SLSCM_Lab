# SLSCM Lab Website — Data Architecture Implementation

This document provides a concise overview of the decoupled data architecture implemented for the **SLSCM Lab** web platform, following the specification in [`02_data_architecture.md`](./02_data_architecture.md).

---

## 1. High-Level Architecture Overview

```text
               LOCAL CONTENT MANAGEMENT
                          │
                          ▼
            database/slscm.sqlite  (Single Source of Truth)
                          │
                          ▼
         Build / Export Pipeline (Python Scripts)
         - database/scripts/validate_data.py
         - database/scripts/export_data.py
                          │
                          ▼
         web/src/data/generated/*.json  (Static Build Artifacts)
                          │
                          ▼
         web/src/repositories/*.ts     (Data Access Layer)
                          │
                          ▼
         React Pages & Components      (Pure Presentation & UI)
```

### Core Design Guarantees:
1. **Decoupled Content & Presentation**: SQLite only stores factual information (entities, dates, titles, DOIs, abstracts, relations). It never contains UI-specific classes (Tailwind), grid setups, or colors.
2. **Static-First & Zero Runtime Overhead**: The production build consumes pre-compiled, static JSON build artifacts in `web/src/data/generated/`. No runtime SQLite engine or server required.
3. **Repository Abstraction**: All React pages (`HomePage`, `PublicationsPage`, `ProjectsPage`, etc.) query through `src/repositories/` functions instead of importing JSON files directly.

---

## 2. Directory Structure

```text
website/
├── database/
│   ├── slscm.sqlite                     # Authoritative SQLite SSOT database
│   ├── schema.sql                       # Complete relational DDL schema
│   ├── migrations/                      # Future schema migration scripts
│   └── scripts/
│       ├── import_existing_json.py      # Idempotent migration from raw JSON
│       ├── validate_data.py             # Integrity, foreign keys & unique checks
│       └── export_data.py               # Generates web/src/data/generated/*.json
│
├── web/
│   ├── src/
│   │   ├── data/
│   │   │   └── generated/               # Deterministic JSON build artifacts
│   │   │       ├── overview.json
│   │   │       ├── site_metrics.json
│   │   │       ├── publications.json
│   │   │       ├── people.json
│   │   │       ├── projects.json
│   │   │       ├── seminars.json
│   │   │       ├── events.json
│   │   │       ├── achievements.json
│   │   │       ├── research_pillars.json
│   │   │       └── social_posts.json
│   │   │
│   │   ├── repositories/                # Clean data access layer
│   │   │   ├── publicationRepository.ts
│   │   │   ├── peopleRepository.ts
│   │   │   ├── projectRepository.ts
│   │   │   ├── seminarRepository.ts
│   │   │   ├── eventRepository.ts
│   │   │   ├── achievementRepository.ts
│   │   │   ├── researchPillarRepository.ts
│   │   │   ├── overviewRepository.ts
│   │   │   ├── socialPostRepository.ts
│   │   │   └── index.ts
│   │   │
│   │   ├── pages/                       # UI pages consuming repositories
│   │   └── types/index.ts               # Domain & presentation TypeScript types
│   │
│   └── package.json                     # Scripts for dev, validate, generate, build
│
├── package.json                         # Root monorepo orchestration
└── docs/
    ├── 01_ui_ux_design_system_and_layout.md
    ├── 02_data_architecture.md
    ├── 03_data_architecture_implementation.md
    └── 04_migration_report.md
```

---

## 3. Local Content Management Workflow

Whenever research data, publications, members, or news need to be updated:

```bash
# 1. Update database/slscm.sqlite directly (via DB Browser for SQLite, script, or CLI)

# 2. Validate database integrity & foreign keys
npm run data:validate

# 3. Export clean JSON build artifacts
npm run data:generate

# 4. Preview locally
npm run dev

# 5. Full build verification
npm run build

# 6. Commit and deploy
git add .
git commit -m "feat(data): update publications and lab milestones"
git push
```

---

## 4. Derived Metrics Engine

Derived metrics displayed on the Hero section (total publications, Q1 journals, active grants, scholarships, valedictorians) are **no longer manually maintained**:
- They are dynamically computed in `export_data.py` using SQL aggregate queries (`SELECT COUNT(*) FROM ...`).
- Stored into `web/src/data/generated/site_metrics.json`.
- Served via `getSiteMetrics()` in `overviewRepository.ts`.
