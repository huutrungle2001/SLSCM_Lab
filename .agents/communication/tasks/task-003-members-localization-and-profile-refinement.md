# TASK: task-003-members-localization-and-profile-refinement

RECORD_TYPE: TASK
RECORD_ID: task-003-members-localization-and-profile-refinement
STATUS: TASK_READY
ATTEMPT: 1
CREATED_AT: 2026-09-20T09:18:00Z
UPDATED_AT: 2026-09-20T09:18:00Z
FROM: hub
TO: oracle
BASE_COMMIT: b5bfceb

## 1. Objective & Scope

Refine and localize the **Researchers & Student Scholars (Members)** section and the **Lab Life** section in the SLSCM Lab portal (`SLSCM_Lab/web/` and `data/`):

### Core Requirements:
1. **100% English Localization for Members**:
   - All member names in the **Researchers & Student Scholars** section must be displayed in **English only** (no Vietnamese dual-name display needed).
   - All roles, descriptions, status notes, and badges for members must be **100% English**.
2. **Member Information Corrections**:
   - Correct name: `Lê Thanh Hồng` -> `Lê Thị Hồng` (English: `Thi Hong Le`).
   - Correct name: `Nguyễn Đức Công` -> `Nguyễn Đình Công` (English: `Nguyen Dinh Cong`).
   - Member cards must display their **current educational affiliation** and **email**. If any member currently lacks either piece of information, leave that field blank.
3. **Trung Le Huu Profile & Priority Positioning**:
   - English display name: **`Trung Le Huu`**.
   - Positioning: Place **`Trung Le Huu` immediately after `Le Ba Luat`** in the members roster.
   - Status & Honors: Add `Awarded WMG Excellence Scholarship at the University of Warwick (UoW, 2026)`.
   - Research Interests: Add `Bounded-optimal search`.
   - Additional profile details: Extract relevant academic details from `/Users/huutrungle2001/Documents/OnGoing/Trung-Le-Huu` (e.g. email `huutrungle2001@gmail.com` or academic email, current institution University of Warwick, etc.).
4. **Lab Life Section Cleanup**:
   - Remove the `Explore facebook.com/slscm.lab` button at the bottom of the `#lab-life` section.
5. **Quality & Verification**:
   - Run `npm --prefix web run build` to verify zero TypeScript errors and successful production bundling.
   - Verify visually via OmniBrowser CDP on port 17082.
   - Commit all changes and deploy to Vercel production (`vercel --prod --yes`).

---

## 2. File Boundaries

- `web/src/data/slscm_people.json`
- `web/src/App.tsx`
- `.agents/communication/results/task-003-members-localization-and-profile-refinement.md`

---

## 3. Mandatory Subagent Delegation (Iron Invariant)

Per Workbench operational guidelines:
`slscm-oracle` and `slscm-hive` must delegate tasks to worker subagents (`gemini-3.8-flash-high`) via `spawn_agent` / background workers to complete updates rapidly in parallel without blocking.
