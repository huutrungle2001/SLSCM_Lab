# TASK: task-002-techno-optimist-web-frontend

RECORD_TYPE: TASK
RECORD_ID: task-002-techno-optimist-web-frontend
STATUS: TASK_READY
ATTEMPT: 1
CREATED_AT: 2026-09-19T22:30:00Z
UPDATED_AT: 2026-09-19T22:30:00Z
FROM: oracle
TO: hive
BASE_COMMIT: cc02aef

## 1. Objective & Background

Per the approved Master Design System in `docs/01_ui_ux_design_system_and_layout.md` and synthesized datasets in `data/processed/*.json`, `slscm-hive` is tasked with implementing the full-featured, responsive, production-ready web application for **SLSCM Lab (Smart Logistics & Supply Chain Management Lab - NEU)** inside directory `web/`.

### Core Requirements:
1. **Technology Stack**:
   - Next.js 14+ (App Router) or Vite + React 18, TypeScript, Tailwind CSS, Lucide React, Framer Motion.
   - Typography: Load `Onest`, `Faculty Glyphic`, and `JetBrains Mono` from Google Fonts.
2. **Aesthetic North Star ("Sáng sủa, Mềm mại")**:
   - Light, airy, breathable background surfaces (`#ffffff`, `#f8fafc`, `#f1f5f9`).
   - Soft borders (`border-slate-200/80`), subtle layered ambient shadows, rounded cards (`rounded-2xl`, `rounded-3xl`).
   - Palette accents: Oceanic slate (`#0369a1`, `#0284c7`), emerald mint (`#10b981`), cyan (`#06b6d4`), amber (`#f59e0b`).
3. **9 Key Interactive Sections**:
   - **Section 1 (Navbar & Telemetry Ribbon)**: Room P1613 A1 NEU badge, Hanoi clock, quick navigation links.
   - **Section 2 (Hero "The Optimizing Frontier")**: Inspiring editorial title, dynamic metric counters (19 publications, 11 Q1 papers, 3 PhD placements, 4 active projects), CTA buttons.
   - **Section 3 (3 Interactive Research Pillars)**:
     - Operational Optimization & Algorithmic Design
     - Optimization in Data Science & Machine Learning
     - Modern Transportation & Green Supply Chain
   - **Section 4 (Flagship Real-World Projects)**: Hanoi Smart Water Network (AI & OR ngập úng / cấp nước), Revisit FSTSP Drone Routing, VINIF Facility Location.
   - **Section 5 (Interactive Publications Vault)**: Instant search bar, filters by year (2025/2026), type (Q1 Journal, Book, Conference), research pillar, and 1-click BibTeX copy modal.
   - **Section 6 (Mentorship, People & Hall of Fame)**: TS. Vũ Đức Minh, PGS. TS. Hà Minh Hoàng, researchers, and global scholars (SMU, UConn, LJMU).
   - **Section 7 (Lab Life & Facebook Digest)**: Real-time cards from Facebook feed (`slscm_facebook_posts.json`).
   - **Section 8 (Join Us / Prospective Students Portal)**: Recruitment guidelines for undergraduate researchers and industry contact.
   - **Section 9 (Institutional Footer)**: NEU College of Technology, FDA info, location map.

---

## 2. File Ownership & Scope

The implementer (`slscm-hive` / Codex) has write ownership of:
- `web/`: Next.js frontend application (package.json, tsconfig.json, tailwind.config.ts, app/, components/, public/).
- `.agents/communication/results/task-002-techno-optimist-web-frontend.md`: Result record.

---

## 3. Mandatory Subagent Delegation Instruction (Iron Invariant)

Under the Workbench Multi-Agent Protocol:
The Hive Mind Lead (`cx/gpt-5.6-terra`) acts as **Supervisory Architect & Quality Gatekeeper**.
You MUST NOT perform bulk code authoring directly on your main thread.
You MUST summon worker subagents via `spawn_agent` with model `'ag/gemini-3.8-flash-high'` to:
1. Scaffold `web/` with Next.js, Tailwind CSS, typography, and motion configurations.
2. Build reusable UI components (`Navbar`, `Hero`, `ResearchPillars`, `PublicationsVault`, `PeopleRoster`, `FacebookFeed`, `Footer`).
3. Integrate verified data from `data/processed/*.json`.
4. Execute `npm --prefix web run build` and ensure zero build errors or warnings.
5. Audit diffs and commit the completed result to git.

---

## 4. Acceptance Criteria

- **AC-1 (Design System Fidelity)**: Exact adherence to `docs/01_ui_ux_design_system_and_layout.md` with Onest, Faculty Glyphic, JetBrains Mono, and soft color palette.
- **AC-2 (Functional Publications Vault)**: Full filtering and search across all 19 publications with BibTeX copy.
- **AC-3 (Build Verification)**: `npm --prefix web run build` succeeds with exit code 0.
