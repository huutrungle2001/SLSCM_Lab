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

---

## 5. Repository Topology & Web Subtree Synchronization

### Architecture
- **Primary Monorepo**: [`huutrungle2001/SLSCM_Lab`](https://github.com/huutrungle2001/SLSCM_Lab)
  - Contains research data, raw intelligence, automation scripts, agents communication logs, and the `web/` application.
- **Dedicated Public Website Repo**: [`slscm-lab/website`](https://github.com/slscm-lab/website)
  - Contains strictly the frontend web codebase (contents of `web/` mapped directly to repo root).

### Synchronization Workflow (Git Subtree + Signed Verified Commits)
Never initialize a nested `.git` inside `web/` (avoids corrupting parent repo tracking with invalid gitlinks). To synchronize updates from `web/` to `slscm-lab/website`:

1. **Remote Configuration**:
   - Remote alias: `slscm-web` -> `https://github.com/slscm-lab/website.git`
2. **Subtree Split, Sign & Push Protocol**:
   ```bash
   # 1. Split web directory into a clean standalone branch
   git subtree split --prefix=web -b web-deploy

   # 2. Re-sign all commits with SSH key to preserve the GitHub "Verified" badge
   git checkout -B web-signed web-deploy
   git rebase --exec 'git commit --amend --no-edit -S' --root

   # 3. Push to slscm-lab/website main using huutrungle2001 credentials
   env -u HTTPS_PROXY -u HTTP_PROXY -u https_proxy -u http_proxy -u ALL_PROXY -u SSL_CERT_FILE \
     git push slscm-web web-signed:main --force

   # 4. Return to master
   git checkout master
   ```
3. **Commit Identity & Signing Invariants**:
   - **Account**: `huutrungle2001` (Admin on both repositories).
   - **Author Name**: `Trung Le Huu` (`huutrungle2001@gmail.com`).
   - **GPG/SSH Signing**: `commit.gpgsign=true`, key `~/.ssh/id_ed25519_huutrungle.pub` — guarantees green **Verified** badge on GitHub.
   - **Network/Proxy Rule**: Always bypass 9Router proxy using `env -u HTTPS_PROXY -u HTTP_PROXY -u https_proxy -u http_proxy -u ALL_PROXY -u SSL_CERT_FILE` for any `gh` or `git` remote operations.

4. **Automated One-Command Sync**:
   - Instead of running manual subtree steps, execute:
     ```bash
     ./scripts/sync_to_production.sh
     ```
   - This script automatically verifies the build, performs the subtree split, signs all commits with the SSH key, pushes to `slscm-lab/website:main`, and switches back to `master`.

---

## 6. Dual-Deployment Environments (Vercel & Live Domains)

The project employs an industry-standard Staging/Dev vs. Production dual-deployment topology under the official Vercel team **`SLSCM-Lab`** (`slscm-lab`):

| Environment | Repository & Branch | Purpose & Scope | Vercel Project | Live URL | Deployment Trigger |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Dev / Staging** | [`huutrungle2001/SLSCM_Lab`](https://github.com/huutrungle2001/SLSCM_Lab)<br>`master` | Research workspace, agent experiments, staging review | `slscm-dev` | [`https://slscm-dev.vercel.app`](https://slscm-dev.vercel.app) | Manual / CLI (`vercel --prod`) |
| **Production** | [`slscm-lab/website`](https://github.com/slscm-lab/website)<br>`main` | Official public showcase, clean frontend, verified commits | `slscm-website` | [`https://slscm-website.vercel.app`](https://slscm-website.vercel.app)<br>[`https://slscm-portal.vercel.app`](https://slscm-portal.vercel.app) | **Automatic** on push to `main` via GitHub Git Integration |

