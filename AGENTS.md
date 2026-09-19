# AGENTS.md — SLSCM Lab (Smart Logistics & Supply Chain Management)

Welcome, Agent. This document provides instant onboarding, project context, operational constraints, and technical directives for **SLSCM Lab** (Trường Công nghệ, Đại học Kinh tế Quốc dân – NEU). Read this file first before executing any actions.

---

## 0. Role Self-Identification Protocol (Who Am I?)

When an AI agent boots up or re-reads this file, it must deterministically resolve its operational identity before taking any actions:

1. **Check Tmux Session Name**: Run `tmux display-message -p '#S' 2>/dev/null` or inspect `$TMUX_PANE`:
   - If session matches `slscm-oracle` (or running under Antigravity CLI `agym`):
     👉 **YOU ARE THE PROJECT ORACLE (`slscm-oracle`)**.
     - **Mission**: Direct dialog with the user, requirements shaping, research & intelligence synthesis, UI/UX architecture & design specification, and authoring frozen task specs (`.agents/communication/tasks/<task-id>.md`).
     - **Execution Authority**: You are authorized to summon **unlimited parallel subagents** (`spawn_agent` / `invoke_subagent`) to fetch data from Facebook via OmniBrowser, parse HTML/CSV data, extract publications, and build structured directories.
   - If session matches `slscm-hive` (or running under OpenAI Codex CLI `codex` with Terra):
     👉 **YOU ARE THE PROJECT HIVE MIND (`slscm-hive`)**.
     - **Mission**: Supervisory Architect & Quality Gatekeeper. Decompose task specs, summon Gemini Flash worker subagents for frontend component implementation, testing, and git verification.

---

## 1. Project Mission & North Star

We are building a **world-class, modern, and inviting web platform** for **SLSCM Lab (Smart Logistics & Supply Chain Management Lab - Lab Quản trị Logistics và Chuỗi cung ứng thông minh)**, trực thuộc Trường Công nghệ, Đại học Kinh tế Quốc dân (NEU).

### Core Pillars of the Lab:
- **Head of Lab**: **TS. Vũ Đức Minh** (minhvd@neu.edu.vn).
- **Location**: P1613, Tòa nhà A1, Trường Công nghệ, Đại học Kinh tế Quốc dân – 207 Giải Phóng, Hà Nội.
- **Key Academic Collaborators & Faculty**:
  - PGS. TS. Hà Minh Hoàng (Tối ưu hóa, Vận trù học, Heuristics/Exact algorithms)
  - ThS. Tạ Đình Quý (Drone routing, Electric vehicles, FSTSP)
  - Lê Bá Luật, cùng các nghiên cứu sinh và sinh viên tài năng từ NEU, HUST, VNU-HUS.
- **Research Domains**:
  1. **Operational Optimization & Algorithms**: Vehicle routing (VRP, FSTSP), scheduling (machine scheduling, conflict jobs), packing, orienteering problems.
  2. **Optimization in Data Science & Machine Learning**: Metaheuristics, MetaPerceptron, GrafoRVFL, decision-making systems.
  3. **Modern Transportation & Green Supply Chain**: Drones/UAVs, electric vehicles (EVRP-TW), school bus routing under disruptions, facility location.
- **Hall of Fame & Placements**:
  - Sinh viên và thành viên lab đạt thủ khoa toàn trường, thủ khoa chương trình, nhận học bổng PhD tại **Singapore Management University (SMU)**, **Liverpool John Moores University**, **University of Connecticut (UConn)**, v.v.

---

## 2. Aesthetic Benchmark & UI/UX Philosophy

The user specifically requested a **clean, bright, soft, and modern** aesthetic—moving away from dry, bureaucratic academic websites while preserving deep scholarly prestige:

1. **Vibe & Atmosphere**:
   - **Bright & Soft ("Sáng sủa, mềm mại")**: Airy layouts, gentle white/cream surfaces (`#fcfcfd`, `#f8fafc`), subtle soft borders, elegant drop shadows with zero harshness.
   - **Modern Techno-Optimist Influence**:
     - Typography pairing inspired by Techno-Optimist aesthetics:
       - **Primary Sans**: `Onest` (clean, humanist, readable)
       - **Editorial Accent**: `Faculty Glyphic` (for italicized keywords, hero statements, quote callouts)
       - **Telemetry & Metadata**: `JetBrains Mono` (for metrics, paper DOIs, grant IDs, dates)
   - **Color Palette**:
     - Primary: Soft deep navy / ocean slate (`#0f172a`, `#0369a1`)
     - Accents: Emerald mint (`#10b981`), warm amber (`#f59e0b`), soft cyan (`#06b6d4`)
     - Background: Crisp off-white (`#ffffff`, `#f8fafc`, `#f1f5f9`)
2. **Key Sections**:
   - **Hero Section**: Inspiring tagline, dynamic lab metrics badge (publications, scholarships, Q1 journals, research grants), quick exploration chips.
   - **Research Pillars**: Interactive cards detailing Routing & Logistics, Optimization & AI, Green Supply Chain with live visual previews.
   - **Publications & Research Vault**: Searchable, filterable by year (2025-2026), type (Journal Q1/Q2, Book Chapter, Conference CITA/COMOSA/CSONET/SOICT), and author.
   - **People & Mentorship**: TS. Vũ Đức Minh, faculty, PhD/Master students, research alumni with scholarship destinations (SMU, UConn, LJMU).
   - **Lab Life & News Feed**: Integrated updates from Facebook (`facebook.com/slscm.lab`) with real photos, awards, seminars, and student achievements.
   - **Join Us / Opportunities**: Information for prospective undergraduate researchers, graduate students, and industry partners.

---

## 3. Data & Knowledge Base Map

All raw and processed intelligence must be preserved under `data/`:

```text
data/
├── raw/
│   ├── fda_neu_slscm.html                    # Official NEU website scrape
│   ├── labs_info_2025_2026.csv               # University official research report CSV
│   └── facebook_posts/                       # Scraped posts, images, and milestones
├── processed/
│   ├── neu_slscm_content.txt                 # Clean text extract from NEU page
│   ├── slscm_publications_2025_2026.json     # Structured publications catalog
│   ├── slscm_people.json                     # Roster of faculty, researchers, alumni
│   └── slscm_facebook_feed.json              # Curated timeline of lab activities
```

---

## 4. Operational Directives

1. **Unlimited Subagent Spawning**:
   - The primary agent is expected to spawn **unlimited parallel subagents** to accelerate data harvesting, text parsing, CSV cataloging, and style research without cluttering the main thread.
2. **OmniBrowser Protocol**:
   - Interacting with Facebook (`https://www.facebook.com/slscm.lab`) must strictly use OmniBrowser's standard pipeline (`list-tabs ⟶ observe ⟶ act ⟶ observe`).
   - All browser automation connects to Chrome CDP on port `17082`.
