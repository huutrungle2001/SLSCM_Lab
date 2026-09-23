# SLSCM Lab Website — Data Architecture Refactor Specification

## 1. Objective

Refactor the SLSCM Lab website so that **static content is decoupled from page structure and UI implementation**.

The main goal is:

> Future changes to the website structure, page layout, components, routing, or visual design should require little or no modification to the underlying research/content data.

The website should remain suitable for static deployment (e.g. GitHub Pages), while local content management should become more structured and maintainable.

The preferred architecture is:

```text
SQLite database
    ↓
build/export pipeline
    ↓
generated frontend data
    ↓
repository/data-service layer
    ↓
React pages/components
```

SQLite is the **single source of truth** for content.

The frontend should **not depend directly on SQLite at runtime** unless there is a strong technical reason to do so.

---

## 2. Current Situation

The current React/TypeScript project stores content directly in multiple JSON files such as:

```text
slscm_overview.json
slscm_people.json
slscm_projects.json
slscm_publications_2025_2026.json
slscm_seminars.json
slscm_events.json
```

Pages and components import these JSON files directly.

Example:

```ts
import overviewData from '../data/slscm_overview.json';
import projectsData from '../data/slscm_projects.json';
import seminarsData from '../data/slscm_seminars.json';
```

This works for a small static site, but creates increasing coupling between:

- content storage;
- JSON structure;
- TypeScript types;
- page implementation;
- homepage-specific data;
- presentation logic.

The refactor should reduce this coupling.

---

# 3. Target Architecture

Use the following layered architecture:

```text
                    LOCAL CONTENT MANAGEMENT
                             │
                             ▼
                       slscm.sqlite
                   SINGLE SOURCE OF TRUTH
                             │
                             ▼
                    data export / build
                             │
                             ▼
                    generated data files
                             │
                             ▼
                  repository / data service
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
          HomePage       PeoplePage   PublicationsPage
              │              │              │
              └──────────────┴──────────────┘
                             │
                             ▼
                      React presentation
```

The important separation is:

```text
SQLite       = facts and content
Repository   = queries and data transformation
React        = presentation and interaction
Assets       = images, logos, PDFs, slides
```

---

# 4. Core Design Principle

The database must describe **what the content is**, not **how a page displays it**.

For example, SQLite may contain:

```text
Supply Chain & Logistics Optimization
Advancing operations research and mathematical optimization...
```

React may define:

```ts
{
  icon: '🚚',
  color: 'sky',
  layout: 'card'
}
```

Do not store UI-specific properties such as:

```text
Tailwind class names
grid positions
card styles
animation names
font sizes
page section order
React component names
responsive breakpoints
```

inside SQLite.

---

# 5. Content That Should Be Stored in SQLite

The database should contain reusable domain entities.

Recommended primary entities:

```text
publications
people
projects
seminars
events
achievements
research_pillars
institutions
partners
```

Additional relationship tables should be used where appropriate.

---

# 6. Recommended Database Schema

The exact implementation may be adjusted after inspecting the complete project, but the architecture should follow this model.

## 6.1 Publications

```text
publications
------------
id
title
year
venue_id
type
doi
url
abstract
bibtex
research_pillar_id
is_featured
status
```

Use stable semantic IDs, for example:

```text
fstsp-alns-2026
evrptw-equity-2026
cmsa-multidrop-2026
```

Avoid IDs based only on array position such as:

```text
paper_1
paper_2
paper_3
```

---

## 6.2 People

```text
people
------
id
name
title
role
affiliation_id
email
office
bio
avatar
status
display_order
```

Example stable ID:

```text
vu-duc-minh
tran-nam-khanh
mai-thanh-tien
```

Do not store the image itself in SQLite.

Store only the asset path:

```text
/assets/images/people/vu_duc_minh.jpg
```

---

## 6.3 Projects

```text
projects
--------
id
title
category
sponsor
grant_code
start_date
end_date
status
research_domain
description
methodology
collaboration
```

Potential relationship tables:

```text
project_members
project_publications
project_tags
project_research_pillars
```

---

## 6.4 Seminars

```text
seminars
--------
id
title
speaker_person_id
speaker_name
affiliation_id
date
time
venue
venue_type
status
category
track
abstract
slides_url
recording_url
```

The schema should support both:

- internal speakers already present in `people`;
- external speakers not stored as full people records.

---

## 6.5 Events / News / Briefs

Use one general content table unless there is a strong reason to split news and announcements.

```text
events
------
id
title
event_date
category
summary
content
url
featured
status
```

Potential categories:

```text
publication
achievement
announcement
workshop
seminar
award
collaboration
```

Tags should preferably use a relation table rather than comma-separated text.

---

## 6.6 Achievements / Hall of Fame

```text
achievements
------------
id
person_id
achievement_type
title
institution_id
country
year
field
description
featured
```

Examples:

```text
Valedictorian
PhD Scholarship
Master Scholarship
Best Paper
Student Research Award
```

This data should power Hall of Fame / Alumni / homepage achievement previews without duplicating content.

---

## 6.7 Research Pillars

Use the current three pillars:

```text
supply_chain_optimization
ai_supply_chain_intelligence
decision_analytics
```

Suggested structure:

```text
research_pillars
----------------
id
title
description
display_order
status
```

Current titles:

```text
Supply Chain & Logistics Optimization

AI & Data-Driven Supply Chain Intelligence

Optimization & Decision Analytics for Complex Systems
```

UI metadata such as the following should stay in React:

```text
🚚
📡
🧭

sky
emerald
amber
```

---

## 6.8 Institutions

Institutions appear repeatedly across:

- people;
- collaborators;
- scholarships;
- achievements;
- seminars;
- projects.

Normalize them where practical.

```text
institutions
------------
id
name
short_name
country
city
website
```

Example:

```text
neu
hust
vnu-hus
smu
ljmu
uconn
usf
vinuni
```

---

# 7. Relationship Tables

Prefer normalized relationships instead of copying repeated strings.

Examples:

```text
publication_authors
-------------------
publication_id
person_id
author_name
author_order
is_highlighted
```

The `author_name` fallback is useful for authors who do not have a full profile in the lab database.

Other useful relations:

```text
project_members
project_publications
person_research_pillars
publication_tags
project_tags
event_tags
achievement_people
```

Do not over-normalize simple content unnecessarily.

The database should remain easy to edit locally.

---

# 8. Metrics and Derived Values

Do not manually store values that can reliably be calculated from source data.

For example, avoid maintaining:

```json
{
  "total_publications": 18
}
```

if it can be calculated with:

```sql
SELECT COUNT(*)
FROM publications;
```

Likewise:

```sql
SELECT COUNT(*)
FROM publications
WHERE quartile = 'Q1';
```

or:

```sql
SELECT COUNT(*)
FROM projects
WHERE status = 'Active';
```

This prevents inconsistencies between detail data and homepage metrics.

Only store manually maintained metrics when they cannot reasonably be derived.

Possible table:

```text
site_metrics
------------
key
value
year
description
```

Use this only when necessary.

---

# 9. Static Assets

Keep large/static binary assets outside the database.

Recommended structure:

```text
public/
└── assets/
    ├── images/
    │   ├── people/
    │   ├── projects/
    │   ├── events/
    │   └── branding/
    ├── documents/
    └── slides/
```

SQLite stores paths or URLs only.

Example:

```text
avatar = /assets/images/people/vu_duc_minh.jpg
```

Do not store images as SQLite BLOBs unless explicitly required.

---

# 10. Do Not Make SQLite Page-Specific

Avoid tables such as:

```text
homepage_section_1
homepage_card_1
people_page_block
publication_page_row
```

These tightly couple content to a particular UI design.

Instead, pages should query reusable entities.

Example homepage behavior:

```text
Latest / featured publications
Active projects
Upcoming / recent seminars
Recent events
Featured achievements
Research pillars
```

The homepage decides how many records to show.

For example:

```ts
getFeaturedPublications(4)
getActiveProjects(3)
getRecentEvents(4)
getFeaturedAchievements(3)
```

The database should not contain:

```text
homepage_publication_1
homepage_publication_2
```

---

# 11. Repository / Data Service Layer

React pages should not import generated data files directly throughout the application.

Create a repository/data-access layer.

Suggested structure:

```text
src/
├── data/
│   └── generated/
│       ├── publications.json
│       ├── people.json
│       ├── projects.json
│       ├── seminars.json
│       ├── events.json
│       ├── achievements.json
│       └── research_pillars.json
│
├── repositories/
│   ├── publicationRepository.ts
│   ├── peopleRepository.ts
│   ├── projectRepository.ts
│   ├── seminarRepository.ts
│   ├── eventRepository.ts
│   ├── achievementRepository.ts
│   └── researchPillarRepository.ts
│
├── pages/
└── components/
```

Example API:

```ts
getPublications()
getFeaturedPublications(limit)
getPublicationById(id)

getPeople()
getActiveResearchers()
getPersonById(id)

getProjects()
getActiveProjects(limit)

getRecentEvents(limit)
getUpcomingSeminars(limit)

getResearchPillars()

getAchievements()
getFeaturedAchievements(limit)
```

Pages should use repository functions rather than knowing where the data comes from.

For example:

```ts
const papers = getFeaturedPublications(4);
```

instead of:

```ts
import publicationsData from '../data/slscm_publications_2025_2026.json';
```

This abstraction is important because the storage implementation may later change from:

```text
generated JSON
```

to:

```text
SQLite WASM
REST API
Supabase
PostgreSQL
```

without requiring a major page rewrite.

---

# 12. Recommended Runtime Strategy

For the current SLSCM website, prefer:

```text
SQLite → generated JSON → React
```

over:

```text
React → SQLite WASM at runtime
```

Reason:

- static GitHub Pages remains simple;
- no SQLite WASM initialization;
- no database download before rendering;
- smaller frontend complexity;
- easier debugging;
- better compatibility with static deployment;
- SQLite still remains the local source of truth.

---

# 13. Build / Export Pipeline

Add a script that exports SQLite into frontend-friendly generated JSON.

Suggested structure:

```text
database/
├── slscm.sqlite
├── schema.sql
├── migrations/
└── scripts/
    ├── export_data.py
    └── validate_data.py
```

Possible commands:

```bash
npm run data:validate
npm run data:generate
npm run build
```

Recommended build sequence:

```text
1. Validate SQLite
2. Export generated JSON
3. Run TypeScript checks
4. Build React application
```

Example `package.json` idea:

```json
{
  "scripts": {
    "data:validate": "python database/scripts/validate_data.py",
    "data:generate": "python database/scripts/export_data.py",
    "build": "npm run data:validate && npm run data:generate && vite build"
  }
}
```

Adjust for the actual framework/build system.

---

# 14. Generated Files

Generated JSON files are build artifacts.

Example:

```text
src/data/generated/
├── publications.json
├── people.json
├── projects.json
├── seminars.json
├── events.json
├── achievements.json
├── research_pillars.json
└── site_metrics.json
```

Do not manually edit these files.

Add an explanatory header where technically possible, or document clearly:

> GENERATED FILE — DO NOT EDIT DIRECTLY.

The source of truth is:

```text
database/slscm.sqlite
```

---

# 15. Validation

Create a validation script before exporting.

At minimum verify:

## Stable IDs

All IDs must be unique.

```text
people.id
publications.id
projects.id
events.id
seminars.id
achievements.id
```

## Foreign Keys

Verify referenced IDs exist.

Examples:

```text
publication.research_pillar_id
achievement.person_id
project_publications.publication_id
project_members.person_id
```

## Required Fields

Examples:

```text
publication.title
publication.year

person.name

event.title
event.date
```

## Asset Paths

Optionally check that local asset files referenced by the database exist.

## Duplicate DOI

Publication DOI should normally be unique when present.

---

# 16. TypeScript Types

Separate domain types from UI types.

Example:

```ts
export type ResearchPillarId =
  | 'supply_chain_optimization'
  | 'ai_supply_chain_intelligence'
  | 'decision_analytics';
```

Be careful with the existing legacy `PillarId`.

The existing website currently uses:

```ts
export type PillarId =
  | 'operational_optimization'
  | 'ml_optimization'
  | 'green_transportation';
```

and `Publication.research_pillar` may still depend on it.

Do not blindly replace the legacy type until all publication data has been audited and migrated.

A safe migration is:

```ts
export type LegacyPublicationPillarId =
  | 'operational_optimization'
  | 'ml_optimization'
  | 'green_transportation';

export type ResearchPillarId =
  | 'supply_chain_optimization'
  | 'ai_supply_chain_intelligence'
  | 'decision_analytics';
```

Then migrate publication taxonomy deliberately.

Do not create silent casts merely to suppress TypeScript errors.

---

# 17. Homepage Refactor

The homepage should consume repository functions.

Desired conceptual implementation:

```ts
const researchPillars = getResearchPillars();
const featuredProjects = getActiveProjects(3);
const featuredSeminars = getRecentSeminars(3);
const featuredEvents = getRecentEvents(4);
const featuredPapers = getFeaturedPublications(4);
```

The homepage should contain only UI-specific metadata such as:

```ts
const pillarUI = {
  supply_chain_optimization: {
    icon: '🚚',
    color: '...'
  },

  ai_supply_chain_intelligence: {
    icon: '📡',
    color: '...'
  },

  decision_analytics: {
    icon: '🧭',
    color: '...'
  }
};
```

Descriptions and titles should come from the content layer.

---

# 18. Preserve Existing UI During Initial Migration

The first phase should focus on **data architecture**, not redesign.

Important requirement:

> Preserve the existing visual appearance, routing behavior, page structure, and user-facing functionality as much as possible while replacing the underlying data flow.

Do not unnecessarily redesign:

```text
HomePage
PeoplePage
PublicationsPage
ProjectsPage
SeminarsPage
EventsPage
Alumni / Hall of Fame
```

until the new data architecture is working.

---

# 19. Migration Strategy

Use incremental migration.

## Phase 1 — Audit

Inspect:

```text
src/data/
src/types.ts
src/pages/
src/components/
```

Identify:

- duplicated records;
- inconsistent field names;
- legacy taxonomy;
- page-specific content;
- currently unused data;
- hard-coded content that should move to SQLite.

Do not migrate UI text that is inherently presentation-specific.

---

## Phase 2 — Create SQLite Schema

Create:

```text
database/slscm.sqlite
database/schema.sql
```

Enable foreign keys:

```sql
PRAGMA foreign_keys = ON;
```

Create core tables first.

---

## Phase 3 — Import Existing JSON

Write migration/import scripts rather than manually re-entering all data.

Example:

```text
database/scripts/import_existing_json.py
```

Import current JSON files into SQLite.

Preserve IDs wherever possible.

Generate a migration report for:

- missing fields;
- conflicting IDs;
- duplicate records;
- unmatched relations.

---

## Phase 4 — Export Layer

Create:

```text
database/scripts/export_data.py
```

Generate frontend-ready data.

Do not make generated JSON unnecessarily mirror the raw SQL schema.

It may return convenient domain objects.

For example, a publication can be exported as:

```json
{
  "id": "paper-id",
  "title": "...",
  "authors": [
    {
      "id": "vu-duc-minh",
      "name": "Duc Minh Vu"
    }
  ],
  "venue": "...",
  "year": 2026
}
```

This keeps React simple.

---

## Phase 5 — Repository Layer

Replace direct JSON imports with repository calls.

Do this page by page.

Recommended order:

```text
Research Pillars
Homepage
Publications
Projects
Seminars
Events
People
Achievements / Hall of Fame
```

---

## Phase 6 — Remove Legacy Data Dependency

Only after all pages use the repository layer:

- remove obsolete manually maintained JSON;
- keep generated JSON only;
- remove duplicate page data;
- update documentation.

---

# 20. Local Editing Workflow

Desired future workflow:

```text
1. Edit slscm.sqlite locally
2. Run validation
3. Run data generation
4. Preview website locally
5. Commit
6. Push to GitHub
7. GitHub Pages rebuilds
```

Example:

```bash
npm run data:validate
npm run data:generate
npm run dev
```

Then:

```bash
git add .
git commit -m "Update SLSCM content"
git push
```

---

# 21. Local Database Editing

The architecture should support common SQLite tools such as:

```text
DB Browser for SQLite
SQLiteStudio
Python sqlite3
command-line sqlite3
```

No custom admin UI is required in the first version.

An admin interface may be added later without changing the core schema.

---

# 22. Git Strategy

It is acceptable to keep:

```text
database/slscm.sqlite
```

inside the Git repository because this is a small, version-controlled, static content database.

However:

- avoid storing temporary WAL files;
- ignore editor/SQLite temporary files;
- keep database size reasonable.

Recommended `.gitignore` additions:

```gitignore
*.sqlite-shm
*.sqlite-wal
*.db-journal
```

The generated JSON files may either:

### Option A — Commit generated JSON

Pros:

- transparent diff;
- GitHub Pages build is simple.

### Option B — Generate during CI/build

Pros:

- no duplicated generated files in Git.

For this project, either is acceptable.

Prefer CI generation if the deployment pipeline supports Python reliably.

Otherwise commit generated files after validation.

---

# 23. Compatibility Requirements

The refactor must preserve:

- React + TypeScript;
- current routing;
- static deployment;
- existing image paths;
- existing page URLs;
- existing content unless explicitly changed;
- responsive layout;
- publication links;
- event links;
- people/alumni navigation.

Do not introduce a server requirement.

---

# 24. What Should Remain in React

Keep these in React/component configuration:

```text
icons
colors
Tailwind classes
responsive grid behavior
component selection
animations
navigation labels
CTA layout
section layout
card variants
```

Example:

```ts
const pillarPresentation = {
  supply_chain_optimization: {
    icon: '🚚',
    accent: 'sky'
  },
  ai_supply_chain_intelligence: {
    icon: '📡',
    accent: 'emerald'
  },
  decision_analytics: {
    icon: '🧭',
    accent: 'amber'
  }
};
```

---

# 25. What Should Move Out of React

Move reusable factual content to SQLite:

```text
publication metadata
people profiles
research pillar titles/descriptions
project information
seminar information
event/news content
achievements
institution information
collaborations
research interests
tags
DOIs
abstracts
BibTeX
```

Avoid hard-coding these repeatedly in components.

---

# 26. Content vs Presentation Test

When deciding where a field belongs, ask:

> If the website were completely redesigned tomorrow, would this information still exist?

If yes, it probably belongs in SQLite.

Examples:

```text
Publication title      → SQLite
Publication DOI        → SQLite
Researcher affiliation → SQLite
Project sponsor        → SQLite
Achievement year       → SQLite
```

If no, it probably belongs in React.

Examples:

```text
blue card              → React
3-column grid          → React
truck icon             → React
hover effect           → React
homepage section order → React
```

---

# 27. Avoid Overengineering

This remains a relatively small academic laboratory website.

Do not introduce:

```text
microservices
GraphQL
complex CMS infrastructure
runtime authentication
server-side database APIs
distributed caching
state-management frameworks purely for content
```

unless the project already requires them.

Prioritize:

```text
simple
predictable
maintainable
type-safe
static-deployment friendly
```

---

# 28. Desired Project Structure

Suggested final structure:

```text
project/
│
├── database/
│   ├── slscm.sqlite
│   ├── schema.sql
│   ├── migrations/
│   └── scripts/
│       ├── import_existing_json.py
│       ├── validate_data.py
│       └── export_data.py
│
├── public/
│   └── assets/
│       ├── images/
│       ├── documents/
│       └── slides/
│
├── src/
│   ├── components/
│   ├── pages/
│   ├── repositories/
│   ├── data/
│   │   └── generated/
│   ├── types/
│   └── ...
│
├── package.json
└── README.md
```

Adapt paths to the current repository rather than restructuring unnecessarily.

---

# 29. Acceptance Criteria

The refactor is complete when all of the following are true.

### Data

- SQLite is the authoritative content source.
- Existing content has been migrated without unintended loss.
- Stable IDs are used.
- Core relationships are normalized where appropriate.
- Duplicate factual content is minimized.

### Build

- One command can validate/export/build.
- Generated data is deterministic.
- Build fails clearly when required data is invalid.
- Static deployment still works.

### Frontend

- Pages no longer depend directly on manually maintained content JSON.
- Repository/data-service functions provide content.
- Existing visual behavior is preserved.
- UI metadata remains outside SQLite.

### Maintainability

Changing a page layout should not require schema changes.

Changing:

```text
cards → list
grid → tabs
homepage → redesigned homepage
```

should leave the content database unchanged.

Adding a new publication should require changing content only, not page code.

---

# 30. Important Initial Constraint

Do **not** immediately migrate or rename all existing research-pillar values used by publications.

There are currently two concepts:

### Legacy publication taxonomy

```text
operational_optimization
ml_optimization
green_transportation
```

### New lab research pillars

```text
supply_chain_optimization
ai_supply_chain_intelligence
decision_analytics
```

Audit how the old publication taxonomy is used before consolidating them.

If appropriate, introduce an explicit mapping later.

Example:

```text
operational_optimization
    → supply_chain_optimization

ml_optimization
    → ai_supply_chain_intelligence

green_transportation
    → supply_chain_optimization
      OR another pillar depending on each publication
```

Do not apply the third mapping automatically without reviewing individual papers.

---

# 31. Deliverables Requested from Antigravity

Please produce:

1. `database/schema.sql`
2. `database/slscm.sqlite`
3. migration/import script for existing JSON
4. database validation script
5. SQLite → generated JSON export script
6. repository/data-service layer
7. updated TypeScript domain types
8. refactored pages using repositories
9. updated build scripts
10. `.gitignore` updates if needed
11. short architecture documentation
12. migration report describing:
   - imported records;
   - duplicates;
   - missing data;
   - unresolved relationships;
   - taxonomy conflicts;
   - any assumptions made.

---

# 32. Implementation Priority

Prioritize correctness and backward compatibility over redesign.

Recommended priority:

```text
1. Audit current project
2. Preserve current behavior
3. Build SQLite schema
4. Migrate existing data
5. Validate data
6. Add export pipeline
7. Add repository layer
8. Refactor pages
9. Verify production build
10. Remove obsolete duplication
```

The final result should make content management independent from future UI redesigns while keeping the website simple to deploy and maintain.
