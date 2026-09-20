# TASK: task-003-members-localization-and-profile-refinement

RECORD_TYPE: TASK
RECORD_ID: task-003-members-localization-and-profile-refinement
STATUS: TASK_COMPLETED
ATTEMPT: 1
CREATED_AT: 2026-09-20T09:18:00Z
UPDATED_AT: 2026-09-20T10:25:00Z
FROM: hub
TO: oracle
BASE_COMMIT: b5bfceb

## 1. Objective

Refine, polish, and localize the **Researchers & Student Scholars (Members)** section and clean up the **Lab Life** section in the SLSCM Lab portal (`web/` and `data/`):
- Switch all member names and descriptions in Researchers & Student Scholars to 100% English.
- Correct names: `Lê Thanh Hồng` -> `Lê Thị Hồng` (Thi Hong Le), `Nguyễn Đức Công` -> `Nguyễn Đình Công` (Nguyen Dinh Cong).
- Update member cards to display current educational affiliation and email (leave blank if missing).
- Position **`Trung Le Huu`** immediately after `Le Ba Luat`, add `Awarded WMG Excellence Scholarship at the University of Warwick (UoW, 2026)`, add research interest `Bounded-optimal search`, and integrate profile info from `/Users/huutrungle2001/Documents/OnGoing/Trung-Le-Huu`.
- Remove the `Explore facebook.com/slscm.lab` button at the bottom of the Lab Life section.

## 2. Scope

Files authorized for modification:
- `web/src/data/slscm_people.json`
- `web/src/App.tsx`
- `.agents/communication/results/task-003-members-localization-and-profile-refinement.md`

## 3. Acceptance Criteria

1. **100% English Localization**:
   - Researchers & Student Scholars cards display only English names (no Vietnamese name dual display).
   - Card descriptions, honors, status, and track tags are 100% English.
2. **Member Corrections & Metadata**:
   - `Lê Thanh Hồng` is updated to `Thi Hong Le` (`Lê Thị Hồng`).
   - `Nguyễn Đức Công` is updated to `Nguyen Dinh Cong` (`Nguyễn Đình Công`).
   - Cards display educational affiliation and email. If missing, leave empty gracefully without broken UI.
3. **Trung Le Huu Placement & Profile**:
   - English display name is `Trung Le Huu`.
   - Placed directly after `Le Ba Luat` in the young researchers list.
   - Includes `Awarded WMG Excellence Scholarship at the University of Warwick (UoW, 2026)`.
   - Includes research interest `Bounded-optimal search`.
4. **Lab Life Button Removal**:
   - The button `Explore facebook.com/slscm.lab` at the bottom of `#lab-life` is removed.
5. **Subagent Delegation**:
   - `slscm-oracle` and `slscm-hive` coordinate with worker subagents (`gemini-3.8-flash-high`) via `spawn_agent` to complete tasks rapidly.

## 4. Validation

1. `npm --prefix web run build` succeeds with exit code 0.
2. Verify visual appearance on browser via CDP port 17082.
3. Commit result record and push to master, deploy to Vercel production.
