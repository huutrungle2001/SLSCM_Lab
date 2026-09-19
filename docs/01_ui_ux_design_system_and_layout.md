# SLSCM Lab — Comprehensive UI/UX Design System & Layout Specification
**Smart Logistics & Supply Chain Management Lab**  
*Trường Công nghệ, Đại học Kinh tế Quốc dân (College of Technology — National Economics University, NEU)*  
**Location**: Room P1613, Building A1, 207 Giai Phong Road, Hai Ba Trung, Hanoi, Vietnam  
**Lab Head**: TS. Vũ Đức Minh (`minhvd@neu.edu.vn`)

---

## Document Metadata
- **Document ID**: `DOC-SLSCM-UIUX-001`
- **Version**: `1.0.0 (Production-Ready Architecture)`
- **Role**: Master UI/UX Design System Architect
- **Status**: Approved for Implementation
- **Target Tech Stack**: React 18+ / Next.js 14+ (App Router), TypeScript, Tailwind CSS v3.4+, Lucide React Icons, Framer Motion

---

## Table of Contents
1. [Executive Summary & Design Vision](#1-executive-summary--design-vision)
2. [Visual Design Language & Aesthetic Philosophy](#2-visual-design-language--aesthetic-philosophy)
3. [Typography Hierarchy (Techno-Optimist System)](#3-typography-hierarchy-techno-optimist-system)
4. [Color Tokens & Semantic Palette](#4-color-tokens--semantic-palette)
5. [Surface, Elevation, and Border System](#5-surface-elevation-and-border-system)
6. [Comprehensive Section-by-Section Layout Specs & Wireframes](#6-comprehensive-section-by-section-layout-specs--wireframes)
   - [Section 1: Top Navigation & Live Telemetry Bar](#section-1-top-navigation--live-telemetry-bar)
   - [Section 2: Hero Section — The Optimizing Frontier](#section-2-hero-section--the-optimizing-frontier)
   - [Section 3: Research Pillars — Interactive Deep-Dive](#section-3-research-pillars--interactive-deep-dive)
   - [Section 4: Flagship Real-World Projects & Impact](#section-4-flagship-real-world-projects--impact)
   - [Section 5: Interactive Publications & Research Vault](#section-5-interactive-publications--research-vault)
   - [Section 6: Mentorship, People & Hall of Fame](#section-6-mentorship-people--hall-of-fame)
   - [Section 7: Lab Life & Curated Facebook Digest](#section-7-lab-life--curated-facebook-digest)
   - [Section 8: Join Us — Prospective Students & Industry Portal](#section-8-join-us--prospective-students--industry-portal)
   - [Section 9: Institutional Footer & Map Preview](#section-9-institutional-footer--map-preview)
7. [Technical Implementation Blueprint](#7-technical-implementation-blueprint)
   - [Component Hierarchy Tree](#71-component-hierarchy-tree)
   - [Project Directory Structure](#72-project-directory-structure)
   - [Global State Management Architecture](#73-global-state-management-architecture)
   - [Responsive Breakpoints & Layout Adaptations](#74-responsive-breakpoints--layout-adaptations)
   - [Micro-Interactions & Motion Specifications](#75-micro-interactions--motion-specifications)
   - [Accessibility (a11y) & WCAG 2.1 AA Compliance](#76-accessibility-a11y--wcag-21-aa-compliance)

---

## 1. Executive Summary & Design Vision

The web platform for **SLSCM Lab (Smart Logistics & Supply Chain Management Lab)** represents a paradigm shift in academic web presence. Rather than conforming to traditional, rigid, bureaucratic university portals, the SLSCM Lab platform is conceived as a **dynamic, luminous, techno-optimist research hub**.

### Core Pillars of the Experience:
1. **"Sáng sủa, mềm mại" (Bright, Soft & Inviting)**:
   - Built upon airy off-white surfaces (`#ffffff`, `#f8fafc`, `#f1f5f9`), delicate micro-borders (`rgba(15, 23, 42, 0.08)`), and soft ambient diffuse drop shadows.
   - Elimination of visual clutter, heavy dark headers, or claustrophobic box grids.
2. **Scholarly Prestige meets Youthful Energy**:
   - Celebrates world-class scholarly rigor (Q1 journals like *EJOR*, *IJOC*, *ITOR*, *CSI*, *Neurocomputing*; top conferences *CITA*, *COMOSA*, *CSONET*) while maintaining an approachable, inspiring atmosphere for ambitious young researchers.
   - Highlights human achievements: national valedictorians, full PhD scholarships at prestigious institutions (**Singapore Management University**, **University of Connecticut**, **Liverpool John Moores University**).
3. **Living Telemetry & Live Transparency**:
   - The lab is portrayed as an active, breathing organism: room badges (`P1613, Tòa A1, NEU`), active grant counters, real-time publication search, and synchronized Facebook community updates.

---

## 2. Visual Design Language & Aesthetic Philosophy

### 2.1 Principles of Form & Space
- **Airiness over Density**: Generous section padding (`py-20` to `py-28`), expansive card interiors (`p-6` to `p-8`), and distinct breathing room between mathematical formulations and narrative text.
- **Organic Softness ("Mềm mại")**: Generous corner radii (`rounded-2xl` for cards, `rounded-full` for badges/chips, `rounded-xl` for interactive buttons). No sharp 90-degree corners on prominent UI containers.
- **Glassmorphism & Frosted Layers**: Subtle backdrops with `backdrop-blur-md` and semi-transparent alpha fills (`bg-white/80` or `bg-slate-50/80`) to establish spatial depth without visual weight.
- **Tactile Micro-Feedback**: Every interactive element responds with subtle spring physics, gentle elevation rises (`hover:-translate-y-1`), and soft border glow transitions.

```
+-------------------------------------------------------------------+
|  [Glass Top Bar: Status: ACTIVE | P1613 A1 NEU | EN/VI Switch]   |
+-------------------------------------------------------------------+
|                                                                   |
|   HERO: Crisp White Canvas + Soft Oceanic Cyan Ambient Glow       |
|   "Where Mathematical Rigor Powers Autonomous Supply Chains"      |
|   [17+ Papers]  [8+ Q1 Journals]  [3 PhD Placements]  [4 Grants]  |
|                                                                   |
+-------------------------------------------------------------------+
|  RESEARCH PILLARS (3 Rounded-2xl Cards with Subtle Slate Borders) |
|  - Operational OR       - AI Metaheuristics      - Green Drones/EV|
+-------------------------------------------------------------------+
|  FLAGSHIP IMPACT (Hanoi Smart Water Network & VINIF Grant)        |
+-------------------------------------------------------------------+
|  PUBLICATIONS VAULT (Live Filter, DOI Badges, BibTeX Modal)       |
+-------------------------------------------------------------------+
|  PEOPLE & HALL OF FAME (TS. Vũ Đức Minh, SMU/UConn/LJMU Scholars) |
+-------------------------------------------------------------------+
|  LAB LIFE & FACEBOOK DIGEST (Seminar Photos, Awards, Hackathons)  |
+-------------------------------------------------------------------+
|  JOIN US & CONTACT (Prospective Undergrad/Grad/Industry Portal)   |
+-------------------------------------------------------------------+
|  INSTITUTIONAL FOOTER (College of Technology NEU, P1613 Map)      |
+-------------------------------------------------------------------+
```

---

## 3. Typography Hierarchy (Techno-Optimist System)

The typographic system blends modern humanist sans-serif legibility with editorial dignity and mathematical precision.

### 3.1 The Tri-Font System
1. **Primary Sans — `Onest`**:
   - **Role**: Primary UI text, body paragraphs, navigation, form inputs, buttons.
   - **Characteristics**: Humanist geometry, open apertures, exceptional readability in Vietnamese diacritics and compact spaces.
   - **Weights Used**: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold).
2. **Editorial Accent — `Faculty Glyphic`**:
   - **Role**: Hero statements, italicized keywords, research pillar mottos, paper titles, leadership pull-quotes.
   - **Characteristics**: Evokes carved academic stone inscriptions blended with modernist elegance; brings distinguished scholarly authority.
   - **Weights Used**: 400 (Regular with italic style).
3. **Telemetry & Code — `JetBrains Mono`**:
   - **Role**: Metrics counters, DOIs, grant IDs, room codes (`P1613 A1`), dates, algorithm acronyms (`FSTSP`, `EVRP-TW`, `GrafoRVFL`), BibTeX code blocks.
   - **Characteristics**: High x-height, clear ligatures, monospace clarity.
   - **Weights Used**: 400 (Regular), 500 (Medium), 600 (SemiBold).

### 3.2 Google Fonts Import Snippet
Include in HTML `<head>` or Next.js `layout.tsx`:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Faculty+Glyphic&family=JetBrains+Mono:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Onest:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
```

Or via CSS `@import`:
```css
@import url('https://fonts.googleapis.com/css2?family=Faculty+Glyphic&family=JetBrains+Mono:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Onest:wght@300;400;500;600;700;800&display=swap');
```

### 3.3 Tailwind CSS Configuration (`tailwind.config.ts`)
```typescript
import type { Config } from 'tailwindcss';

const config: Config = {
  theme: {
    extend: {
      fontFamily: {
        sans: ['Onest', 'system-ui', '-apple-system', 'sans-serif'],
        editorial: ['"Faculty Glyphic"', 'Georgia', 'serif'],
        mono: ['"JetBrains Mono"', 'monospace'],
      },
    },
  },
};

export default config;
```

### 3.4 Typographic Scale & Usage Table

| Token Name | Font Family | Size (px/rem) | Line Height | Weight | Tracking | Intended Usage |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `display-hero` | `Faculty Glyphic` | 56px / 3.5rem | 1.15 | 400 | `-0.02em` | Main hero headline statements |
| `h1` | `Faculty Glyphic` | 40px / 2.5rem | 1.2 | 400 | `-0.015em` | Section major titles (Research, People) |
| `h2` | `Onest` | 28px / 1.75rem | 1.25 | 700 | `-0.01em` | Subsection headers, pillar card titles |
| `h3` | `Onest` | 20px / 1.25rem | 1.35 | 600 | `0` | Card titles, project names, paper titles |
| `editorial-quote`| `Faculty Glyphic` | 22px / 1.375rem| 1.5 | 400 (italic)| `0` | Philosophy pull quotes, testimonials |
| `body-large` | `Onest` | 18px / 1.125rem| 1.6 | 400 | `0` | Hero intro paragraphs, lead text |
| `body-default` | `Onest` | 16px / 1.0rem | 1.6 | 400 | `0` | Default body copy, descriptions |
| `body-medium` | `Onest` | 14px / 0.875rem| 1.5 | 500 | `0.01em` | Card metadata, table cells, bio text |
| `caption` | `Onest` | 12px / 0.75rem | 1.4 | 500 | `0.02em` | Timestamps, footnote captions |
| `telemetry-metric`| `JetBrains Mono`| 32px / 2.0rem | 1.1 | 600 | `-0.03em` | Numerical stats counters (`17+`, `8+`) |
| `telemetry-badge` | `JetBrains Mono`| 12px / 0.75rem | 1.2 | 500 | `0.04em` | Room codes, DOIs, status badges |

---

## 4. Color Tokens & Semantic Palette

The color system is rooted in the academic prestige of deep oceanic slate, revitalized by crisp mint, soft cyan, and warm amber accents.

```
OCEANIC SLATE (Primary Authority)
[#0f172a]  [#0369a1]  [#0284c7]  [#38bdf8]

EMERALD MINT (Outcomes & Sustainability)
[#059669]  [#10b981]  [#34d399]  [#d1fae5]

SOFT CYAN (AI/ML & Optimization)
[#0891b2]  [#06b6d4]  [#22d3ee]  [#cffafe]

WARM AMBER (Awards & Hall of Fame)
[#d97706]  [#f59e0b]  [#fbbf24]  [#fef3c7]

CANVAS & SURFACES (Bright & Soft)
[#ffffff]  [#f8fafc]  [#f1f5f9]  [#e2e8f0]
```

### 4.1 Complete Color Token Specifications

```css
:root {
  /* Surface Tokens */
  --color-canvas-pure: #ffffff;
  --color-canvas-subtle: #f8fafc;
  --color-canvas-muted: #f1f5f9;
  --color-canvas-card: #ffffff;
  --color-canvas-glass: rgba(255, 255, 255, 0.85);

  /* Border Tokens */
  --color-border-delicate: rgba(15, 23, 42, 0.08);
  --color-border-subtle: #e2e8f0;
  --color-border-accent-mint: rgba(16, 185, 129, 0.25);
  --color-border-accent-cyan: rgba(6, 182, 212, 0.25);
  --color-border-accent-amber: rgba(245, 158, 11, 0.25);

  /* Primary Brand: Oceanic Slate */
  --color-primary-950: #020617;
  --color-primary-900: #0f172a;
  --color-primary-800: #1e293b;
  --color-primary-700: #0369a1;
  --color-primary-600: #0284c7;
  --color-primary-500: #0ea5e9;
  --color-primary-100: #e0f2fe;
  --color-primary-50:  #f0f9ff;

  /* Accent 1: Emerald Mint (Eco Logistics & Active Status) */
  --color-accent-mint-700: #047857;
  --color-accent-mint-600: #059669;
  --color-accent-mint-500: #10b981;
  --color-accent-mint-400: #34d399;
  --color-accent-mint-100: #d1fae5;
  --color-accent-mint-50:  #ecfdf5;

  /* Accent 2: Soft Cyan (AI/ML & Algorithms) */
  --color-accent-cyan-700: #0e7490;
  --color-accent-cyan-600: #0891b2;
  --color-accent-cyan-500: #06b6d4;
  --color-accent-cyan-400: #22d3ee;
  --color-accent-cyan-100: #cffafe;
  --color-accent-cyan-50:  #ecfeff;

  /* Accent 3: Warm Amber (Hall of Fame & Grants) */
  --color-accent-amber-700: #b45309;
  --color-accent-amber-600: #d97706;
  --color-accent-amber-500: #f59e0b;
  --color-accent-amber-400: #fbbf24;
  --color-accent-amber-100: #fef3c7;
  --color-accent-amber-50:  #fffbeb;

  /* Text Colors */
  --color-text-main: #0f172a;     /* slate-900 */
  --color-text-muted: #475569;    /* slate-600 */
  --color-text-subtle: #64748b;   /* slate-500 */
  --color-text-dim: #94a3b8;      /* slate-400 */
}
```

### 4.2 Tailwind Theme Extension (`tailwind.config.ts`)
```typescript
colors: {
  slscm: {
    canvas: {
      pure: '#ffffff',
      subtle: '#f8fafc',
      muted: '#f1f5f9',
    },
    slate: {
      DEFAULT: '#0f172a',
      deep: '#020617',
      ocean: '#0369a1',
      vibrant: '#0284c7',
      light: '#f0f9ff',
    },
    mint: {
      DEFAULT: '#10b981',
      dark: '#059669',
      light: '#ecfdf5',
      border: 'rgba(16, 185, 129, 0.2)',
    },
    cyan: {
      DEFAULT: '#06b6d4',
      dark: '#0891b2',
      light: '#ecfeff',
      border: 'rgba(6, 182, 212, 0.2)',
    },
    amber: {
      DEFAULT: '#f59e0b',
      dark: '#d97706',
      light: '#fffbeb',
      border: 'rgba(245, 158, 11, 0.2)',
    },
  },
}
```

---

## 5. Surface, Elevation, and Border System

### 5.1 Card Surface Styles
To ensure the **"Sáng sủa, mềm mại"** feel, cards do not use heavy dark borders or harsh black drop shadows.

```css
/* Standard Soft Card */
.slscm-card {
  background-color: #ffffff;
  border: 1px solid rgba(15, 23, 42, 0.08);
  border-radius: 1rem; /* 16px */
  box-shadow: 0 1px 3px 0 rgba(15, 23, 42, 0.03), 0 1px 2px -1px rgba(15, 23, 42, 0.03);
  transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
}

.slscm-card:hover {
  transform: translateY(-2px);
  border-color: rgba(15, 23, 42, 0.14);
  box-shadow: 0 10px 25px -5px rgba(15, 23, 42, 0.06), 0 8px 10px -6px rgba(15, 23, 42, 0.04);
}

/* Featured / Active Card */
.slscm-card-featured {
  background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
  border: 1px solid rgba(3, 105, 161, 0.2);
  box-shadow: 0 8px 24px -4px rgba(3, 105, 161, 0.08);
}
```

---

## 6. Comprehensive Section-by-Section Layout Specs & Wireframes

### Section 1: Top Navigation & Live Telemetry Bar

#### 1.1 Purpose & Role
Establishes the lab’s identity as an active, physical research laboratory at National Economics University (NEU), displays real-time laboratory telemetry, offers rapid navigation, language switching, and institutional links.

#### 1.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [LIVE TELEMETRY RIBBON]                                                                                                |
| (•) LAB ACTIVE · SEMESTER 2025-2026   |   📍 P1613, TÒA A1, NEU - 207 GIẢI PHÓNG   |   ✉ minhvd@neu.edu.vn   | [VI | EN]  |
+-------------------------------------------------------------------------------------------------------------------------+
| [STICKY NAVIGATION BAR]                                                                                                 |
| [LOGO: NEU + SLSCM Lab]    Research Pillars   Impact Projects   Publications Vault   People & Mentorship   Lab Life      |
|                                                                                         [Explore Vault]  [Join Lab ->]  |
+-------------------------------------------------------------------------------------------------------------------------+
```

#### 1.3 Detailed Elements & Micro-Tokens
1. **Live Telemetry Ribbon**:
   - Height: `34px`, Background: `bg-slate-900 text-slate-300 font-mono text-xs`.
   - **Status Indicator**: Animated pulsating green dot (`animate-ping bg-emerald-400`) next to `STATUS: ACTIVE / P1613 A1`.
   - **Location Token**: `📍 Room P1613, Building A1, NEU` with tooltip: `"Trường Công nghệ, Đại học Kinh tế Quốc dân"`.
   - **Direct Contact**: `✉ minhvd@neu.edu.vn` (clickable `mailto:` link).
   - **Language Toggle**: Pill switcher `[ Tiếng Việt | English ]` with active pill in `bg-slate-700 text-white`.
2. **Main Sticky Navigation Bar**:
   - Height: `72px`, Background: `bg-white/90 backdrop-blur-md border-b border-slate-200/70`.
   - **Brand Lockup**:
     - Left: NEU Seal & SLSCM Lab emblem badge (geometric routing network icon).
     - Title: `SLSCM Lab` (font: `Faculty Glyphic`, size `text-xl`, `font-bold text-slate-900`).
     - Subtitle: `Smart Logistics & Supply Chain Management · Trường Công nghệ NEU` (`text-[11px] text-slate-500 font-sans`).
   - **Navigation Links**:
     - `Nghiên cứu` (`#research`), `Dự án & Tác động` (`#impact`), `Kho công bố` (`#publications`), `Đội ngũ & Học bổng` (`#people`), `Đời sống Lab` (`#lab-life`).
     - State: Underline indicator sliding animation on hover (`after:h-0.5 after:bg-sky-600`).
   - **Action Buttons**:
     - Secondary: `Kho công bố (Vault)` (`border border-slate-200 hover:bg-slate-50 text-slate-700`).
     - Primary: `Gia nhập Lab ->` (`bg-slate-900 hover:bg-sky-700 text-white rounded-xl px-4 py-2 font-medium`).

---

### Section 2: Hero Section — The Optimizing Frontier

#### 2.1 Purpose & Role
Hook the visitor immediately with an inspiring, modern academic vision. Establish the lab's core metrics, cutting-edge focus (combinatorial optimization, autonomous vehicles, AI), and invite immediate exploration.

#### 2.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                         |
|       [Badge: ⚡ TRƯỜNG CÔNG NGHỆ - ĐẠI HỌC KINH TẾ QUỐC DÂN | P1613 TÒA A1]                                            |
|                                                                                                                         |
|       Where Mathematical Rigor Powers                                                                                   |
|       Autonomous & Resilient Supply Chains.                                                                             |
|                                                                                                                         |
|       Nơi giao thoa giữa Vận trù học hiện đại, Trí tuệ Nhân tạo và Vận tải Thế hệ Mới.                                  |
|       Phòng Lab nghiên cứu các bài toán tối ưu tổ hợp phức tạp, định tuyến drone/xe điện,                               |
|       và đào tạo các thế hệ sinh viên xuất sắc vươn tầm học thuật thế giới.                                             |
|                                                                                                                         |
|       [ Khám phá 3 Trụ cột nghiên cứu ]   [ Xem Kho bài báo Q1/Q2 (17+) ]   [ Cơ hội Gia nhập Lab ]                     |
|                                                                                                                         |
|  +-------------------------------------------------------------------------------------------------------------------+  |
|  |  LIVE METRICS COUNTER BAR (JetBrains Mono & Onest)                                                                |  |
|  |  +------------------+  +------------------+  +--------------------+  +--------------------+  +------------------+ |  |
|  |  |      17+         |  |       08+        |  |        03          |  |         04         |  |      P1613 A1    | |  |
|  |  |  Công bố Quốc tế |  | Tạp chí Q1/Q2    |  | Học bổng PhD Toàn  |  | Đề tài / Quỹ NAFO- |  | Trụ sở Lab tại  | |  |
|  |  |  (2025 - 2026)   |  | (EJOR, IJOC, ITOR|  | phần (SMU/UConn/LJ)|  | STED / VINIF       |  | ĐH KTQD (NEU)    | |  |
|  |  +------------------+  +------------------+  +--------------------+  +--------------------+  +------------------+ |  |
|  +-------------------------------------------------------------------------------------------------------------------+  |
|                                                                                                                         |
|  EXPLORATION CHIPS: [VRP & Drone Routing]  [MetaPerceptron AI]  [EVRP-TW Xe điện]  [Học bổng SMU]  [Dự án Nước Hà Nội]  |
|                                                                                                                         |
+-------------------------------------------------------------------------------------------------------------------------+
```

#### 2.3 Visual & Functional Specifications
- **Background Atmosphere**:
  - Pure white base (`#ffffff`) overlaid with subtle radial gradient mesh: `radial-gradient(ellipse 80% 50% at 50% -20%, rgba(6, 182, 212, 0.08), rgba(255, 255, 255, 0))`.
  - Generous vertical spacing: `pt-20 pb-16 md:pt-28 md:pb-24`.
- **Hero Typography**:
  - Kicker: `font-mono text-xs font-semibold uppercase tracking-wider text-sky-700 bg-sky-50 border border-sky-200/60 px-3.5 py-1.5 rounded-full inline-flex items-center gap-2`.
  - Main Headline: `font-editorial text-4xl sm:text-5xl lg:text-6xl text-slate-900 tracking-tight leading-[1.15]`.
    - Italicized Accent: Words like *"Mathematical Rigor"* and *"Resilient Supply Chains"* styled with `italic text-transparent bg-clip-text bg-gradient-to-r from-sky-800 to-cyan-600`.
  - Body paragraph: `font-sans text-lg sm:text-xl text-slate-600 max-w-3xl leading-relaxed mt-6`.
- **Live Metrics Counter Cards**:
  - Grid: `grid grid-cols-2 lg:grid-cols-5 gap-4 mt-12`.
  - Card style: `bg-white/80 backdrop-blur-sm border border-slate-200/70 rounded-2xl p-5 shadow-sm hover:shadow-md hover:border-sky-300 transition-all`.
  - Number: `font-mono text-3xl sm:text-4xl font-bold text-slate-900`.
  - Subtitle: `font-sans text-xs text-slate-500 font-medium mt-1`.

---

### Section 3: Research Pillars — Interactive Deep-Dive

#### 3.1 Purpose & Role
Present the three core intellectual domains of the lab with rigorous academic backing, problem formulations, and direct links to published papers.

#### 3.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| SECTION HEADER:                                                                                                         |
| [TRỤ CỘT HỌC THUẬT & NGHIÊN CỨU TIÊN PHONG]                                                                             |
| Ba Hướng Nghiên Cứu Trọng Tâm của SLSCM Lab                                                                            |
|                                                                                                                         |
| +-----------------------------+ +-----------------------------+ +-----------------------------------------------------+ |
| | PILLAR 1:                   | | PILLAR 2:                   | | PILLAR 3:                                           | |
| | Tối ưu hóa Vận hành &       | | Trí tuệ Nhân tạo & Tối ưu   | | Vận tải Hiện đại & Chuỗi Cung                       | |
| | Thiết kế Thuật toán         | | hóa trong Data Science      | | ứng Bền vững (Green Logistics)                      | |
| | [Operational Optimization]  | | [AI & Machine Learning OR]  | | [Drones, UAVs & Electric Vehicles]                  | |
| +-----------------------------+ +-----------------------------+ +-----------------------------------------------------+ |
| | Focus:                      | | Focus:                      | | Focus:                                              | |
| | • VRP, FSTSP, Orienteering  | | • MetaPerceptron Framework  | | • Drone Delivery Routing (FSTSP)                    | |
| | • Parallel Machine Sched.   | | • GrafoRVFL Gradient-free   | | • EVRP-TW (Xe điện trạm & dọc đường)                | |
| | • Cutting Plane / Exact C.P | | • Chuỗi thời gian LNG Price | | • Rescheduling School Bus                           | |
| |                             | |                             | |                                                     | |
| | FORMULATION PREVIEW:        | | FORMULATION PREVIEW:        | | FORMULATION PREVIEW:                                | |
| | min \sum c_{ij} x_{ij}      | | \min_{W} \mathcal{L}(y, f)  | | E_{drone} = P_{hover} t_h + P_{flight} t_f          | |
| |                             | |                             | |                                                     | |
| | KEY PAPERS:                 | | KEY PAPERS:                 | | KEY PAPERS:                                         | |
| | 📄 ITOR 2025 (Scheduling)   | | 📄 CSI 2025 (MetaPerceptron)| | 📄 JORS 2025 (School Bus)                           | |
| | 📄 EJOR 2025 (Set Team OP)  | | 📄 Neurocomputing (GrafoRVFL| | 📄 COMOSA 2025 (Hybrid Drone)                       | |
| |                             | |                             | |                                                     | |
| | [Khám phá hướng 1 ->]       | | [Khám phá hướng 2 ->]       | | [Khám phá hướng 3 ->]                               | |
| +-----------------------------+ +-----------------------------+ +-----------------------------------------------------+ |
+-------------------------------------------------------------------------------------------------------------------------+
```

#### 3.3 Card Component Details

##### Card 1: Operational Optimization & Algorithmic Design
- **Theme Color**: Ocean Slate (`#0369a1`).
- **Badge**: `EXACT & HEURISTIC OPTIMIZATION`.
- **Key Challenges**:
  - Vehicle Routing Problems (VRP) with complex capacity & time window constraints.
  - Flying Sidekick Traveling Salesman Problem (FSTSP) with stage-based formulation.
  - Parallel identical machines scheduling with conflict jobs (makespan minimization).
  - Set Team Orienteering Problem (STOP).
- **Mathematical Teaser (Code block in `JetBrains Mono`)**:
  ```text
  min sum_{(i,j) in A} c_{ij} x_{ij} + sum_{k in K} f_k y_k
  s.t. sum_{j in delta^+(i)} x_{ij} - sum_{j in delta^-(i)} x_{ji} = b_i
  ```
- **Featured Publications**:
  - *ITOR (2025)*: "Parallel identical machine scheduling with conflict jobs" (ThS. Tạ Đình Quý, PGS. TS. Hà Minh Hoàng, TS. Roberto Rosati, GS. Andrea Schaerf).
  - *EJOR (2025)*: "The set team orienteering problem".

##### Card 2: Optimization in Data Science & Machine Learning
- **Theme Color**: Soft Cyan (`#0891b2`).
- **Badge**: `AI / OR INTERSECTION`.
- **Key Challenges**:
  - Gradient-free optimization for deep neural networks and Extreme Learning Machines (ELM/RVFL).
  - Metaheuristic-driven Multi-Layer Perceptron architecture tuning (`MetaPerceptron`).
  - High-frequency commodity price forecasting (LNG Spot Price JKM Index).
- **Mathematical Teaser (Code block in `JetBrains Mono`)**:
  ```text
  min_{W, b} || H(X; W_rand, b_rand) beta - Y ||_2^2 + lambda || beta ||_2^2
  GrafoRVFL: Metaheuristic tuning for hidden weights W_rand
  ```
- **Featured Publications**:
  - *Computer Standards & Interfaces (2025)*: "MetaPerceptron: A standardized framework for metaheuristic-driven multi-layer perceptron optimization".
  - *Neurocomputing (2025)*: "GrafoRVFL: A gradient-free optimization framework for boosting random vector functional link network".

##### Card 3: Modern Transportation & Green Supply Chain
- **Theme Color**: Emerald Mint (`#059669`).
- **Badge**: `GREEN LOGISTICS & AUTONOMOUS MOBILITY`.
- **Key Challenges**:
  - Multi-trip drone delivery under battery discharge and weather constraints.
  - Electric Vehicle Routing Problem with Time Windows (EVRP-TW) with station-based vs route-based charging.
  - School bus dynamic rescheduling under unexpected road disruptions.
- **Mathematical Teaser (Code block in `JetBrains Mono`)**:
  ```text
  SOC_{i+1} = SOC_i - (P_{prop} + P_{avionics}) * Delta t_i + E_{charge}
  Delta t_{drone} <= T_{flight\_limit}(Wind, Payload)
  ```
- **Featured Publications**:
  - *Journal of the Operational Research Society (2025)*: "The rescheduling school bus routing problem under student negative impact constraints".
  - *COMOSA (2025)*: "A Hybrid Genetic Search for Energy-Aware Multi-Trip Drone Routing with Time-Windows".

---

### Section 4: Flagship Real-World Projects & Impact

#### 4.1 Purpose & Role
Demonstrate how theoretical formulations translate into tangible municipal and industrial impact in Vietnam and Southeast Asia.

#### 4.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [DỰ ÁN NGHIÊN CỨU THỰC CHIẾN & TÁC ĐỘNG XÃ HỘI]                                                                         |
| Từ Thuật Toán Đến Đời Sống: Giải Quyết Bài Toán Đô Thị & Công Nghiệp                                                   |
|                                                                                                                         |
| +-----------------------------------------------------------------+ +-------------------------------------------------+ |
| | FLAGSHIP PROJECT 1 (Liên Lab CADA - SLSCM)                      | | FLAGSHIP PROJECT 2                              | |
| | 💧 AI & OR TRONG QUẢN LÝ CẤP THOÁT NƯỚC ĐÔ THỊ HÀ NỘI           | | 🚁 HỆ THỐNG GIAO HÀNG TỰ HÀNH DRONE - XE TẢI    | |
| |                                                                 | | (REVISIT FLYING SIDEKICK TSP)                   | |
| | Địa bàn: Hệ thống cấp thoát nước TP. Hà Nội                     | | Hợp tác: Nghiên cứu quốc tế                     | |
| | Liên Lab: P1601 A1 (CADA) x P1613 A1 (SLSCM) - Khoa FDA NEU    | | Trọng tâm: Đồng bộ hóa xe tải - drone giao hàng | |
| |                                                                 | | chặng cuối (last-mile delivery), giảm 34% khí   | |
| | [AI Side]   Dự báo nhu cầu, phát hiện rò rỉ, điểm ngập lụt      | | thải carbon và rút ngắn 42% thời gian giao nhận | |
| | [OR Side]   Tối ưu vị trí trạm bơm, điều tiết lưu lượng         | |                                                 | |
| | [Data Side] Phân tích IoT thời gian thực từ cảm biến đô thị     | | Thành viên chủ chốt: Trần Nam Khánh, TS. Minh   | |
| |                                                                 | | Đạt giải thưởng nghiên cứu xuất sắc 2025        | |
| | Liên hệ dự án: Thầy Lê Duy Khánh & TS. Vũ Đức Minh              | |                                                 | |
| | [Xem Chi Tiết Dự Án Nước Hà Nội ->]                             | | [Xem Báo Cáo FSTSP ->]                          | |
| +-----------------------------------------------------------------+ +-------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | 🏆 QUỸ TÀI TRỢ & ĐỐI TÁC NGHIÊN CỨU                                                                                 | |
| | • VINIF (Vingroup Innovation Foundation)                                                                            | |
| | • Quỹ Phát triển Khoa học & Công nghệ Quốc gia (NAFOSTED)                                                           | |
| | • Singapore Management University (SMU) - GS. Mai Tiến                                                              | |
| | • University of Udine (Ý) & Vienna (Áo) - GS. Andrea Schaerf, TS. Roberto Rosati                                     | |
| +---------------------------------------------------------------------------------------------------------------------+ |
+-------------------------------------------------------------------------------------------------------------------------+
```

---

### Section 5: Interactive Publications & Research Vault

#### 5.1 Purpose & Role
The crown jewel of the platform: a blazing fast, searchable, and filterable catalog of all peer-reviewed articles, books, and conference proceedings produced by SLSCM Lab members.

#### 5.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [KHO CÔNG BỐ KHOA HỌC / PUBLICATIONS VAULT]                                                                             |
| Danh mục Nghiên cứu Quốc tế Giai đoạn 2025 - 2026                                                                       |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [ 🔍 Tìm kiếm bài báo theo tên, tác giả, tạp chí, từ khóa (VD: drone, scheduling, EJOR, ITOR, Quý, Luật)...       ] | |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | BỘ LỌC NĂM:       [ Tất cả ]  [ 2026 ]  [ 2025 ]                                                                    | |
| | BỘ LỌC LOẠI HÌNH: [ Tất cả ]  [ Tạp chí Q1/Q2 ]  [ Chương sách Springer ]  [ Kỷ yếu Hội thảo Quốc tế ]             | |
| | BỘ LỌC CHỦ ĐỀ:    [ Tất cả ]  [ Định tuyến VRP/Drone ]  [ Lập lịch Scheduling ]  [ AI / ML ]  [ Xe điện Green ]     | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| DANH SÁCH BÀI BÁO (11 kết quả hiển thị):                                                                               |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [TẠP CHÍ Q1] [2025] [EJOR]                                                                   DOI: 10.1016/j.ejor... | |
| | The set team orienteering problem                                                                                   | |
| | Tác giả: Nhóm nghiên cứu SLSCM Lab & PGS. TS. Hà Minh Hoàng                                                         | |
| | Tạp chí: European Journal of Operational Research (Elsevier)                                                        | |
| | [ 🔗 Xem bài báo gốc (DOI) ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ Tối ưu hóa Vận hành ]                             | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [TẠP CHÍ Q1] [2025] [ITOR]                                                                   DOI: 10.1111/itor...   | |
| | Parallel identical machine scheduling with conflict jobs                                                             | |
| | Tác giả: ThS. Tạ Đình Quý, PGS. TS. Hà Minh Hoàng, TS. Roberto Rosati, GS. Andrea Schaerf                           | |
| | Tạp chí: International Transactions in Operational Research (Wiley)                                                  | |
| | [ 🔗 Xem bài báo gốc (DOI) ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ Lập lịch máy ]                                    | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [TẠP CHÍ Q1] [2025] [COMPUTERS & STANDARDS]                                                  DOI: 10.1016/j.csi...  | |
| | MetaPerceptron: A standardized framework for metaheuristic-driven multi-layer perceptron optimization               | |
| | Tác giả: Thành viên SLSCM Lab                                                                                       | |
| | Tạp chí: Computer Standards & Interfaces (Elsevier)                                                                 | |
| | [ 🔗 Xem bài báo gốc (DOI) ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ AI & Machine Learning ]                           | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [TẠP CHÍ HÀNG ĐẦU] [IJOC - INFORMS]                                                          INFORMS Computing      | |
| | Competitive Facility Location under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches         | |
| | Tác giả: Lê Bá Luật, GS. Mai Tiến (SMU), TS. Tạ Thúy Anh, PGS. TS. Hà Minh Hoàng, TS. Vũ Đức Minh                    | |
| | Tạp chí: INFORMS Journal on Computing (Top Tier thế giới)                                                           | |
| | [ 🔗 Xem bài báo gốc (DOI) ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ Vị trí cơ sở / Choice Model ]                     | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [CHƯƠNG SÁCH] [2025] [SPRINGER]                                                              Springer Nature Link   | |
| | Exact approaches for scheduling problems on parallel identical machines with conflict job                           | |
| | Tác phẩm: Handbook of Combinatorial Optimization (Springer)                                                         | |
| | [ 🔗 Xem sách gốc ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ Combinatorial Optimization ]                                | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | [HỘI THẢO] [CITA 2025]                                                                       Springer Chapter       | |
| | A 2-index Stage-based Formulation and a Construct, Merge, Solve & Adapt Algorithm for the FSTSP                     | |
| | Tác giả: SLSCM Lab Team                                                                                             | |
| | Kỷ yếu: CITA 2025 (Springer)                                                                                        | |
| | [ 🔗 Xem kỷ yếu ]    [ 📋 Trích dẫn (BibTeX) ]    [ 🏷️ Drone Routing FSTSP ]                                        | |
| +---------------------------------------------------------------------------------------------------------------------+ |
+-------------------------------------------------------------------------------------------------------------------------+
```

#### 5.3 Interactive BibTeX Modal Specification
When the user clicks `[ 📋 Trích dẫn (BibTeX) ]`:
- A native `<dialog>` or accessible modal opens centered on screen.
- Backdrop: `backdrop-blur-md bg-slate-900/40`.
- Modal Body: Clean white surface (`bg-white rounded-2xl p-6 max-w-xl w-full shadow-2xl border border-slate-200`).
- Syntax-highlighted BibTeX snippet in `font-mono text-xs bg-slate-900 text-sky-300 p-4 rounded-xl overflow-x-auto`.
- Button: `[ 📋 Sao chép BibTeX ]` (with instant feedback: `"Đã sao chép vào clipboard!"` and checkmark icon).

---

### Section 6: Mentorship, People & Hall of Fame

#### 6.1 Purpose & Role
Humanize the laboratory. Celebrate the faculty mentors who steer the research and spotlight the extraordinary student alumni who have gained full PhD scholarships abroad.

#### 6.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [ĐỘI NGŨ KHOA HỌC & BAN CỐ VẤN]                                                                                         |
| Những Người Dẫn Dắt & Ươm Mầm Tài Năng Học Thuật                                                                        |
|                                                                                                                         |
| +---------------------------------------------------+ +---------------------------------------------------------------+ |
| | TRƯỞNG PHÒNG THÍ NGHIỆM                           | | CỐ VẤN KHOA HỌC CAO CẤP                                       | |
| | TS. VŨ ĐỨC MINH                                   | | PGS. TS. HÀ MINH HOÀNG                                        | |
| | Trưởng Lab SLSCM · Giảng viên Khoa FDA, NEU       | | Chuyên gia Tối ưu hóa & Vận trù học                          | |
| | Email: minhvd@neu.edu.vn                          | | Cố vấn chiến lược các bài toán định tuyến và lập lịch phức tạp| |
| | Nghiên cứu: Vận trù học, Chuỗi cung ứng thông minh| | Công bố: Hàng chục bài báo Q1 trên EJOR, IJOC, ITOR, JORS... | |
| +---------------------------------------------------+ +---------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | 🎓 HALL OF FAME: HỌC BỔNG QUỐC TẾ & THỦ KHOA XUẤT SẮC                                                               | |
| | Tự hào các thế hệ học viên và nghiên cứu sinh trưởng thành từ SLSCM Lab:                                            | |
| |                                                                                                                     | |
| | +--------------------------------+ +--------------------------------+ +------------------------------------------+ | |
| | | 🇸🇬 SINGAPORE MANAGEMENT UNIV    | | 🇺🇸 UNIVERSITY OF CONNECTICUT   | | 🇬🇧 LIVERPOOL JOHN MOORES UNIV (UK)      | | |
| | | (SMU) - HỌC BỔNG TOÀN PHẦN PHD | | (UCONN) - HỌC BỔNG TOÀN PHẦN   | | HỌC BỔNG TOÀN PHẦN NGHIÊN CỨU SINH     | | |
| | | Lê Bá Luật & thành viên lab    | | Nghiên cứu sinh xuất sắc       | | Học viên tài năng SLSCM Lab             | | |
| | | Hợp tác GS. Mai Tiến (SMU)     | | Nghiên cứu Chuỗi cung ứng      | | Nghiên cứu Vận tải xanh & Drones       | | |
| | +--------------------------------+ +--------------------------------+ +------------------------------------------+ | |
| |                                                                                                                     | |
| | 🏅 THỦ KHOA TOÀN TRƯỜNG & THỦ KHOA CHƯƠNG TRÌNH ĐÀO TẠO:                                                            | |
| | Các sinh viên nghiên cứu tại SLSCM Lab liên tục đạt danh hiệu Thủ khoa tốt nghiệp Đại học Kinh tế Quốc dân,          | |
| | đạt giải Nhất/Nhì Nghiên cứu khoa học sinh viên cấp Bộ & cấp Trường.                                                 | |
| +---------------------------------------------------------------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | 👥 ĐỘI NGŨ NGHIÊN CỨU VIÊN & SINH VIÊN TÀI NĂNG                                                                     | |
| | • ThS. Tạ Đình Quý (Nghiên cứu viên / Tác giả chính ITOR 2025)                                                       | |
| | • Lê Bá Luật (Đồng tác giả IJOC 2025 - INFORMS, PhD Fellow SMU)                                                      | |
| | • Trần Nam Khánh (Nghiên cứu viên trẻ - Tác giả Revisit FSTSP)                                                       | |
| | • Sinh viên nghiên cứu xuất sắc từ NEU (Trường Công nghệ), HUST (ĐHBK Hà Nội), VNU-HUS (ĐHQGHN)                     | |
| +---------------------------------------------------------------------------------------------------------------------+ |
+-------------------------------------------------------------------------------------------------------------------------+
```

---

### Section 7: Lab Life & Curated Facebook Digest

#### 7.1 Purpose & Role
Deliver dynamic social proof directly from the official fanpage (`facebook.com/slscm.lab`). Shows prospective students and partners that SLSCM is an active, vibrant community with workshops, international guest seminars, hackathons, and team gatherings.

#### 7.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [ĐỜI SỐNG LAB & TIN TỨC CỘNG ĐỒNG]                                                                                      |
| Cập nhật Hoạt Động Mới Nhất từ Fanpage SLSCM Lab (facebook.com/slscm.lab)                                               |
|                                                                                                                         |
| +-----------------------------+ +-----------------------------+ +-----------------------------------------------------+ |
| | [TIN CÔNG BỐ QUỐC TẾ]       | | [DỰ ÁN NƯỚC HÀ NỘI]         | | [ĐÀO TẠO & WORKSHOP]                                | |
| | 📰 Công bố mới trên ITOR:   | | 🌊 Dự án thực chiến AI & OR | | 💡 Khóa đào tạo ngắn hạn:                           | |
| | Bài toán lập lịch song song | | Quản lý cấp thoát nước      | | "Từ dữ liệu đến phân tích và                        | |
| | máy có yếu tố xung đột      | | Đô thị Hà Nội (CADA x SLSCM)| | ra quyết định thông minh"                           | |
| | 👥 ThS. Quý, PGS. TS. Hoàng | | 👥 Thầy Khánh & TS. Minh    | | 👥 Tổ chức bởi SLSCM Lab &                          | |
| | [Xem bài viết trên FB ->]   | | [Xem chi tiết tuyển dụng ->]| | Khoa FDA - ĐH Kinh tế Quốc dân                      | |
| +-----------------------------+ +-----------------------------+ +-----------------------------------------------------+ |
|                                                                                                                         |
| [ 🌐 Ghé thăm Fanpage chính thức: facebook.com/slscm.lab ]                                                               |
+-------------------------------------------------------------------------------------------------------------------------+
```

---

### Section 8: Join Us — Prospective Students & Industry Portal

#### 8.1 Purpose & Role
Streamline the talent pipeline for undergraduate research assistants, master/PhD candidates, and corporate partners. Clearly states prerequisite expectations and what the lab offers in return.

#### 8.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [GIA NHẬP SLSCM LAB & HỢP TÁC DOANH NGHIỆP]                                                                             |
| Bạn Đang Tìm Kiếm Cơ Hội Nghiên Cứu Đỉnh Cao & Học Bổng Toàn Phần Quốc Tế?                                             |
|                                                                                                                         |
| +---------------------------------------------------+ +---------------------------------------------------------------+ |
| | DÀNH CHO SINH VIÊN ĐẠI HỌC (UNDERGRADUATE)        | | DÀNH CHO HỌC VIÊN CAO HỌC & DOANH NGHIỆP                      | |
| |                                                   | |                                                               | |
| | 👉 Bạn cần có gì?                                 | | 🤝 Cơ hội cho Học viên & NCS:                                 | |
| | • Đam mê thuật toán, tối ưu hóa hoặc AI           | | • Tham gia trực tiếp đề tài cấp Nhà nước, đề tài VINIF        | |
| | • Nền tảng Toán (Giải tích, Đại số tuyến tính)    | | • Đồng hướng dẫn bởi các Giáo sư quốc tế (SMU, châu Âu)       | |
| | • Thành thạo Python hoặc C++ / Julia              | | • Học bổng hỗ trợ nghiên cứu hàng tháng                       | |
| |                                                   | |                                                               | |
| | 🎁 Bạn sẽ nhận được gì?                           | | 🏢 Dành cho Doanh nghiệp & Đối tác:                           | |
| | • TS. Vũ Đức Minh & PGS. TS. Hoàng trực tiếp kèm  | | • Tư vấn giải pháp tối ưu hóa kho bãi, tuyến xe giao nhận     | |
| | • Đồng tác giả bài báo quốc tế Scopus/ISI Q1/Q2   | | • Ứng dụng AI dự báo nhu cầu chuỗi cung ứng                   | |
| | • Thư giới thiệu đắc lực xin học bổng PhD/Master  | | • Giải bài toán thực tế của doanh nghiệp                      | |
| +---------------------------------------------------+ +---------------------------------------------------------------+ |
|                                                                                                                         |
| +---------------------------------------------------------------------------------------------------------------------+ |
| | 📬 LIÊN HỆ TRỰC TIẾP VỚI LAB HEAD                                                                                    | |
| | TS. Vũ Đức Minh — Email: minhvd@neu.edu.vn                                                                          | |
| | Địa chỉ: Phòng P1613, Tòa nhà A1, Trường Công nghệ, Đại học Kinh tế Quốc dân — 207 Giải Phóng, Hai Bà Trưng, Hà Nội | |
| |                                                                                                                     | |
| | [ ✉ Gửi Email cho TS. Minh ]    [ 📄 Tải Brochure Giới Thiệu Lab (PDF) ]    [ 💬 Nhắn tin qua Fanpage ]            | |
| +---------------------------------------------------------------------------------------------------------------------+ |
+-------------------------------------------------------------------------------------------------------------------------+
```

---

### Section 9: Institutional Footer & Map Preview

#### 9.1 Purpose & Role
Ground the lab within its parent institutions: Trường Công nghệ (College of Technology), Khoa Khoa học Dữ liệu & Phân tích (FDA), and National Economics University (NEU).

#### 9.2 Layout Wireframe
```
+-------------------------------------------------------------------------------------------------------------------------+
| [NEU SEAL]     SMART LOGISTICS & SUPPLY CHAIN MANAGEMENT LAB (SLSCM LAB)                                                |
|                Trường Công nghệ · Đại học Kinh tế Quốc dân                                                              |
|                P1613, Tòa nhà A1, 207 Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội                                       |
|                                                                                                                         |
| CÁC TRỤ CỘT             KHO CÔNG BỐ            LIÊN KẾT NHANH          KẾT NỐI VỚI CHÚNG TÔI                           |
| • Tối ưu Vận hành       • Tạp chí Q1/Q2        • Trường Công nghệ NEU   • Facebook: fb.com/slscm.lab                    |
| • Trí tuệ Nhân tạo      • Chương sách Springer • Khoa FDA NEU           • Email: minhvd@neu.edu.vn                      |
| • Vận tải Xanh / Drones • Kỷ yếu CITA/COMOSA   • Cổng thông tin NEU     • GitHub Research Vault                         |
| • Cấp thoát nước Hà Nội • Trích dẫn BibTeX     • Cố vấn PGS. TS. Hoàng  • Phòng Lab: P1613 Tòa A1                       |
|                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------- |
| © 2025-2026 SLSCM Lab · Trường Công nghệ, Đại học Kinh tế Quốc dân (NEU). All rights reserved.                         |
| Designed with Techno-Optimist Philosophy · Typeset in Onest, Faculty Glyphic & JetBrains Mono                           |
+-------------------------------------------------------------------------------------------------------------------------+
```

---

## 7. Technical Implementation Blueprint

### 7.1 Component Hierarchy Tree

```text
App / Page Root (app/page.tsx)
├── Providers (LanguageContext, ModalContext, SearchStateProvider)
├── TelemetryRibbon (components/layout/TelemetryRibbon.tsx)
├── MainNavbar (components/layout/MainNavbar.tsx)
│   ├── BrandLogo (NEU & SLSCM Lab lockup)
│   ├── NavLinks (Smooth scroll anchors)
│   ├── LanguageSwitcher (VI / EN)
│   └── MobileDrawer (Responsive trigger)
├── HeroSection (components/sections/HeroSection.tsx)
│   ├── HeroBadge (Institutional affiliation)
│   ├── HeroHeadline (Faculty Glyphic editorial statements)
│   ├── LiveMetricsBar (JetBrains Mono metric counters)
│   └── ExplorationChips (Quick filter jump chips)
├── ResearchPillarsSection (components/sections/ResearchPillarsSection.tsx)
│   ├── PillarCard (Operational Optimization)
│   ├── PillarCard (AI / ML Metaheuristics)
│   └── PillarCard (Green Logistics & Drones)
├── FlagshipImpactSection (components/sections/FlagshipImpactSection.tsx)
│   ├── ProjectCard (Hanoi Smart Water Network AI/OR)
│   ├── ProjectCard (Revisit FSTSP Drone-Truck)
│   └── GrantsPartnersBar (VINIF, NAFOSTED, SMU, Udine)
├── PublicationsVaultSection (components/sections/PublicationsVaultSection.tsx)
│   ├── VaultSearchBar (Real-time keyword filtering)
│   ├── VaultFilterPills (Year, Type, Pillar)
│   ├── PublicationCardList
│   │   └── PublicationCard (Title, Authors, Venue, DOI, BibTeX button)
│   └── BibTeXModal (Accessible dialog with one-click copy)
├── MentorshipPeopleSection (components/sections/MentorshipPeopleSection.tsx)
│   ├── LeadershipCards (TS. Vũ Đức Minh, PGS. TS. Hà Minh Hoàng)
│   ├── HallOfFameGrid (SMU, UConn, LJMU scholarships)
│   └── ResearchersSquad (ThS. Quý, Lê Bá Luật, Trần Nam Khánh, Students)
├── LabLifeSection (components/sections/LabLifeSection.tsx)
│   ├── FacebookDigestGrid (Curated posts, seminars, photos)
│   └── SocialLinkBanner
├── JoinUsSection (components/sections/JoinUsSection.tsx)
│   ├── StudentPathwaysCard (Undergrad & Grad guidance)
│   ├── IndustryCollaborationCard
│   └── DirectContactCard (Email & Room P1613 info)
└── InstitutionalFooter (components/layout/InstitutionalFooter.tsx)
    ├── AffiliationDetails
    ├── SitemapColumns
    └── CopyrightNotice
```

### 7.2 Project Directory Structure

```text
slscm-web/
├── public/
│   ├── images/
│   │   ├── logo-neu.svg
│   │   ├── logo-slscm.svg
│   │   ├── people/
│   │   │   ├── vu-duc-minh.jpg
│   │   │   ├── ha-minh-hoang.jpg
│   │   │   └── ta-dinh-quy.jpg
│   │   └── projects/
│   │       ├── hanoi-water-network.jpg
│   │       └── drone-routing-fstsp.jpg
│   └── favicon.ico
├── src/
│   ├── app/
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/
│   │   ├── common/
│   │   │   ├── Badge.tsx
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   └── Modal.tsx
│   │   ├── layout/
│   │   │   ├── TelemetryRibbon.tsx
│   │   │   ├── MainNavbar.tsx
│   │   │   ├── MobileDrawer.tsx
│   │   │   └── InstitutionalFooter.tsx
│   │   └── sections/
│   │       ├── HeroSection.tsx
│   │       ├── ResearchPillarsSection.tsx
│   │       ├── FlagshipImpactSection.tsx
│   │       ├── PublicationsVaultSection.tsx
│   │       ├── BibTeXModal.tsx
│   │       ├── MentorshipPeopleSection.tsx
│   │       ├── LabLifeSection.tsx
│   │       └── JoinUsSection.tsx
│   ├── context/
│   │   ├── LanguageContext.tsx
│   │   └── VaultFilterContext.tsx
│   ├── data/
│   │   ├── publications.json
│   │   ├── people.json
│   │   ├── projects.json
│   │   └── facebook_feed.json
│   ├── types/
│   │   └── index.ts
│   └── utils/
│       ├── bibtexGenerator.ts
│       └── cn.ts
├── tailwind.config.ts
├── tsconfig.json
└── package.json
```

### 7.3 Global State Management Architecture

The platform uses lightweight React Contexts for predictable, zero-dependency client state:

```typescript
// src/context/VaultFilterContext.tsx
import React, { createContext, useContext, useState, useMemo } from 'react';

export type PublicationType = 'all' | 'journal' | 'book_chapter' | 'conference';
export type PublicationYear = 'all' | '2026' | '2025';
export type ResearchPillarId = 'all' | 'operational_optimization' | 'ml_optimization' | 'green_transportation';

interface VaultFilterState {
  searchQuery: string;
  setSearchQuery: (query: string) => void;
  selectedYear: PublicationYear;
  setSelectedYear: (year: PublicationYear) => void;
  selectedType: PublicationType;
  setSelectedType: (type: PublicationType) => void;
  selectedPillar: ResearchPillarId;
  setSelectedPillar: (pillar: ResearchPillarId) => void;
  activeBibTeX: string | null;
  setActiveBibTeX: (bibtex: string | null) => void;
  resetFilters: () => void;
}

const VaultFilterContext = createContext<VaultFilterState | undefined>(undefined);

export const VaultFilterProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedYear, setSelectedYear] = useState<PublicationYear>('all');
  const [selectedType, setSelectedType] = useState<PublicationType>('all');
  const [selectedPillar, setSelectedPillar] = useState<ResearchPillarId>('all');
  const [activeBibTeX, setActiveBibTeX] = useState<string | null>(null);

  const resetFilters = () => {
    setSearchQuery('');
    setSelectedYear('all');
    setSelectedType('all');
    setSelectedPillar('all');
  };

  const value = useMemo(
    () => ({
      searchQuery,
      setSearchQuery,
      selectedYear,
      setSelectedYear,
      selectedType,
      setSelectedType,
      selectedPillar,
      setSelectedPillar,
      activeBibTeX,
      setActiveBibTeX,
      resetFilters,
    }),
    [searchQuery, selectedYear, selectedType, selectedPillar, activeBibTeX]
  );

  return <VaultFilterContext.Provider value={value}>{children}</VaultFilterContext.Provider>;
};

export const useVaultFilter = () => {
  const context = useContext(VaultFilterContext);
  if (!context) throw new Error('useVaultFilter must be used within VaultFilterProvider');
  return context;
};
```

### 7.4 Responsive Breakpoints & Layout Adaptations

| Screen Size | Breakpoint | Layout Adaptations |
| :--- | :--- | :--- |
| **Mobile (`< 640px`)** | `sm` | • Telemetry ribbon shows only: `(•) LAB ACTIVE \| P1613 A1`<br>• Main nav collapses into slide-over drawer<br>• Hero metrics render as 2-column compact grid<br>• Research pillars stack vertically as single cards<br>• Publication filters stack into scrollable horizontal chips |
| **Tablet (`640px - 1024px`)**| `md` | • Telemetry ribbon expands with email link<br>• Hero metrics render as 3+2 grid<br>• Research pillars render as 2-column grid with 3rd spanning full width<br>• Hall of Fame cards render as 2-column grid |
| **Desktop (`> 1024px`)** | `lg` / `xl` | • Full telemetry ribbon with all indicators & language toggle<br>• Full horizontal desktop navigation with hover indicators<br>• Hero metrics span 5 equal columns<br>• Research pillars render as 3 equal side-by-side cards<br>• Sticky sidebar filter option for publications vault |

### 7.5 Micro-Interactions & Motion Specifications

1. **Card Elevation**:
   - Transition: `transition-all duration-300 ease-[cubic-bezier(0.16,1,0.3,1)]`.
   - Hover state: `hover:-translate-y-1 hover:shadow-lg hover:border-slate-300`.
2. **Telemetry Status Pulse**:
   - `span className="relative flex h-2 w-2"`
   - `span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"`
   - `span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"`
3. **Filter Pill Activation**:
   - Active: `bg-slate-900 text-white shadow-sm`.
   - Inactive: `bg-slate-100 text-slate-600 hover:bg-slate-200/80`.
   - Animated layout transition via Framer Motion `layoutId="activeFilterPill"`.
4. **BibTeX Clipboard Micro-Feedback**:
   - Button flips from `[ Sao chép BibTeX ]` to `[ ✓ Đã sao chép! ]` with subtle scale bounce (`scale-105`) for 2000ms.

### 7.6 Accessibility (a11y) & WCAG 2.1 AA Compliance

1. **Color Contrast**:
   - Primary Slate (`#0f172a`) on White (`#ffffff`): Contrast ratio **16.1:1** (Exceeds AAA).
   - Ocean Slate (`#0369a1`) on White (`#ffffff`): Contrast ratio **5.2:1** (Exceeds AA for normal text).
   - Emerald Mint (`#047857`) on White: Contrast ratio **5.0:1** (Exceeds AA).
   - Subtitle Slate (`#475569`) on White: Contrast ratio **5.5:1** (Exceeds AA).
2. **Semantic Landmark Elements**:
   - `<header>`: Contains Telemetry Ribbon and Main Navigation.
   - `<main>`: Wraps all page sections (`<section aria-labelledby="...">`).
   - `<nav aria-label="Main Navigation">`: Top navigation menu.
   - `<footer>`: Institutional footer with address and affiliations.
3. **Keyboard Navigation & Focus States**:
   - All interactive controls feature visible focus rings: `focus-visible:ring-2 focus-visible:ring-sky-500 focus-visible:ring-offset-2 outline-none`.
   - Escape key dismisses the BibTeX modal and mobile navigation drawer.
   - Search inputs feature clear `aria-label="Tìm kiếm bài báo khoa học"`.

---

## 8. Conclusion & Sign-off

This UI/UX Design System and Layout Specification establishes the definitive foundation for the SLSCM Lab platform. By harmonizing the **"Sáng sủa, mềm mại"** visual philosophy with high academic rigor and modern web engineering standards, the resulting platform will position SLSCM Lab as a beacon of excellence within the National Economics University and the broader international scientific community.
