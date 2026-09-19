# TASK: task-001-exhaustive-data-synthesis-and-techno-optimist-design-spec

RECORD_TYPE: TASK
RECORD_ID: task-001-exhaustive-data-synthesis-and-techno-optimist-design-spec
STATUS: TASK_COMPLETED
ATTEMPT: 1
CREATED_AT: 2026-09-19T22:20:00Z
UPDATED_AT: 2026-09-19T22:25:00Z
FROM: hub
TO: oracle

## 1. Objective & Background

Per the user's directive, we are establishing the **SLSCM Lab** web project (Trường Công nghệ, Đại học Kinh tế Quốc dân – NEU).
The initial phase requires:
1. **Exhaustive Data Harvesting & Synthesis**:
   - Ingest and verify all 11+ recent publications (2025-2026) from the official university CSV report (`Handbook of Combinatorial Optimization`, `JORS`, `EJOR`, `Neurocomputing`, `Computer Standards & Interfaces`, `CITA`, `COMOSA`, `CSONET`, `SOICT`).
   - Extract and synthesize all intelligence from the NEU website (`fda.neu.edu.vn/slscm/`) and Facebook (`facebook.com/slscm.lab`), including international collaborations (SMU, UConn, LJMU, Italy, Austria), flagship research grants (Hanoi Urban Drainage & Smart Water AI/OR project), and student mentorship milestones.
2. **Aesthetic Direction & Layout Conception**:
   - Formulate a tailored **Techno-Optimist Inspired Visual Language**:
     - *Tone*: Sáng sủa, mềm mại, hiện đại, học thuật uy tín nhưng giàu sức sống ("bớt khô khan academic").
     - *Typography*: `Onest` (sans), `Faculty Glyphic` (editorial italics for paper titles, philosophies, and callouts), `JetBrains Mono` (telemetry, DOIs, dates, grant IDs).
     - *Color Palette*: Soft light aesthetic, gentle warm-white & off-white cards, subtle borders, soft oceanic slate (`#0369a1`), emerald mint (`#10b981`), warm amber (`#f59e0b`).
     - *Bố cục (Layout)*:
       - Header & Live Telemetry: Lab status, location badge (P1613 A1 NEU), quick navigation.
       - Hero Section: Human-centric, empowering tagline, live stats (11+ publications, Q1 papers, PhD placements, international collaborations).
       - Research Pillars: 3 interactive cards (Operational Optimization, AI/ML Metaheuristics, Green Transport & Drones/EVs).
       - Interactive Publications Vault: Multi-tag search & filter (All, Q1/Q2 Journals, Books, Conferences, by Year).
       - People & Global Placements: Leadership (TS. Vũ Đức Minh, PGS. TS. Hà Minh Hoàng), researchers, student hall of fame (SMU, UConn, LJMU).
       - Lab Life & News Digest: Real-time Facebook feed cards with photos, recruitment callouts, and seminars.
       - Join Lab / Industry Contact: Call-to-action for Gen Z students and industrial partners.

---

## 2. File Ownership & Scope

The agent has write ownership of:
- `data/processed/*.json`: Structured data files.
- `docs/01_ui_ux_design_system_and_layout.md`: Detailed UI/UX design blueprint and component layout specification.
- `.agents/communication/tasks/task-001-exhaustive-data-synthesis-and-techno-optimist-design-spec.md`
- `.agents/communication/results/task-001-exhaustive-data-synthesis-and-techno-optimist-design-spec.md`

---

## 3. Mandatory Subagent Delegation Instruction

Under the Workbench Multi-Agent Protocol:
The Oracle agent (`slscm-oracle` running in `agym`) is explicitly instructed to:
1. **Summon unlimited parallel subagents** (`spawn_agent` / `invoke_subagent`) to divide and conquer:
   - Subagent A: Synthesize and validate comprehensive publications catalog and author mappings.
   - Subagent B: Synthesize faculty, student roster, and scholarship destinations.
   - Subagent C: Author the complete UI/UX Design System Specification in `docs/01_ui_ux_design_system_and_layout.md` with responsive layouts, color tokens, and font pairings.
2. Review subagent outputs, verify JSON schema validity with exit code 0, and commit the results.

---

## 4. Acceptance Criteria

- **AC-1 (Data Completeness)**: Comprehensive structured knowledge vault in `data/processed/` covering all publications, research domains, personnel, and Facebook highlights.
- **AC-2 (Design System & Layout Spec)**: Complete architectural document in `docs/01_ui_ux_design_system_and_layout.md` defining typography, soft color palette, wireframes, and component hierarchy.
- **AC-3 (Verification)**: Python validation script confirming all JSON datasets are valid, non-empty, and consistent.
