---
name: slscm-update-topic
description: >-
  Use this skill whenever modifying or expanding research pillars, research topics, taxonomy keywords,
  pillar descriptions, or topic introductions for SLSCM Lab. Handles Supabase research_pillars,
  research_keywords.json, ResearchTopicsPage topic taxonomy, and dual persistence with SQLite.
---

# SLSCM Lab — Research Pillars & Topic Taxonomy Skill

This skill defines the operational workflow for updating, expanding, or modifying research pillars, topic keywords, and introductory text across SLSCM Lab.

## The 3 Pillars Architecture

SLSCM Lab research is organized into 3 overarching pillars:
1. `supply_chain_optimization` — **Supply Chain & Logistics Optimization**
   - VRP, FSTSP (drone routing), EVRP-TW, machine scheduling with conflict jobs, facility location, inventory routing, exact branch-and-cut / branch-and-bound.
2. `ai_supply_chain_intelligence` — **AI & Data-Driven Supply Chain Intelligence**
   - Metaheuristics for ML, MetaPerceptron, GrafoRVFL, predictive-prescriptive analytics, demand forecasting.
3. `decision_analytics` — **Optimization & Decision Analytics for Complex Systems**
   - Smart water distribution, energy demand response, healthcare analytics, security games, packing.

---

## Quick Automated Topic Addition

A pre-built taxonomy manager is provided at [scripts/update_topics.py](file:///home/orlab/Minh_ALL/td_bnc/website/.agents/skills/slscm-update-topic/scripts/update_topics.py):

### 1. Inspect Current Taxonomy
```bash
python3 .agents/skills/slscm-update-topic/scripts/update_topics.py --list
```

### 2. Add New Topic Keyword & Description
```bash
python3 .agents/skills/slscm-update-topic/scripts/update_topics.py \
  --pillar "supply_chain_optimization" \
  --topic-id "minimum-spanning-tree" \
  --topic-label "Minimum Spanning Tree" \
  --description "Exact branch-and-bound and heuristic methods for variants with node and router costs."
```
Flags:
- `--pillar`: Target pillar (`supply_chain_optimization`, `ai_supply_chain_intelligence`, `decision_analytics`).
- `--topic-id`: Lowercase kebab-case slug matching publication keywords (e.g. `minimum-spanning-tree`).
- `--topic-label`: Human-readable label displayed on topic chips (e.g. `Minimum Spanning Tree`).
- `--description`: Plain English explanation shown when the topic card is viewed.
- `--dry-run`: Preview updates without modifying databases.

---

## Files Synchronized
1. **Remote Database**: `public.research_pillars` in Supabase via migration & `supabase db push --linked`.
2. **Local SQLite**: `database/slscm.sqlite` (`research_pillars` table).
3. **Keyword Taxonomy**: [`web/src/data/research_keywords.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/research_keywords.json).
4. **Interactive Component**: [`web/src/pages/ResearchTopicsPage.tsx`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/pages/ResearchTopicsPage.tsx) (`areas` and `topicIntroductions`).
5. **Static Artifacts**: [`web/src/data/generated/research_pillars.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/generated/research_pillars.json) generated via `database/scripts/export_data.py`.

---

## Verification
```bash
cd web && npm run build
```
