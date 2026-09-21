# SLSCM Lab — Smart Logistics & Supply Chain Management

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-slscm--lab.github.io-181717?style=flat-square&logo=github)](https://slscm-lab.github.io)
[![Vercel Production](https://img.shields.io/badge/Vercel-slscm--lab.vercel.app-0284c7?style=flat-square&logo=vercel)](https://slscm-lab.vercel.app)
[![Staging Dev](https://img.shields.io/badge/Staging-slscm--dev.vercel.app-10b981?style=flat-square&logo=vercel)](https://slscm-dev.vercel.app)
[![GitHub License](https://img.shields.io/badge/License-MIT-slate?style=flat-square)](LICENSE)

> **Lab Quản trị Logistics và Chuỗi cung ứng thông minh (SLSCM Lab)**  
> Trường Công nghệ, Đại học Kinh tế Quốc dân (NEU) — P1613, Tòa nhà A1, 207 Giải Phóng, Hà Nội.

---

## 🌐 Deployments & Repositories

| Environment | Repository | Purpose | Live URLs |
| :--- | :--- | :--- | :--- |
| **Production** | [`slscm-lab/slscm-lab.github.io`](https://github.com/slscm-lab/slscm-lab.github.io) | Official public showcase & research portal | 🌐 [**https://slscm-lab.github.io**](https://slscm-lab.github.io)<br>🚀 [**https://slscm-lab.vercel.app**](https://slscm-lab.vercel.app) |
| **Dev / Staging** | [`huutrungle2001/SLSCM_Lab`](https://github.com/huutrungle2001/SLSCM_Lab) | Research monorepo, data catalog & staging preview | 🔗 [**https://slscm-dev.vercel.app**](https://slscm-dev.vercel.app) |

---

## 🔬 Core Research Domains

1. **Operational Optimization & Exact/Heuristic Algorithms**:
   - Vehicle Routing Problems (VRP, FSTSP, EVRP-TW)
   - Machine Scheduling under Conflict Constraints
   - Packing & Set Team Orienteering Problems
2. **Optimization in Data Science & Machine Learning**:
   - Metaheuristic-driven Neural Architectures (MetaPerceptron, GrafoRVFL)
   - Bounded-optimal heuristic search algorithms (A*, WA*, Focal Search)
   - Predictive modeling for commodity prices & supply chain logistics
3. **Smart Urban Infrastructure & Green Supply Chain**:
   - Drone/UAV logistics & multi-modal transport optimization
   - Hanoi Smart Water Network Operations (with CADA Lab)
   - Facility Location under Discrete Customer Choice Models (VINIF Grant)

---

## 🚀 Development & Synchronization

### 1. Local Setup
```bash
# Install frontend dependencies
npm --prefix web install

# Run local development server
npm --prefix web run dev
```

### 2. Synchronize to Production (`slscm-lab/website`)
All production deployments are synchronized via signed git subtree:
```bash
./scripts/sync_to_production.sh
```
This script automatically validates the build, creates a clean subtree split, re-signs commits with SSH keys for the green GitHub Verified badge, and pushes directly to `slscm-lab/website:main`.

---

## 📬 Contact & Faculty Leadership

- **Head of Lab**: TS. Vũ Đức Minh ([minhvd@neu.edu.vn](mailto:minhvd@neu.edu.vn))
- **Senior Advisor**: PGS. TS. Hà Minh Hoàng
- **Address**: P1613, Tòa nhà A1, Trường Công nghệ, Đại học Kinh tế Quốc dân – 207 Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội.
