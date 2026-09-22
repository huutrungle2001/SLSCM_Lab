# SLSCM Lab — Master Data & Content Management Guide

Hướng dẫn toàn diện về danh mục các file dữ liệu, cấu trúc JSON và các **quy tắc cập nhật/thay đổi dữ liệu** (Thành viên, Bài báo, Sự kiện & Tin tức, Đề tài & Dự án, Chỉ số thống kê) trên hệ thống website của SLSCM Lab.

---

## 1. Bản đồ tổng thể các File dữ liệu (Data Inventory)

Hệ thống sử dụng cơ chế Monorepo với 2 vị trí file:
- 🎯 **File nguồn trực tiếp (Frontend UI)**: Nằm trong [`web/src/data/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/). Khi sửa file này, website ở Localhost sẽ **lập tức cập nhật thời gian thực (Hot-reload)**.
- 🪞 **File lưu trữ đồng bộ (Data Archive)**: Nằm trong [`data/processed/`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/). Được lưu trữ để chạy các script xử lý tự động và sao lưu. Hai thư mục này luôn được đồng bộ song song.

| Danh mục | File nguồn trực tiếp (UI) | File lưu trữ sao lưu | Mục đích & Vị trí hiển thị trên Web |
| :--- | :--- | :--- | :--- |
| 👥 **Thành viên & Cựu SV** | [`web/src/data/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_people.json) | [`data/processed/slscm_people.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_people.json) | Lãnh đạo lab, Giảng viên, Nghiên cứu viên trẻ, Sinh viên, Hall of Fame, Alumni, Đối tác quốc tế. |
| 📚 **Công bố khoa học** | [`web/src/data/slscm_publications_2025_2026.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_publications_2025_2026.json) | [`data/processed/slscm_publications_2025_2026.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_publications_2025_2026.json) | Kho công bố khoa học (Research Vault 19+ records), bộ lọc Journal/Conference, tìm kiếm DOI và xuất trích dẫn BibTeX. |
| 📰 **Sự kiện & Tin tức** | [`web/src/data/slscm_facebook_posts.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_facebook_posts.json) | [`data/processed/slscm_facebook_posts.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_facebook_posts.json) | Mục **Lab Life / News Digest**: Tin tức bài báo mới, workshop, tuyển sinh nghiên cứu, sự kiện học thuật từ kênh Facebook. |
| 🔬 **Dự án & Đề tài** | [`web/src/data/slscm_projects.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_projects.json) | [`data/processed/slscm_projects.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_projects.json) | Mục **Impact & Projects**: Các đề tài NCKH cấp cơ sở, dự án liên lab (CADA & SLSCM Smart Water), hợp tác doanh nghiệp. |
| 📊 **Tổng quan & Số liệu** | [`web/src/data/slscm_overview.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_overview.json) | [`data/processed/slscm_overview.json`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/slscm_overview.json) | Các bộ đếm ở trang chủ (Số bài Q1, Số học bổng PhD, Trụ cột nghiên cứu, thông tin liên hệ). |
| 🖼️ **Ảnh & Tư liệu** | [`web/public/assets/images/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/public/assets/images/) | Không áp dụng | Ảnh chân dung thành viên ([`people/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/public/assets/images/people/)), logo lab, poster sự kiện. |

---

## 2. Quy tắc chung khi cập nhật dữ liệu (Data Integrity Rules)

Khi thêm mới hoặc chỉnh sửa dữ liệu, cần tuân thủ 5 nguyên tắc bắt buộc sau:

1. **Nguyên tắc song phương (Dual Sync)**:
   - Mọi thay đổi dữ liệu phải được thực hiện trên file nguồn [`web/src/data/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/) và sao chép tương ứng sang [`data/processed/`](file:///home/orlab/Minh_ALL/td_bnc/website/data/processed/).
2. **Quy tắc định danh duy nhất (`id`)**:
   - Trường `id` phải viết thường, cách nhau bằng dấu gạch ngang (kebab-case), mang tính gợi nhớ (Ví dụ: `le-2026-cfl-ijoc`, `alumni-nguyen-tat-dat`, `hanoi-smart-water-network`).
3. **Quy tắc song ngữ (Bilingual Convention)**:
   - Các trường văn bản nên cung cấp song ngữ: đuôi `_vi` (tiếng Việt) và `_en` (tiếng Anh) để đảm bảo giao diện hiển thị chuẩn học thuật quốc tế.
4. **Quy tắc xử lý ảnh đại diện trống**:
   - Nếu thành viên chưa có file ảnh chân dung trong thư mục [`web/public/assets/images/people/`](file:///home/orlab/Minh_ALL/td_bnc/website/web/public/assets/images/people/), hãy đặt giá trị `"avatar": ""`. Giao diện website sẽ **tự động vẽ avatar gradient mềm mại cùng chữ cái đầu** mà không bị lỗi ảnh vỡ.
5. **Quy tắc đồng bộ số liệu Counter**:
   - Khi thêm bài báo mới hoặc thành viên nhận học bổng PhD mới, cần cập nhật tăng số đếm tương ứng trong file [`slscm_overview.json`](file:///home/orlab/Minh_ALL/td_bnc/website/web/src/data/slscm_overview.json) để các counter ở trang chủ nhảy số chính xác.

---

## 3. Hướng dẫn chi tiết từng danh mục

### A. Quản lý Thành viên & Cựu sinh viên (`slscm_people.json`)

File này bao gồm các mảng thành viên:

#### 1. Lãnh đạo & Giảng viên (`leadership_and_faculty`)
```json
{
  "id": "vu-duc-minh",
  "name": "TS. Vũ Đức Minh",
  "name_en": "Dr. Duc-Minh Vu",
  "title_vi": "Trưởng phòng thí nghiệm / Giảng viên",
  "title_en": "Head of Lab / Lecturer",
  "affiliation_vi": "Khoa Khoa học Dữ liệu & Trí tuệ Nhân tạo (FDA), Trường Công nghệ, NEU",
  "affiliation_en": "Faculty of Data Science and AI (FDA), College of Technology, National Economics University (NEU)",
  "email": "minhvd@neu.edu.vn",
  "office": "P1613, Tòa nhà A1, NEU – 207 Giải Phóng, Hà Nội",
  "avatar": "/assets/images/people/vu_duc_minh.jpg",
  "bio_vi": "Tiến sĩ Vũ Đức Minh là Trưởng phòng thí nghiệm...",
  "bio_en": "Dr. Vu Duc Minh is the Head of SLSCM Lab...",
  "research_interests": [
    "Transportation & Logistics Optimization",
    "Drone & Hybrid Fleet Routing (FSTSP)",
    "Competitive Facility Location"
  ]
}
```

#### 2. Nghiên cứu viên & Tác giả (`young_researchers_and_authors`)
```json
{
  "id": "le-ba-luat",
  "name": "Lê Bá Luật",
  "name_en": "Ba Luat Le",
  "avatar": "/assets/images/people/le_ba_luat.jpg",
  "role_vi": "Nghiên cứu viên trẻ / Tác giả chính",
  "role_en": "Junior Researcher / Lead Author",
  "current_status_vi": "Thủ khoa toàn trường (2025), Học bổng Tiến sĩ toàn phần tại SMU (2026)",
  "current_status_en": "Valedictorian (2025), Full PhD Scholarship at SMU (2026)",
  "affiliation": "Singapore Management University (SMU) & Phenikaa University",
  "affiliation_en": "Singapore Management University (SMU) & Phenikaa University",
  "email": "",
  "featured_publications": [
    "INFORMS Journal on Computing (2026)",
    "Computers & Operations Research (2026)"
  ],
  "research_interests": [
    "Competitive Facility Location",
    "Conic Programming"
  ]
}
```

#### 3. Sinh viên nghiên cứu (`student_researchers`)
```json
{
  "name": "Hà Thu Hà",
  "name_en": "Thu Ha Ha",
  "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
  "major_en": "Data Science & Artificial Intelligence (DS&AI)",
  "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân",
  "institution_en": "College of Technology, National Economics University (NEU)",
  "email": ""
}
```

#### 4. Cựu thành viên & Học bổng toàn cầu (`alumni` & `hall_of_fame`)
> [!NOTE]
> Website đã được gộp thành một mục thống nhất **"Placements without borders · Scholars & Alumni Worldwide"** tại `#alumni`. Khi thêm cựu thành viên nhận học bổng PhD, bạn nên thêm đồng thời vào cả hai danh mục:

- **Mảng `alumni`**:
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

- **Mảng `hall_of_fame`** (Dành cho thành viên đạt học bổng PhD hoặc Thủ khoa):
```json
{
  "id": "hof-nguyen-tat-dat",
  "name": "Nguyễn Tất Đạt",
  "name_en": "Tat Dat Nguyen",
  "avatar": "/assets/images/people/nguyen_tat_dat.jpg",
  "achievement_vi": "Tác giả chính công bố trên EJOR (Q1); Giành học bổng Tiến sĩ toàn phần tại Trường Đại học Liverpool John Moores (LJMU, UK, 2025).",
  "achievement_en": "Lead author in EJOR (Q1); Awarded Full PhD Scholarship at Liverpool John Moores University (LJMU, UK, 2025).",
  "destination_institution": "Liverpool John Moores University (LJMU)",
  "country": "United Kingdom",
  "year": 2025,
  "award_type": "PhD Scholarship",
  "field": "Logistics & Operations Research",
  "advisors": "PGS. TS. Hà Minh Hoàng, Rafael Martinelli"
}
```

---

### B. Quản lý Công bố khoa học (`slscm_publications_2025_2026.json`)

Mỗi bài báo khoa học là một object JSON trong mảng lớn. Cấu trúc mẫu chuẩn:

```json
{
  "id": "vu-2026-fstsp-trc",
  "title": "A Stage-based Formulation and Meta-heuristic Algorithm for the Revisit Flying SideKick Traveling Salesman Problem",
  "authors": [
    "Thi-Hong Le",
    "Duc-Duy Vu",
    "Nam-Khanh Tran",
    "Dinh-Cong Nguyen",
    "Duc-Minh Vu"
  ],
  "venue": "Transportation Research Part C: Emerging Technologies",
  "year": 2026,
  "type": "Journal",
  "doi": "10.1016/j.trc.2026.105906",
  "link": "https://doi.org/10.1016/j.trc.2026.105906",
  "research_pillar": "green_transportation",
  "abstract": "We formulate and solve the Revisit Flying Sidekick Traveling Salesman Problem...",
  "bibtex": "@article{Le2026RVFSTSP,\n  title = {A Stage-based Formulation and Meta-heuristic Algorithm for the Revisit Flying SideKick Traveling Salesman Problem},\n  author = {Thi-Hong Le and Duc-Duy Vu and Nam-Khanh Tran and Dinh-Cong Nguyen and Duc-Minh Vu},\n  journal = {Transportation Research Part C: Emerging Technologies},\n  volume = {183},\n  pages = {105906},\n  year = {2026},\n  doi = {10.1016/j.trc.2026.105906}\n}",
  "is_featured": true
}
```

**Các giá trị hợp lệ của trường**:
- `type`: Chỉ được chọn một trong ba giá trị: `"Journal"`, `"Conference"`, hoặc `"Book Chapter"`.
- `research_pillar`: Chỉ được chọn một trong ba trụ cột:
  * `"operational_optimization"`: Vận trù học, giải thuật tối ưu tuyến đường, lập lịch máy.
  * `"ml_optimization"`: Tối ưu hóa trong Trí tuệ nhân tạo, Học máy, Metaheuristics.
  * `"green_transportation"`: Drone/UAV, xe điện (EVRP-TW), chuỗi cung ứng xanh.
- `is_featured`: `true` (hiển thị nổi bật ở trang chủ) hoặc `false`.

---

### C. Quản lý Sự kiện & Tin tức (`slscm_facebook_posts.json`)

Cung cấp thông tin hiển thị tại mục **Lab Life**:

```json
{
  "type": "publication_news",
  "title": "Công bố bài báo mới trên Tạp chí Q1 INFORMS Journal on Computing",
  "paper_title": "Competitive Facility Location under Cross-Nested Logit Customer Choice Model",
  "authors": [
    "Lê Bá Luật",
    "Mai Tiến (SMU Singapore)",
    "Tạ Thúy Anh",
    "Hà Minh Hoàng",
    "Vũ Đức Minh"
  ],
  "journal": "INFORMS Journal on Computing (IJOC)",
  "link": "https://doi.org/10.1287/ijoc.2025.1150",
  "action_label": "Đọc bài báo IJOC",
  "abstract": "Nghiên cứu về bài toán định vị cơ sở cạnh tranh dưới mô hình lựa chọn khách hàng cross-nested logit..."
}
```

**Các loại `type` tin tức hỗ trợ**:
- `"publication_news"`: Tin bài báo mới được chấp nhận/xuất bản (Badge: *PUBLICATION HIGHLIGHT*).
- `"recruitment_project"`: Dự án tuyển sinh viên nghiên cứu hoặc đề tài mới (Badge: *ACTIVE INITIATIVE*).
- `"training_education"`: Hội thảo, seminar khoa học, khóa bồi dưỡng (Badge: *WORKSHOP & SYMPOSIUM*).

---

### D. Quản lý Đề tài & Dự án nghiên cứu (`slscm_projects.json`)

Cung cấp thông tin hiển thị tại mục **Projects & Impact**:

```json
{
  "id": "rv-fstsp-optimization",
  "title_vi": "Phát triển mô hình và giải thuật cho bài toán Revisit Flying Sidekick Traveling Salesman Problem",
  "title_en": "Model and Algorithm Development for the Revisit Flying Sidekick Traveling Salesman Problem",
  "category": "Đề tài Nghiên cứu Khoa học Cấp cơ sở (Institutional Research Grant)",
  "sponsor": "Đại học Kinh tế Quốc dân (NEU)",
  "grant_code": "NEU.CS.2025.SLSCM01",
  "period": "2025 – Present",
  "status": "Active",
  "leads": [
    {
      "name": "TS. Vũ Đức Minh",
      "email": "minhvd@neu.edu.vn",
      "role": "Chủ nhiệm đề tài"
    }
  ],
  "description_vi": "Nghiên cứu phát triển mô hình toán học và thuật giải xấp xỉ cho bài toán định tuyến xe tải kết hợp drone giao hàng có revisiting...",
  "description_en": "Mathematical modeling and metaheuristic development for truck-drone routing under customer revisit constraints...",
  "deliverables": [
    "Bài báo quốc tế Q1 ISI/Scopus",
    "Mã nguồn giải thuật mã nguồn mở"
  ]
}
```

---

### E. Quản lý Tổng quan & Bộ đếm (`slscm_overview.json`)

Mục `metrics` trong file này điều khiển các con số thống kê nhảy tự động trên banner trang chủ:

```json
{
  "metrics": {
    "total_publications_2025_2026": 19,
    "journal_articles": 11,
    "q1_journals": 11,
    "conference_papers": 7,
    "book_chapters": 1,
    "featured_papers": 12,
    "phd_scholarships": 3,
    "valedictorians": 2,
    "active_projects": 4,
    "student_researchers": 10,
    "international_partner_countries": 7
  }
}
```

---

## 4. Các mẫu câu yêu cầu Antigravity thực hiện (Prompt Templates)

Bạn không nhất thiết phải tự sửa code JSON. Bạn chỉ cần chat bằng ngôn ngữ tự nhiên:

| Mục tiêu | Mẫu câu tiếng Việt gợi ý |
| :--- | :--- |
| **Thêm bài báo mới** | *"Thêm bài báo mới vào Research Vault: Title '...', Authors gồm A, B, C, Venue 'EJOR', Năm 2026, Type 'Journal', DOI '...', Trụ cột 'operational_optimization', Abstract '...'."* |
| **Xóa bài báo** | *"Xóa bài báo có DOI 10.1287/ijoc.2025.1150 khỏi danh sách publications."* |
| **Thêm sinh viên mới** | *"Thêm sinh viên mới: Nguyễn Văn A, ngành Khoa học Dữ liệu và AI K65, Trường Công nghệ NEU, email a@neu.edu.vn."* |
| **Thêm học bổng PhD / Alumni** | *"Thêm cựu thành viên: Trần Thị C, cựu SV nghiên cứu K62, nhận học bổng PhD toàn phần tại NUS Singapore năm 2026, hướng nghiên cứu Graph Neural Networks."* |
| **Thêm sự kiện / Workshop** | *"Thêm một tin tức mới vào Lab Life: Workshop chuyên đề 'Generative AI trong Logistics' do SLSCM Lab và FDA tổ chức vào tháng 10/2026."* |
| **Cập nhật số đếm** | *"Cập nhật số bài báo Q1 trong overview lên 12 bài và số học bổng PhD lên 4."* |

---

## 5. Quy trình Kiểm tra & Triển khai lên Production

Sau khi dữ liệu được thêm hoặc chỉnh sửa:

### Bước 1: Kiểm tra cục bộ (Local Verification)
1. Mở trình duyệt tại [**http://localhost:5173/**](http://localhost:5173/) (hoặc qua IP mạng LAN `http://172.17.22.37:5173/`).
2. Kiểm tra xem thông tin mới đã hiển thị đẹp mắt, không lỗi chính tả hay vỡ khung.
3. Kiểm tra lệnh build TypeScript & Vite:
   ```bash
   npm --prefix web run build
   ```

### Bước 2: Đẩy trực tiếp lên Live Production
Chỉ cần yêu cầu Antigravity:
> *"Commit và push live lên production"*

Hoặc chạy lệnh tự động:
```bash
./scripts/sync_to_production.sh
```

Hệ thống sẽ tự động:
1. Tạo một Git worktree biệt lập trong `/tmp` (không làm gián đoạn dev server).
2. Tách mã nguồn `web/`, ký số commit bằng SSH key của admin để nhận huy hiệu **Verified** xanh.
3. Đẩy đồng bộ lên cả **GitHub Pages** ([https://slscm-lab.github.io](https://slscm-lab.github.io)) và **Vercel** ([https://slscm-lab.vercel.app](https://slscm-lab.vercel.app)).
