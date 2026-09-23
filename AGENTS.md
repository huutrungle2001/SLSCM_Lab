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
- **Dedicated Public Website Repo**: [`slscm-lab/slscm-lab.github.io`](https://github.com/slscm-lab/slscm-lab.github.io)
  - Contains strictly the frontend web codebase (contents of `web/` mapped directly to repo root).
  - Deploys automatically to **GitHub Pages** (`https://slscm-lab.github.io`) and **Vercel** (`https://slscm-lab.vercel.app`).

### Synchronization Workflow (Git Subtree + Signed Verified Commits)
Never initialize a nested `.git` inside `web/` (avoids corrupting parent repo tracking with invalid gitlinks). To synchronize updates from `web/` to `slscm-lab/slscm-lab.github.io`:

1. **Remote Configuration**:
   - Remote alias: `slscm-web` -> `https://github.com/slscm-lab/slscm-lab.github.io.git`
2. **Subtree Split, Sign & Push Protocol**:
   ```bash
   # 1. Split web directory into a clean standalone branch
   git subtree split --prefix=web -b web-deploy

   # 2. Re-sign all commits with SSH key to preserve the GitHub "Verified" badge
   git checkout -B web-signed web-deploy
   git rebase --exec 'git commit --amend --no-edit -S' --root

   # 3. Push to slscm-lab/slscm-lab.github.io main using huutrungle2001 credentials
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
   - This script automatically verifies the build, performs the subtree split, signs all commits with the SSH key, pushes to `slscm-lab/slscm-lab.github.io:main`, and switches back to `master`.

---

## 6. Multi-Platform Deployment Architecture (GitHub Pages, Vercel & Staging)

The project employs an industry-standard dual-hosting production pipeline alongside a dedicated staging environment:

| Environment | Platform | Repository & Branch | Purpose & Scope | Live URL | Deployment Trigger |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Production (Academic)** | **GitHub Pages** | [`slscm-lab/slscm-lab.github.io`](https://github.com/slscm-lab/slscm-lab.github.io)<br>`main` | Official institutional showcase & academic portal | 🌐 [**https://slscm-lab.github.io**](https://slscm-lab.github.io) | **Automatic** on push via GitHub Actions (`deploy-pages.yml`) |
| **Production (Edge)** | **Vercel** | [`slscm-lab/slscm-lab.github.io`](https://github.com/slscm-lab/slscm-lab.github.io)<br>`main` | High-performance CDN & edge delivery | 🚀 [**https://slscm-lab.vercel.app**](https://slscm-lab.vercel.app) | **Automatic** on push via Vercel Git Integration |
| **Dev / Staging** | **Vercel** | [`huutrungle2001/SLSCM_Lab`](https://github.com/huutrungle2001/SLSCM_Lab)<br>`master` | Research monorepo, agent experiments, staging review | 🔗 [**https://slscm-dev.vercel.app**](https://slscm-dev.vercel.app) | **Automatic** on push via GitHub Actions (`deploy-staging.yml`) |

---

## 7. Authentic Academic Abstract Retrieval Protocol (DOI & Publisher Pipeline)

Whenever publications are cataloged, updated, or verified in `data/processed/` or `web/src/data/`, agents must adhere to the **Academic Abstract Harvesting Protocol** to ensure 100% authentic, author-written abstracts (no fabricated summaries or truncated placeholders):

### 1. The Multi-Tier Retrieval Hierarchy
When given a publication DOI (e.g., `10.1287/ijoc.2025.1150`, `10.1111/itor.70177`, `10.1016/j.trc.2026.105906`, `10.1007/978-3-032-00972-2_6`):
1. **Tier 1 — Crossref API (`api.crossref.org`)**:
   - Query: `https://api.crossref.org/works/{doi}` with polite header `User-Agent: SLSCMBot/1.0 (mailto:minhvd@neu.edu.vn)`.
   - Inspect `message.abstract`. If present, strip JATS/XML tags (`<jats:p>`, `&lt;jats:p&gt;`, etc.) to retain clean plain text.
2. **Tier 2 — OpenAlex API (`api.openalex.org`)**:
   - Query: `https://api.openalex.org/works/doi:{doi}`.
   - Reconstruct abstract from `abstract_inverted_index` by sorting `(position, word)` pairs:
     ```python
     word_positions = [(pos, word) for word, positions in inv_index.items() for pos in positions]
     abstract = " ".join(word for _, word in sorted(word_positions))
     ```
3. **Tier 3 — Publisher Landing Page Scraping / Web Fetch**:
   - **Springer / SpringerLink (`link.springer.com`)**: Resolve DOI to chapter/article page. Fetch HTML and extract text inside `<div class="c-article-section__content" id="Abs1-content">` or `<meta name="dc.description">`.
   - **INFORMS PubsOnline (`pubsonline.informs.org`)**: Inspect Crossref abstract or extract `<div class="abstractSection abstractInFull">`.
   - **Wiley Online Library (`onlinelibrary.wiley.com`)**: Crossref and OpenAlex provide full author abstracts directly.
   - **Elsevier / ScienceDirect (`sciencedirect.com`)**: Resolve PII from DOI redirection (`https://linkinghub.elsevier.com/retrieve/pii/{PII}`). Fetch via browser automation (OmniBrowser / CDP port `17082`), ResearchGate, publisher repository READMEs (e.g. author GitHub repos), or open preprint servers (arXiv / SSRN).
4. **Tier 4 — Content Negotiation with DOI**:
   - Use `curl -sLH "Accept: application/x-bibtex" https://doi.org/{doi}` to verify official venue, volume, issue, year, and exact author list.
   - Use `curl -sLH "Accept: application/vnd.citationstyles.csl+json" https://doi.org/{doi}` for structured CSL metadata.

### 2. Sanitization & Storage Directives
- **XML Tag Stripping**: Never leave raw HTML/XML tags (such as `<jats:title>`, `<jats:p>`, `&lt;jats:p&gt;`, `&amp;`) in JSON fields.
- **English Purity**: Preserve exact author phrasing; keep abstracts purely in English.
- **Dual Persistence**: Update both `data/processed/<file>.json` and `web/src/data/<file>.json` simultaneously to keep monorepo and frontend synchronized.




