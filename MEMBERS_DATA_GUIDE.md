# SLSCM Lab — Member Data Management Guide

This document lists the exact data files, structures, and steps to **add, remove, or update lab members** on the SLSCM Lab website.

---

## 1. Quick File Map

| Purpose | File Path | Impact on Website |
| :--- | :--- | :--- |
| 🎯 **Primary Data Source (Direct UI)** | [`web/src/data/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_people.json) | **Instant**. Vite hot-reloads changes in real-time. Adding/removing items here directly changes the website. |
| 🪞 **Monorepo Backup Mirror** | [`data/processed/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_people.json) | Used for repository data scripts and archive preservation. Always kept in sync with the primary file. |
| 🖼️ **Member Photos & Avatars** | [`web/public/assets/images/people/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/public/assets/images/people/) | Directory where square avatar image files (`.jpg` / `.png`) are placed. |
| 📚 *Related: Publications* | [`web/src/data/slscm_publications.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_publications.json) | Only needed if adding a new member's scientific papers to the Research Vault. |
| 🔬 *Related: Projects & Grants* | [`web/src/data/slscm_projects.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_projects.json) | Only needed if listing a member as a lead/collaborator on funded research grants. |

---

## 2. Member Categories & JSON Structure

All member data lives inside [`web/src/data/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_people.json). It contains 6 distinct arrays:

### A. Leadership & Faculty (`leadership_and_faculty`)
- **Where it appears**: Featured at the top of the **People** section as primary faculty cards.
- **JSON Schema**:
```json
{
  "id": "vu-duc-minh",
  "name": "TS. Vũ Đức Minh",
  "name_en": "Dr. Duc-Minh Vu",
  "title_vi": "Trưởng phòng thí nghiệm / Giảng viên",
  "title_en": "Head of Lab / Lecturer",
  "affiliation_vi": "Khoa Khoa học Dữ liệu & Trí tuệ Nhân tạo (FDA), Trường Công nghệ, Đại học Kinh tế Quốc dân (NEU)",
  "affiliation_en": "Faculty of Data Science and AI (FDA), College of Technology, National Economics University (NEU)",
  "email": "minhvd@neu.edu.vn",
  "office": "P1613, Tòa nhà A1, Đại học Kinh tế Quốc dân – 207 Giải Phóng, Hà Nội",
  "avatar": "/assets/images/people/vu_duc_minh.jpg",
  "bio_en": "Dr. Vu Duc Minh is the Head of SLSCM Lab...",
  "research_interests": [
    "Transportation & Logistics Optimization",
    "Drone & Hybrid Fleet Routing (FSTSP)",
    "Competitive Facility Location"
  ]
}
```

---

### B. Researchers & Authors (`young_researchers_and_authors`)
- **Where it appears**: Under the **Lab Members** section under the `"Researchers & Authors"` filter tab.
- **JSON Schema**:
```json
{
  "id": "nguyen-van-a",
  "name": "Nguyễn Văn A",
  "name_en": "Van-A Nguyen",
  "avatar": "/assets/images/people/nguyen_van_a.jpg",
  "role_vi": "Nghiên cứu viên / Tác giả",
  "role_en": "Researcher / Author",
  "current_status_vi": "Tác giả công bố trên Transportation Research Part C (2026)",
  "current_status_en": "Author in Transportation Research Part C (2026)",
  "affiliation": "Trường Công nghệ, Đại học Kinh tế Quốc dân (NEU)",
  "affiliation_en": "College of Technology, National Economics University (NEU)",
  "email": "nguyenvana@neu.edu.vn",
  "featured_publications": [
    "Transportation Research Part C (2026)",
    "CITA (2025)"
  ],
  "research_interests": [
    "Drone Routing",
    "Vehicle Routing & Optimization"
  ]
}
```
*(Note: If `avatar` is left as `""`, the site automatically generates an initials badge with a soft gradient).*

---

### C. Student Researchers (`student_researchers`)
- **Where it appears**: Under the **Lab Members** section under the `"Student Researchers"` filter tab.
- **JSON Schema**:
```json
{
  "name": "Nguyễn Thị B",
  "name_en": "Thi-B Nguyen",
  "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
  "major_en": "Data Science & Artificial Intelligence (DS&AI)",
  "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân",
  "institution_en": "College of Technology, National Economics University (NEU)",
  "email": ""
}
```

---

### D. Alumni (`alumni`)
- **Where it appears**: Both in the dedicated **Alumni & Placements Showcase** (`#alumni`) and in the **Lab Members** `"Alumni"` filter tab.
- **JSON Schema**:
```json
{
  "id": "alumni-nguyen-tat-dat",
  "name": "Nguyễn Tất Đạt",
  "name_en": "Tat Dat Nguyen",
  "avatar": "/assets/images/people/nguyen_tat_dat.jpg",
  "period": "2022 – 2025",
  "former_role_vi": "Cựu Nghiên cứu viên / Tác giả chính (EJOR Q1)",
  "former_role_en": "Former Research Fellow & Lead Author (EJOR Q1)",
  "current_position_vi": "Nghiên cứu sinh Tiến sĩ (PhD Candidate)",
  "current_position_en": "PhD Researcher in Operations Research",
  "institution": "Liverpool John Moores University (LJMU)",
  "institution_en": "Liverpool John Moores University (LJMU), UK",
  "research_focus": "Combinatorial Optimization, Exact Branch-and-Cut, Vehicle Routing",
  "email": "",
  "linkedin": ""
}
```

---

### E. Hall of Fame (`hall_of_fame`)
- **Where it appears**: In the prestigious **Hall of Fame & Placements** card carousel (celebrating top valedictorians and international PhD scholarship recipients).
- **JSON Schema**:
```json
{
  "id": "hof-le-ba-luat",
  "name": "Lê Bá Luật",
  "name_en": "Ba Luat Le",
  "avatar": "/assets/images/people/le_ba_luat.jpg",
  "achievement_vi": "Thủ khoa toàn trường (2025); Giành học bổng Tiến sĩ toàn phần tại Singapore Management University (SMU, 2026).",
  "achievement_en": "Valedictorian (2025); Awarded Full PhD Scholarship at Singapore Management University (SMU, 2026).",
  "destination_institution": "Singapore Management University (SMU)",
  "country": "Singapore",
  "year": 2025,
  "award_type": "PhD Scholarship & Valedictorian",
  "field": "Operations Research & Computer Science",
  "advisors": "GS. Mai Tiến (SMU), TS. Vũ Đức Minh (NEU)"
}
```

---

### F. Global Academic Partners (`global_academic_partners`)
- **Where it appears**: Under the **Global Collaboration Network** cards.
- **JSON Schema**:
```json
{
  "country": "Singapore",
  "institution": "Singapore Management University (SMU)",
  "key_collaborators": [
    "GS. Mai Tiến (School of Computing and Information Systems)"
  ],
  "research_focus": "Discrete Choice Models, Competitive Facility Location, Conic Optimization"
}
```

---

## 3. How to Request Antigravity to Modify Members

You don't need to manually edit JSON files if you don't want to. You can simply ask Antigravity with everyday phrasing:

### Adding a Member:
> *"Add a new student researcher: Nguyen Van A, major Data Science & AI, College of Technology NEU."*
> 
> *"Thêm thành viên nghiên cứu mới: Trần Văn B, vai trò Nghiên cứu viên, affiliation Phenikaa, lĩnh vực UAV Routing, avatar để trống."*

### Removing a Member:
> *"Remove Nguyen Van A from the student researchers list."*
> 
> *"Xóa thành viên Le Thi Hong khỏi danh sách young researchers."*

### Moving a Member to Alumni:
> *"Move Le Ba Luat to the Alumni list: period 2023-2025, now PhD Candidate at Singapore Management University (SMU)."*

### Updating Photos / Details:
> *"Update avatar of member Trung Le Huu to /assets/images/people/trung_le_huu.jpg and update current status to Warwick WMG Scholarship."*

---

## 4. Deploying Changes to the Live Website

Whenever you ask Antigravity to add or remove members:
1. The changes immediately reflect on **Localhost** (`http://localhost:5173/`).
2. To push the updates live to **GitHub Pages** ([slscm-lab.github.io](https://slscm-lab.github.io)) and **Vercel** ([slscm-lab.vercel.app](https://slscm-lab.vercel.app)), simply ask Antigravity:
   > *"Commit and push live to production"*
   
   Or run the sync script:
   ```bash
   ./scripts/sync_to_production.sh
   ```
