#!/usr/bin/env python3
"""
Script to synthesize, clean, and enrich intelligence data for SLSCM Lab.
Generates:
- data/processed/slscm_publications_2025_2026.json
- data/processed/slscm_people.json
- data/processed/slscm_projects.json
- data/processed/slscm_overview.json
"""

import json
import os

PROCESSED_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'data', 'processed'))
os.makedirs(PROCESSED_DIR, exist_ok=True)

publications = [
    {
        "id": "le-2026-cfl-ijoc",
        "title": "Competitive Facility Location Under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches",
        "authors": [
            "Ba Luat Le",
            "Tien Mai",
            "Thuy Anh Ta",
            "Minh Hoàng Hà",
            "Duc-Minh Vu"
        ],
        "venue": "INFORMS Journal on Computing",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1287/ijoc.2025.1150",
        "link": "https://doi.org/10.1287/ijoc.2025.1150",
        "research_pillar": "operational_optimization",
        "abstract": "We study the competitive facility location problem, in which a firm aims to establish new facilities in a market already occupied by competitors. In this problem, customer behavior is a crucial factor in making optimal location decisions. We explore a general class of customer choice models, known as the cross-nested logit model, which is recognized for its flexibility and generality in predicting people’s choice behavior. To explore the problem, we first demonstrate that it is NP-hard even when there is only one customer class and the cross-nested structure has only two nests. To tackle the challenging facility location problem, we demonstrate that the objective function under a general cross-nested structure is not concave. Interestingly, we show that, by a change of variables, the objective function can be converted to a mixed-integer exponential cone convex program, enabling it to be solved to optimality via an outer approximation algorithm. Extensive experiments show the efficiency of our approach and provide analyses on the benefits of using the cross-nested model in the facility location context.",
        "bibtex": "@article{Le2026CFL,\n  title = {Competitive Facility Location Under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches},\n  author = {Ba Luat Le and Tien Mai and Thuy Anh Ta and Minh Hoàng Hà and Duc-Minh Vu},\n  journal = {INFORMS Journal on Computing},\n  year = {2026},\n  doi = {10.1287/ijoc.2025.1150}\n}",
        "is_featured": True
    },
    {
        "id": "rosati-2026-itor",
        "title": "Exact and Metaheuristic Approaches to Minimizing Makespan in Parallel Machine Scheduling with Conflicting Jobs",
        "authors": [
            "Roberto Maria Rosati",
            "Dinh Quy Ta",
            "Minh Hoàng Hà",
            "Andrea Schaerf"
        ],
        "venue": "International Transactions in Operational Research",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1111/itor.70177",
        "link": "https://onlinelibrary.wiley.com/doi/10.1111/itor.70177",
        "research_pillar": "operational_optimization",
        "abstract": "Nghiên cứu tập trung vào bài toán lập lịch các công việc xung đột trên các máy song song đồng nhất với mục tiêu tối thiểu hóa makespan. Đề xuất mô hình lập trình ràng buộc (CP) mới và hai phương pháp metaheuristic hiệu quả cao: thuật toán luyện kim mô phỏng đa lân cận (MNSA) và tìm kiếm lân cận lớn dựa trên lập trình ràng buộc (CP-based LNS).",
        "bibtex": "@article{Rosati2026ITOR,\n  title = {Exact and Metaheuristic Approaches to Minimizing Makespan in Parallel Machine Scheduling with Conflicting Jobs},\n  author = {Roberto Maria Rosati and Dinh Quy Ta and Minh Hoàng Hà and Andrea Schaerf},\n  journal = {International Transactions in Operational Research},\n  pages = {1--27},\n  year = {2026},\n  doi = {10.1111/itor.70177}\n}",
        "is_featured": True
    },
    {
        "id": "ha-2026-hdc-cor",
        "title": "On the Hierarchical Directed Capacitated Arc Routing Problem",
        "authors": [
            "Minh Hoàng Hà",
            "Thu Huong Dang",
            "Ba Luat Le",
            "Trung Thanh Nguyen",
            "André Langevin"
        ],
        "venue": "Computers & Operations Research",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1016/j.cor.2026.107495",
        "link": "https://doi.org/10.1016/j.cor.2026.107495",
        "research_pillar": "operational_optimization",
        "abstract": "This paper introduces and studies the Hierarchical Directed Capacitated Arc Routing Problem (HDCARP), motivated by urban waste collection and winter road maintenance under strict service priority hierarchies. We develop compact formulations, valid inequalities, and advanced metaheuristics providing superior performance on large realistic street networks.",
        "bibtex": "@article{Ha2026HDC,\n  title = {On the Hierarchical Directed Capacitated Arc Routing Problem},\n  author = {Minh Hoàng Hà and Thu Huong Dang and Ba Luat Le and Trung Thanh Nguyen and André Langevin},\n  journal = {Computers & Operations Research},\n  volume = {192},\n  pages = {107495},\n  year = {2026},\n  doi = {10.1016/j.cor.2026.107495}\n}",
        "is_featured": True
    },
    {
        "id": "hong-2026-rvfstsp-trc",
        "title": "A Stage-based Formulation and Meta-heuristic Algorithm for the Revisit Flying SideKick Traveling Salesman Problem",
        "authors": [
            "Le Thi Hong",
            "Duc Duy Vu",
            "Tran Nam Khanh",
            "Nguyen Dinh Cong",
            "Vu Duc Minh"
        ],
        "venue": "Transportation Research Part C: Emerging Technologies",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1016/j.trc.2026.105906",
        "link": "https://doi.org/10.1016/j.trc.2026.105906",
        "research_pillar": "green_transportation",
        "abstract": "We formulate and solve the Revisit Flying Sidekick Traveling Salesman Problem (RV-FSTSP), relaxing traditional single-visit constraints to permit the delivery truck to revisit customer locations and remain stationary while drones launch and retrieve multiple payloads. A novel stage-based integer programming formulation and a high-performance metaheuristic yield substantial reductions in mission completion time.",
        "bibtex": "@article{Hong2026RVFSTSP,\n  title = {A Stage-based Formulation and Meta-heuristic Algorithm for the Revisit Flying SideKick Traveling Salesman Problem},\n  author = {Le Thi Hong and Duc Duy Vu and Tran Nam Khanh and Nguyen Dinh Cong and Vu Duc Minh},\n  journal = {Transportation Research Part C: Emerging Technologies},\n  volume = {192},\n  pages = {105906},\n  year = {2026},\n  doi = {10.1016/j.trc.2026.105906}\n}",
        "is_featured": True
    },
    {
        "id": "zhao-2025-irp-ejor",
        "title": "Large Neighborhood and Hybrid Genetic Search for Inventory Routing Problems",
        "authors": [
            "Jingyi Zhao",
            "Claudia Archetti",
            "Tuan Anh Pham",
            "Thibaut Vidal"
        ],
        "venue": "European Journal of Operational Research",
        "year": 2025,
        "type": "Journal",
        "doi": "10.1016/j.ejor.2025.11.021",
        "link": "https://doi.org/10.1016/j.ejor.2025.11.021",
        "research_pillar": "operational_optimization",
        "abstract": "We investigate large neighborhood search and hybrid genetic search for multi-period inventory routing problems. By unifying destroy-and-repair procedures with genetic cross-over mechanisms tailored to inventory holding and transportation trade-offs, our matheuristic consistently outperforms previous state-of-the-art benchmarks.",
        "bibtex": "@article{Zhao2025IRP,\n  title = {Large Neighborhood and Hybrid Genetic Search for Inventory Routing Problems},\n  author = {Jingyi Zhao and Claudia Archetti and Tuan Anh Pham and Thibaut Vidal},\n  journal = {European Journal of Operational Research},\n  year = {2025},\n  doi = {10.1016/j.ejor.2025.11.021}\n}",
        "is_featured": True
    },
    {
        "id": "dinh-2025-schoolbus-jors",
        "title": "The rescheduling school bus routing problem under a constraint on the number of students with negative impact",
        "authors": [
            "Quy Ta Dinh",
            "Thu Huong Dang",
            "Minh Hoàng Hà",
            "Duc Minh Vu",
            "Tien Mai"
        ],
        "venue": "Journal of the Operational Research Society",
        "year": 2025,
        "type": "Journal",
        "doi": "10.1080/01605682.2025.2519991",
        "link": "https://www.tandfonline.com/doi/full/10.1080/01605682.2025.2519991",
        "research_pillar": "green_transportation",
        "abstract": "This study addresses the school bus rescheduling problem under sudden operational disruptions such as vehicle breakdowns or road closures. We introduce an explicit constraint limiting the number of students subject to negative service adjustments and develop branch-and-cut and adaptive large neighborhood search procedures.",
        "bibtex": "@article{Dinh2025SchoolBus,\n  title = {The Rescheduling School Bus Routing Problem Under a Constraint on the Number of Students with Negative Impact},\n  author = {Quy Ta Dinh and Thu Huong Dang and Minh Hoàng Hà and Duc Minh Vu and Tien Mai},\n  journal = {Journal of the Operational Research Society},\n  year = {2025},\n  doi = {10.1080/01605682.2025.2519991}\n}",
        "is_featured": True
    },
    {
        "id": "vu-2026-demand-response-erss",
        "title": "Designing effective demand response: A review of behavioral insights, consumer engagement, and operational strategies in energy systems",
        "authors": [
            "Duc D. Vu",
            "Akhtar Hussain",
            "Duc-Minh Vu",
            "Xiao Zhang",
            "Van-Hai Bui"
        ],
        "venue": "Energy Research & Social Science",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1016/j.erss.2025.104474",
        "link": "https://doi.org/10.1016/j.erss.2025.104474",
        "research_pillar": "green_transportation",
        "abstract": "A comprehensive interdisciplinary review synthesizing consumer behavior, behavioral economic nudges, and operational optimization strategies to deploy resilient and equitable demand response mechanisms in smart energy distribution networks.",
        "bibtex": "@article{Vu2026DemandResponse,\n  title = {Designing Effective Demand Response: A Review of Behavioral Insights, Consumer Engagement, and Operational Strategies in Energy Systems},\n  author = {Duc D. Vu and Akhtar Hussain and Duc-Minh Vu and Xiao Zhang and Van-Hai Bui},\n  journal = {Energy Research & Social Science},\n  volume = {131},\n  pages = {104474},\n  year = {2026},\n  doi = {10.1016/j.erss.2025.104474}\n}",
        "is_featured": True
    },
    {
        "id": "thieu-2025-metaperceptron-csi",
        "title": "MetaPerceptron: A standardized framework for metaheuristic-driven multi-layer perceptron optimization",
        "authors": [
            "Nguyen Van Thieu",
            "Seyedali Mirjalili",
            "Harish Garg",
            "Nguyen Thanh Hoang"
        ],
        "venue": "Computer Standards & Interfaces",
        "year": 2025,
        "type": "Journal",
        "doi": "10.1016/j.csi.2025.103977",
        "link": "https://doi.org/10.1016/j.csi.2025.103977",
        "research_pillar": "ml_optimization",
        "abstract": "Presents MetaPerceptron, an open-source and standardized framework for training multi-layer perceptrons via gradient-free swarm and evolutionary metaheuristics, overcoming vanishing gradient obstacles and local minima entrapment in non-convex loss landscapes.",
        "bibtex": "@article{Thieu2025MetaPerceptron,\n  title = {MetaPerceptron: A Standardized Framework for Metaheuristic-Driven Multi-Layer Perceptron Optimization},\n  author = {Nguyen Van Thieu and Seyedali Mirjalili and Harish Garg and Nguyen Thanh Hoang},\n  journal = {Computer Standards & Interfaces},\n  volume = {94},\n  pages = {103977},\n  year = {2025},\n  doi = {10.1016/j.csi.2025.103977}\n}",
        "is_featured": True
    },
    {
        "id": "thieu-2025-graforvfl-neucom",
        "title": "GrafoRVFL: A gradient-free optimization framework for boosting random vector functional link network",
        "authors": [
            "Nguyen Van Thieu",
            "Nguyen Thanh Hoang",
            "Hossam Faris"
        ],
        "venue": "Neurocomputing",
        "year": 2025,
        "type": "Journal",
        "doi": "10.1016/j.neucom.2025.130898",
        "link": "https://doi.org/10.1016/j.neucom.2025.130898",
        "research_pillar": "ml_optimization",
        "abstract": "Introduces GrafoRVFL, a gradient-free metaheuristic framework that optimizes the randomized input weights and hidden layer biases of Random Vector Functional Link networks, achieving superior generalization accuracy on regression and classification benchmarks.",
        "bibtex": "@article{Thieu2025GrafoRVFL,\n  title = {GrafoRVFL: A Gradient-Free Optimization Framework for Boosting Random Vector Functional Link Network},\n  author = {Nguyen Van Thieu and Nguyen Thanh Hoang and Hossam Faris},\n  journal = {Neurocomputing},\n  volume = {631},\n  pages = {130898},\n  year = {2025},\n  doi = {10.1016/j.neucom.2025.130898}\n}",
        "is_featured": True
    },
    {
        "id": "nguyen-2025-set-top-ejor",
        "title": "The set team orienteering problem",
        "authors": [
            "Tat Dat Nguyen",
            "Rafael Martinelli",
            "Quang Anh Pham",
            "Minh Hoàng Hà"
        ],
        "venue": "European Journal of Operational Research",
        "year": 2025,
        "type": "Journal",
        "doi": "10.1016/j.ejor.2024.09.021",
        "link": "https://doi.org/10.1016/j.ejor.2024.09.021",
        "research_pillar": "operational_optimization",
        "abstract": "We study the Set Team Orienteering Problem (Set TOP), where targets are grouped into clusters and visiting any customer within a cluster collects the cluster profit. We design branch-and-cut algorithms and metaheuristics for coordinating multiple vehicles under travel budget limitations.",
        "bibtex": "@article{Nguyen2025SetTOP,\n  title = {The Set Team Orienteering Problem},\n  author = {Tat Dat Nguyen and Rafael Martinelli and Quang Anh Pham and Minh Hoàng Hà},\n  journal = {European Journal of Operational Research},\n  volume = {321},\n  pages = {45--60},\n  year = {2025},\n  doi = {10.1016/j.ejor.2024.09.021}\n}",
        "is_featured": True
    },
    {
        "id": "nguyen-2026-quadratic-covering-ejor",
        "title": "On the approximability of covering problem under a quadratic constraint",
        "authors": [
            "Trung Thanh Nguyen",
            "Khaled Elbassioni",
            "Areg Karapetyan",
            "Majid Khonji"
        ],
        "venue": "European Journal of Operational Research",
        "year": 2026,
        "type": "Journal",
        "doi": "10.1016/j.ejor.2026.08.039",
        "link": "https://doi.org/10.1016/j.ejor.2026.08.039",
        "research_pillar": "operational_optimization",
        "abstract": "We explore the theoretical approximability and complexity of combinatorial set covering problems subject to non-linear quadratic budget constraints, proving hardness bounds and polynomial-time approximation ratios.",
        "bibtex": "@article{Nguyen2026Covering,\n  title = {On the Approximability of Covering Problem Under a Quadratic Constraint},\n  author = {Trung Thanh Nguyen and Khaled Elbassioni and Areg Karapetyan and Majid Khonji},\n  journal = {European Journal of Operational Research},\n  year = {2026},\n  doi = {10.1016/j.ejor.2026.08.039}\n}",
        "is_featured": True
    },
    {
        "id": "dinh-2025-parallel-scheduling-hbco",
        "title": "Exact approaches for scheduling problems on parallel identical machines with conflict job",
        "authors": [
            "Quy Ta Dinh",
            "Duc Minh Vu",
            "Trung Thanh Nguyen",
            "Anh Duc Le",
            "Minh Hoàng Hà"
        ],
        "venue": "Handbook of Combinatorial Optimization (Springer Nature)",
        "year": 2025,
        "type": "Book Chapter",
        "doi": "10.1007/978-1-4614-6624-6_108-1",
        "link": "https://link.springer.com/referenceworkentry/10.1007/978-1-4614-6624-6_108-1",
        "research_pillar": "operational_optimization",
        "abstract": "A comprehensive chapter surveying exact mathematical programming, branch-and-price, and constraint programming models for parallel identical machine scheduling under job conflict graphs.",
        "bibtex": "@incollection{Dinh2025ParallelScheduling,\n  title = {Exact Approaches for Scheduling Problems on Parallel Identical Machines with Conflict Jobs},\n  author = {Quy Ta Dinh and Duc Minh Vu and Trung Thanh Nguyen and Anh Duc Le and Minh Hoàng Hà},\n  booktitle = {Handbook of Combinatorial Optimization},\n  publisher = {Springer Nature},\n  year = {2025},\n  doi = {10.1007/978-1-4614-6624-6_108-1}\n}",
        "is_featured": False
    },
    {
        "id": "pham-2026-ssg-ijcai",
        "title": "Beyond Homogeneous Adversaries: Stackelberg Security Games with Mixed Quantal Response",
        "authors": [
            "Hoang Giang Pham",
            "Tien Mai",
            "Thuy Anh Ta",
            "Minh Hoàng Hà"
        ],
        "venue": "Proceedings of the Thirty-Fifth International Joint Conference on Artificial Intelligence (IJCAI 2026)",
        "year": 2026,
        "type": "Conference",
        "doi": "10.24963/ijcai.2026/392",
        "link": "https://doi.org/10.24963/ijcai.2026/392",
        "research_pillar": "ml_optimization",
        "abstract": "We study Stackelberg security games under mixed quantal response adversaries, capturing heterogeneous attacker populations. We develop a polynomial-time approximation scheme (PTAS) based on exponential cone programming and branch-and-bound.",
        "bibtex": "@inproceedings{Pham2026SSG,\n  title = {Beyond Homogeneous Adversaries: Stackelberg Security Games with Mixed Quantal Response},\n  author = {Hoang Giang Pham and Tien Mai and Thuy Anh Ta and Minh Hoàng Hà},\n  booktitle = {Proceedings of the Thirty-Fifth International Joint Conference on Artificial Intelligence (IJCAI 2026)},\n  year = {2026},\n  doi = {10.24963/ijcai.2026/392}\n}",
        "is_featured": True
    },
    {
        "id": "pham-2026-drone-tw-comosa",
        "title": "A Hybrid Genetic Search for Energy-Aware Multi-Trip Drone Routing with Time-Windows",
        "authors": [
            "Tuan Anh Pham",
            "Minh Hoang Ha",
            "Duc Minh Vu",
            "Duc Dong Do"
        ],
        "venue": "Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)",
        "year": 2026,
        "type": "Conference",
        "doi": "10.1007/978-3-032-00972-2_comosa1",
        "link": "https://comosa.vn/",
        "research_pillar": "green_transportation",
        "abstract": "Addresses multi-trip drone delivery routing under nonlinear battery discharge profiles and stringent customer time windows, employing an energy-aware hybrid genetic search metaheuristic.",
        "bibtex": "@incollection{Pham2026DroneTW,\n  title = {A Hybrid Genetic Search for Energy-Aware Multi-Trip Drone Routing with Time-Windows},\n  author = {Tuan Anh Pham and Minh Hoang Ha and Duc Minh Vu and Duc Dong Do},\n  booktitle = {Optimization, Modeling, Simulation, and Analytics},\n  series = {Springer Optimization and Its Applications},\n  volume = {235},\n  publisher = {Springer},\n  year = {2026}\n}",
        "is_featured": False
    },
    {
        "id": "tran-2026-evrptw-comosa",
        "title": "Electric Vehicle Routing Problem with Time Windows and Station-based or Route-based Charging Options",
        "authors": [
            "Trung Duc Tran",
            "Duc Minh Vu",
            "Ngoc Doanh Nguyen",
            "Gia Nguyen Pham",
            "Laurent El Ghaoui",
            "Minh Hoang Ha"
        ],
        "venue": "Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)",
        "year": 2026,
        "type": "Conference",
        "doi": "10.1007/978-3-032-00972-2_comosa2",
        "link": "https://comosa.vn/",
        "research_pillar": "green_transportation",
        "abstract": "Investigates the Electric Vehicle Routing Problem with Time Windows (EVRP-TW) integrating dual recharge modalities: dedicated off-route fast charging stations versus opportunistically placed route-based chargers.",
        "bibtex": "@incollection{Tran2026EVRPTW,\n  title = {Electric Vehicle Routing Problem with Time Windows and Station-based or Route-based Charging Options},\n  author = {Trung Duc Tran and Duc Minh Vu and Ngoc Doanh Nguyen and Gia Nguyen Pham and Laurent El Ghaoui and Minh Hoang Ha},\n  booktitle = {Optimization, Modeling, Simulation, and Analytics},\n  series = {Springer Optimization and Its Applications},\n  volume = {235},\n  publisher = {Springer},\n  year = {2026}\n}",
        "is_featured": False
    },
    {
        "id": "hong-2026-fstsp-cita",
        "title": "A 2-index Stage-based Formulation and a Construct, Merge, Solve & Adapt Algorithm for the Flying Sidekick Traveling Salesman Problem",
        "authors": [
            "Le Thanh Hong",
            "Vu Duc Minh",
            "Tran Ngoc Khanh",
            "Nguyen Duc Cong",
            "Le Huu Trung"
        ],
        "venue": "The 14th Conference on Information Technology and its Applications (CITA 2025), LNNS, Springer",
        "year": 2026,
        "type": "Conference",
        "doi": "10.1007/978-3-032-00972-2_6",
        "link": "https://doi.org/10.1007/978-3-032-00972-2_6",
        "research_pillar": "green_transportation",
        "abstract": "Proposes a 2-index stage-based mathematical formulation and a Construct, Merge, Solve & Adapt (CMSA) metaheuristic algorithm for the Flying Sidekick Traveling Salesman Problem, demonstrating computational advantages on benchmark instances.",
        "bibtex": "@conference{Hong2026FSTSPStageBased,\n  title = {A 2-index Stage-based Formulation and a Construct, Merge, Solve & Adapt Algorithm for the Flying Sidekick Traveling Salesman Problem},\n  author = {Le Thanh Hong and Vu Duc Minh and Tran Ngoc Khanh and Nguyen Duc Cong and Le Huu Trung},\n  booktitle = {The 14th Conference on Information Technology and its Applications},\n  volume = {1581},\n  publisher = {Springer},\n  year = {2026},\n  doi = {10.1007/978-3-032-00972-2_6}\n}",
        "is_featured": False
    },
    {
        "id": "le-2025-fptas-csonet",
        "title": "Facility Location Under Nonlinear Customer Demand: A Fully Polynomial-Time Approximation Scheme",
        "authors": [
            "Ba Luat Le",
            "Thuy Anh Ta",
            "Ngoc Anh Vu Thi",
            "Minh Hoàng Hà"
        ],
        "venue": "International Conference on Computational Data and Social Networks (CSONET 2025), Springer",
        "year": 2025,
        "type": "Conference",
        "doi": "10.1007/978-981-96-6389-7_3",
        "link": "https://doi.org/10.1007/978-981-96-6389-7_3",
        "research_pillar": "operational_optimization",
        "abstract": "Develops a Fully Polynomial-Time Approximation Scheme (FPTAS) for competitive facility location problems where consumer demand functions are nonlinear and price-sensitive.",
        "bibtex": "@inproceedings{Le2025FPTAS,\n  title = {Facility Location Under Nonlinear Customer Demand: A Fully Polynomial-Time Approximation Scheme},\n  author = {Ba Luat Le and Thuy Anh Ta and Ngoc Anh Vu Thi and Minh Hoàng Hà},\n  booktitle = {Computational Social Networks (CSONET 2025)},\n  publisher = {Springer},\n  year = {2025},\n  doi = {10.1007/978-981-96-6389-7_3}\n}",
        "is_featured": False
    },
    {
        "id": "pham-2025-soict-cutting-plane",
        "title": "Constraint Programming-Based Cutting Plane Algorithm for a Combination of Orienteering and Maximum Capture Problem",
        "authors": [
            "Hoang Giang Pham",
            "Tien Mai",
            "Minh Hoàng Hà"
        ],
        "venue": "International Symposium on Information and Communication Technology (SOICT 2025), Springer",
        "year": 2025,
        "type": "Conference",
        "doi": "10.1007/978-981-96-4282-3_29",
        "link": "https://doi.org/10.1007/978-981-96-4282-3_29",
        "research_pillar": "operational_optimization",
        "abstract": "We propose a cutting plane algorithm powered by constraint programming to solve the joint orienteering and customer capture problem on dense urban graphs.",
        "bibtex": "@inproceedings{Pham2025SOICT,\n  title = {Constraint Programming-Based Cutting Plane Algorithm for a Combination of Orienteering and Maximum Capture Problem},\n  author = {Hoang Giang Pham and Tien Mai and Minh Hoàng Hà},\n  booktitle = {The 14th International Symposium on Information and Communication Technology (SOICT 2025)},\n  publisher = {Springer},\n  year = {2025},\n  doi = {10.1007/978-981-96-4282-3_29}\n}",
        "is_featured": False
    },
    {
        "id": "pham-2025-lng-csonet",
        "title": "Machine Learning-Based Forecasting of LNG Spot Prices: A Case Study on the JKM Index",
        "authors": [
            "Duy-Phuong Pham",
            "Thanh-Hoang Le",
            "Tien-Dzung Vu",
            "Duc-Minh Vu",
            "Ba-Tuan Tran",
            "Van-Tu Nguyen",
            "Van-Nhan Truong",
            "Thanh-Sang Nguyen",
            "Tuyet-Vy Vu"
        ],
        "venue": "International Conference on Computational Social Networks (CSONET 2025), Springer",
        "year": 2025,
        "type": "Conference",
        "doi": "10.1007/978-981-92-4646-5_16",
        "link": "https://doi.org/10.1007/978-981-92-4646-5_16",
        "research_pillar": "ml_optimization",
        "abstract": "Analyzes and forecasts Asian LNG spot prices (Japan Korea Marker - JKM) using machine learning algorithms, highlighting the impact of global energy fluctuations and market sentiment on LNG spot volatility.",
        "bibtex": "@inproceedings{Pham2025LNG,\n  title = {Machine Learning-Based Forecasting of LNG Spot Prices: A Case Study on the JKM Index},\n  author = {Duy-Phuong Pham and Thanh-Hoang Le and Tien-Dzung Vu and Duc-Minh Vu and Ba-Tuan Tran and Van-Tu Nguyen and Van-Nhan Truong and Thanh-Sang Nguyen and Tuyet-Vy Vu},\n  booktitle = {Computational Social Networks (CSONET 2025)},\n  publisher = {Springer},\n  year = {2025},\n  doi = {10.1007/978-981-92-4646-5_16}\n}",
        "is_featured": False
    }
]

people = {
    "leadership_and_faculty": [
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
            "research_interests": [
                "Tối ưu hóa Vận tải & Logistics (Transportation & Logistics Optimization)",
                "Định tuyến Drone & Phương tiện Hỗn hợp (FSTSP & Drone Routing)",
                "Bài toán Vị trí Cơ sở Cạnh tranh (Competitive Facility Location)",
                "AI & Phân tích Dữ liệu Ra Quyết định Thông minh"
            ],
            "bio_vi": "Tiến sĩ Vũ Đức Minh là Trưởng phòng thí nghiệm SLSCM Lab, giảng viên Trường Công nghệ - NEU. Thầy chủ trì nhiều đề tài nghiên cứu về tối ưu hóa vận tải, định tuyến drone và bài toán vị trí cơ sở, là tác giả của các công trình công bố trên các tạp chí quốc tế hàng đầu như INFORMS Journal on Computing, Transportation Research Part C, Journal of the Operational Research Society.",
            "avatar": "/assets/images/people/vu_duc_minh.jpg"
        },
        {
            "id": "ha-minh-hoang",
            "name": "PGS. TS. Hà Minh Hoàng",
            "name_en": "Assoc. Prof. Dr. Minh Hoang Ha",
            "title_vi": "Cố vấn khoa học / Nghiên cứu gia cao cấp",
            "title_en": "Scientific Advisor / Senior Researcher",
            "affiliation_vi": "Trường Đại học Khoa học Tự nhiên - ĐHQGHN (VNU-HUS) & SLSCM Lab",
            "affiliation_en": "VNU University of Science (VNU-HUS) & SLSCM Lab",
            "email": "minhhoang.ha@vnu.edu.vn",
            "research_interests": [
                "Vận trù học & Lý thuyết Tối ưu (Operations Research & Optimization)",
                "Thuật toán Chính xác & Phân nhánh Cắt (Exact Algorithms & Branch-and-Cut)",
                "Thuật toán Metaheuristics & Matheuristics",
                "Định tuyến Xe & Lập lịch Sản xuất (VRP, Machine Scheduling)"
            ],
            "bio_vi": "Phó Giáo sư, Tiến sĩ chuyên ngành Vận trù học và Khoa học Máy tính. Chuyên gia hàng đầu Việt Nam về thiết kế thuật toán tối ưu hóa tổ hợp, tác giả của hàng chục công trình uy tín trên EJOR, Computers & Operations Research, ITOR, IJOC, JORS.",
            "avatar": "/assets/images/people/ha_minh_hoang.jpg"
        },
        {
            "id": "ta-dinh-quy",
            "name": "ThS. Tạ Đình Quý",
            "name_en": "MSc. Quy Ta Dinh",
            "title_vi": "Nghiên cứu viên / Nghiên cứu sinh Tiến sĩ",
            "title_en": "Researcher / PhD Candidate",
            "affiliation_vi": "SLSCM Lab & Viện Toán học / Đại học Bách Khoa Hà Nội",
            "affiliation_en": "SLSCM Lab & Institute of Mathematics / HUST",
            "email": "quytd@neu.edu.vn",
            "research_interests": [
                "Lập lịch Máy Song song & Công việc Xung đột (Conflict Job Scheduling)",
                "Quy hoạch Ràng buộc (Constraint Programming)",
                "Định tuyến Xe buýt Trường học & Giảm thiểu Tác động Tiêu cực",
                "Giải thuật Tìm kiếm Lân cận Lớn (Large Neighborhood Search)"
            ],
            "bio_vi": "Thạc sĩ, nghiên cứu sinh chuyên sâu về tối ưu hóa lập lịch công nghiệp và điều độ máy móc có xung đột, tác giả chính của các công trình công bố trên ITOR, Journal of the Operational Research Society và Handbook of Combinatorial Optimization (Springer Nature).",
            "avatar": "/assets/images/people/ta_dinh_quy.jpg"
        }
    ],
    "young_researchers_and_authors": [
        {
            "id": "le-ba-luat",
            "name": "Lê Bá Luật",
            "name_en": "Ba Luat Le",
            "role_vi": "Nghiên cứu viên trẻ / Tác giả chính",
            "role_en": "Junior Researcher / Lead Author",
            "current_status_vi": "Thủ khoa toàn trường Đại học Phenikaa (2025), Nhận học bổng Tiến sĩ toàn phần tại Singapore Management University (SMU, 2026)",
            "current_status_en": "Valedictorian of Phenikaa University (2025), Full PhD Scholarship at Singapore Management University (SMU, 2026)",
            "featured_publications": [
                "INFORMS Journal on Computing (2026)",
                "Computers & Operations Research (2026)",
                "CSONET (2025)"
            ],
            "research_interests": [
                "Competitive Facility Location",
                "Conic Programming & Outer Approximation",
                "Discrete Optimization"
            ]
        },
        {
            "id": "tran-nam-khanh",
            "name": "Trần Nam Khánh",
            "name_en": "Nam-Khanh Tran",
            "role_vi": "Nghiên cứu viên trẻ / Đồng tác giả chính",
            "role_en": "Junior Researcher / Co-Author",
            "current_status_vi": "Tác giả chính công bố trên Transportation Research Part C (2026) & CITA (2025)",
            "current_status_en": "Co-author in Transportation Research Part C (2026) & CITA (2025)",
            "featured_publications": [
                "Transportation Research Part C: Emerging Technologies (2026)",
                "CITA (2025)"
            ],
            "research_interests": [
                "Revisit Flying Sidekick Traveling Salesman Problem (RV-FSTSP)",
                "Drone Routing & Multi-Trip Delivery Logistics"
            ]
        },
        {
            "id": "tran-trung-duc",
            "name": "Trần Trung Đức",
            "name_en": "Trung Duc Tran",
            "role_vi": "Nghiên cứu viên / Tác giả",
            "role_en": "Researcher / Author",
            "featured_publications": [
                "COMOSA (2025/2026)"
            ],
            "research_interests": [
                "Electric Vehicle Routing Problem with Time Windows (EVRP-TW)",
                "Green Supply Chain & Smart Charging Stations"
            ]
        },
        {
            "id": "le-thanh-hong",
            "name": "Lê Thanh Hồng",
            "name_en": "Le Thanh Hong",
            "role_vi": "Nghiên cứu viên / Tác giả chính",
            "role_en": "Researcher / Lead Author",
            "featured_publications": [
                "Transportation Research Part C: Emerging Technologies (2026)",
                "CITA (2025)"
            ],
            "research_interests": [
                "Stage-Based Mathematical Modeling",
                "Construct-Merge-Solve & Adapt Metaheuristics",
                "Drone-Assisted Routing"
            ]
        },
        {
            "id": "nguyen-duc-cong",
            "name": "Nguyễn Đức Công",
            "name_en": "Nguyen Dinh Cong",
            "role_vi": "Nghiên cứu viên / Tác giả",
            "role_en": "Researcher / Author",
            "featured_publications": [
                "Transportation Research Part C: Emerging Technologies (2026)",
                "CITA (2025)"
            ],
            "research_interests": [
                "Combinatorial Optimization",
                "UAV Routing and Scheduling"
            ]
        },
        {
            "id": "le-huu-trung",
            "name": "Lê Hữu Trung",
            "name_en": "Le Huu Trung",
            "role_vi": "Nghiên cứu viên / Tác giả",
            "role_en": "Researcher / Author",
            "featured_publications": [
                "CITA (2025)"
            ],
            "research_interests": [
                "Algorithmic Engineering",
                "Metaheuristics for Routing Problems"
            ]
        },
        {
            "id": "pham-tuan-anh",
            "name": "Phạm Tuấn Anh",
            "name_en": "Tuan Anh Pham",
            "role_vi": "Nghiên cứu viên / Tác giả",
            "role_en": "Researcher / Author",
            "featured_publications": [
                "European Journal of Operational Research (2025)",
                "COMOSA (2025/2026)"
            ],
            "research_interests": [
                "Inventory Routing Problems (IRP)",
                "Hybrid Genetic Search",
                "Energy-Aware Drone Logistics"
            ]
        },
        {
            "id": "pham-hoang-giang",
            "name": "Phạm Hoàng Giang",
            "name_en": "Hoang Giang Pham",
            "role_vi": "Nghiên cứu viên / Tác giả",
            "role_en": "Researcher / Author",
            "featured_publications": [
                "IJCAI (2026)",
                "SOICT (2025)"
            ],
            "research_interests": [
                "Stackelberg Security Games",
                "Quantal Response Models",
                "Constraint Programming Cutting-Plane Algorithms"
            ]
        }
    ],
    "hall_of_fame": [
        {
            "id": "hof-le-ba-luat",
            "name": "Lê Bá Luật",
            "name_en": "Ba Luat Le",
            "achievement_vi": "Thủ khoa toàn trường – Trường Công nghệ, Đại học Phenikaa (2025); Giành học bổng nghiên cứu sinh Tiến sĩ (PhD) toàn phần tại Singapore Management University (SMU, 2026).",
            "achievement_en": "Valedictorian of College of Technology, Phenikaa University (2025); Awarded Full PhD Scholarship at Singapore Management University (SMU, 2026).",
            "destination_institution": "Singapore Management University (SMU)",
            "country": "Singapore",
            "year": 2025,
            "award_type": "PhD Scholarship & Valedictorian",
            "field": "Operations Research & Computer Science",
            "advisors": "GS. Mai Tiến (SMU), TS. Vũ Đức Minh (NEU), PGS. TS. Hà Minh Hoàng"
        },
        {
            "id": "hof-nguyen-tat-dat",
            "name": "Nguyễn Tất Đạt",
            "name_en": "Tat Dat Nguyen",
            "achievement_vi": "Tác giả chính công bố trên European Journal of Operational Research (EJOR, Q1); Giành học bổng nghiên cứu sinh Tiến sĩ (PhD) toàn phần tại Trường Đại học Liverpool John Moores (LJMU, Vương quốc Anh, 2025).",
            "achievement_en": "Lead author in European Journal of Operational Research (EJOR, Q1); Awarded Full PhD Scholarship at Liverpool John Moores University (LJMU, UK, 2025).",
            "destination_institution": "Liverpool John Moores University (LJMU)",
            "country": "United Kingdom",
            "year": 2025,
            "award_type": "PhD Scholarship",
            "field": "Logistics & Operations Research",
            "advisors": "PGS. TS. Hà Minh Hoàng, Rafael Martinelli"
        },
        {
            "id": "hof-nguyen-hai-thu",
            "name": "Nguyễn Hải Thu",
            "name_en": "Hai Thu Nguyen",
            "achievement_vi": "Thủ khoa chương trình Định phí Bảo hiểm và Quản trị rủi ro – Khóa 63, Đại học Kinh tế Quốc dân (NEU); Giành học bổng nghiên cứu sinh Tiến sĩ (PhD) tại University of Connecticut (UConn, Hoa Kỳ, 2025).",
            "achievement_en": "Valedictorian in Actuarial Science and Risk Management - Intake 63, NEU; Awarded PhD Scholarship at University of Connecticut (UConn, USA, 2025).",
            "destination_institution": "University of Connecticut (UConn)",
            "country": "United States",
            "year": 2025,
            "award_type": "PhD Scholarship & Program Valedictorian",
            "field": "Actuarial Science & Quantitative Risk Management",
            "advisors": "Khoa Toán Kinh tế & SLSCM Lab, NEU"
        }
    ],
    "student_researchers": [
        {
            "name": "Hà Thu Hà",
            "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
            "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Phùng Thị Thu Trang",
            "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
            "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Tạ Thành Đạt",
            "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
            "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Đặng Nhật Minh",
            "major": "Khoa học Dữ liệu & Trí tuệ Nhân tạo (KHDL&TTNT)",
            "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Mai Thành Lộc",
            "major": "Toán Kinh tế",
            "institution": "Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Lã Quang Chiến",
            "major": "Toán Kinh tế",
            "institution": "Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Nguyệt Ánh",
            "major": "Công nghệ Thông tin",
            "institution": "Trường Công nghệ, Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Nguyễn Trần Quốc Đạt",
            "major": "Toán Kinh tế",
            "institution": "Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Lê Quốc Trần Anh",
            "major": "Toán Kinh tế",
            "institution": "Đại học Kinh tế Quốc dân"
        },
        {
            "name": "Hà Quang Minh",
            "major": "Toán Kinh tế",
            "institution": "Đại học Kinh tế Quốc dân"
        }
    ],
    "global_academic_partners": [
        {
            "country": "Singapore",
            "institution": "Singapore Management University (SMU)",
            "key_collaborators": [
                "GS. Mai Tiến (School of Computing and Information Systems)"
            ],
            "research_focus": "Discrete Choice Models, Competitive Facility Location, Conic Optimization"
        },
        {
            "country": "Italy",
            "institution": "University of Udine",
            "key_collaborators": [
                "GS. Andrea Schaerf (Department of Polytechnic of Engineering and Architecture)"
            ],
            "research_focus": "Parallel Machine Scheduling, Constraint Programming, Metaheuristics"
        },
        {
            "country": "Austria",
            "institution": "Austrian Research Community / Partner Institutes",
            "key_collaborators": [
                "TS. Roberto Maria Rosati"
            ],
            "research_focus": "Combinatorial Optimization, Metaheuristic Neighborhood Search"
        },
        {
            "country": "United Kingdom",
            "institution": "Cardiff University, Lancaster University, Liverpool John Moores University (LJMU)",
            "key_collaborators": [
                "Faculty & Research Fellows in Operations Management and Analytics"
            ],
            "research_focus": "Supply Chain Analytics, Stochastic Modeling, Logistics Networks"
        },
        {
            "country": "United States",
            "institution": "University of Connecticut (UConn), Loyola University Chicago, University of Michigan - Flint",
            "key_collaborators": [
                "Collaborators in Actuarial Science, Optimization, and Industrial Engineering"
            ],
            "research_focus": "Quantitative Risk, Behavioral Economics, Smart Energy Systems"
        },
        {
            "country": "Canada & France",
            "institution": "Université de Montréal / CIRRELT",
            "key_collaborators": [
                "GS. André Langevin",
                "GS. Thibaut Vidal"
            ],
            "research_focus": "Capacitated Arc Routing (CARP), Inventory Routing (IRP), Hybrid Genetic Search"
        },
        {
            "country": "Vietnam",
            "institution": "VNU-HUS, HUST, Phenikaa University, VinUniversity",
            "key_collaborators": [
                "PGS. TS. Hà Minh Hoàng (VNU-HUS)",
                "TS. Tạ Thúy Anh (Phenikaa University)",
                "TS. Đức Đồng Đỗ (HUST)"
            ],
            "research_focus": "National Science Foundation Collaborations, Graph Algorithms, High-Performance Computing"
        }
    ]
}

projects = [
    {
        "id": "hanoi-smart-water-network",
        "title_vi": "AI & OR trong Quản lý Mạng lưới Cấp thoát nước Đô thị Hà Nội",
        "title_en": "AI & OR for Hanoi Urban Smart Water Supply and Drainage Network Management",
        "category": "Dự án Nghiên cứu Thực chiến & Hợp tác Liên phòng Thí nghiệm",
        "collaboration": "Liên Lab CADA (P1601 A1) & SLSCM (P1613 A1) - Khoa Khoa học Dữ liệu & Trí tuệ Nhân tạo (FDA), Trường Công nghệ, Đại học Kinh tế Quốc dân",
        "period": "2025 - Nay",
        "status": "Đang triển khai (Active)",
        "leads": [
            {
                "name": "TS. Vũ Đức Minh",
                "email": "minhvd@neu.edu.vn",
                "role": "Đồng chủ trì dự án (SLSCM Lab)"
            },
            {
                "name": "ThS. Lê Duy Khánh",
                "email": "khanhld@neu.edu.vn",
                "role": "Đồng chủ trì dự án (CADA Lab)"
            }
        ],
        "description_vi": "Dự án liên ngành áp dụng Trí tuệ Nhân tạo (AI), Khoa học Dữ liệu và Vận trù học (OR) vào bài toán quản trị thông minh hệ thống hạ tầng cấp thoát nước của Thủ đô Hà Nội. Dự án xử lý chuỗi dữ liệu thực tế từ hệ thống cảm biến áp lực, lưu lượng và chất lượng nước phân tán trên toàn thành phố.",
        "description_en": "An interdisciplinary smart city initiative applying AI, Data Science, and Operations Research to the urban water supply and drainage infrastructure of Hanoi. The project processes live IoT telemetry from flow, pressure, and water quality sensors.",
        "pillars": [
            {
                "pillar": "AI Side",
                "description_vi": "Xây dựng mô hình học máy (Machine Learning / Deep Learning) dự báo nhu cầu tiêu thụ nước theo thời gian thực, phát hiện rò rỉ sớm và cảnh báo nguy cơ ngập lụt đô thị theo kịch bản mưa lớn.",
                "description_en": "Develop predictive ML/DL models for real-time water demand forecasting, anomaly detection for pipe leakages, and urban inundation risk alerts."
            },
            {
                "pillar": "OR Side",
                "description_vi": "Thiết kế các giải thuật tối ưu hóa vận trù học điều phối áp lực trạm bơm, quy hoạch tuyến truyền tải và điều tiết dòng chảy nhằm giảm thiểu tiêu hao điện năng và thất thoát nước vô hình.",
                "description_en": "Design operations research algorithms for pump station scheduling, valve regulation, and distribution routing to minimize operational energy costs and non-revenue water loss."
            },
            {
                "pillar": "Data Side",
                "description_vi": "Xây dựng đường ống (data pipeline) thu thập, chuẩn hóa và phân tích dữ liệu lớn chuỗi thời gian (Time Series) từ mạng lưới cảm biến IoT thủy lực phân tán của thành phố Hà Nội.",
                "description_en": "Construct automated IoT data ingestion pipelines to clean, normalize, and analyze high-frequency hydraulic time-series feeds across metropolitan Hanoi."
            }
        ],
        "deliverables": [
            "Hệ thống mô hình hóa dự báo lưu lượng và áp lực mạng lưới thời gian thực",
            "Thuật toán tối ưu hóa điều tiết bơm và đóng mở van thông minh",
            "Báo cáo khoa học và bài báo công bố trên diễn đàn hội nghị/tạp chí quốc tế uy tín",
            "Chuyển giao giải pháp thử nghiệm cho các đơn vị vận hành cấp nước đô thị"
        ]
    },
    {
        "id": "rv-fstsp-optimization",
        "title_vi": "Phát triển mô hình và giải thuật cho bài toán Revisit Flying Sidekick Traveling Salesman Problem",
        "title_en": "Model and Algorithm Development for the Revisit Flying Sidekick Traveling Salesman Problem",
        "category": "Đề tài Nghiên cứu Khoa học Cấp cơ sở (Institutional Research Grant)",
        "sponsor": "Đại học Kinh tế Quốc dân (NEU)",
        "grant_code": "NEU.CS.2025.SLSCM01",
        "period": "2025 – Nay",
        "status": "Đang triển khai (Active)",
        "leads": [
            {
                "name": "TS. Vũ Đức Minh",
                "email": "minhvd@neu.edu.vn",
                "role": "Chủ nhiệm đề tài (Principal Investigator)"
            },
            {
                "name": "Trần Nam Khánh",
                "role": "Nghiên cứu viên chính (Key Researcher)"
            },
            {
                "name": "Lê Thanh Hồng",
                "role": "Nghiên cứu viên (Researcher)"
            },
            {
                "name": "Nguyễn Đức Công",
                "role": "Nghiên cứu viên (Researcher)"
            }
        ],
        "description_vi": "Nghiên cứu mô hình kết hợp phương tiện xe tải và máy bay không người lái (drone) trong logistics giao nhận hàng hóa chặng cuối (last-mile delivery). Đề tài giải phóng các ràng buộc cứng nhắc truyền thống, cho phép xe tải có thể ghé thăm lại (revisit) các địa điểm đã phục vụ và dừng đỗ tĩnh để triển khai nhiều đợt xuất kích liên tiếp của drone.",
        "description_en": "Investigates coordinated truck-and-drone logistics for last-mile delivery, relaxing traditional single-visit restrictions to allow the truck to revisit customer nodes and serve as a stationary launchpad for multi-trip drone sorties.",
        "outcomes": [
            "Công bố bài báo quốc tế Q1 trên tạp chí đỉnh cao Transportation Research Part C: Emerging Technologies (2026, Vol. 192)",
            "Công bố bài báo tại Hội nghị Quốc tế CITA 2025 (Lecture Notes in Networks and Systems, Springer)",
            "Phát triển mô hình toán học Stage-based formulation kết hợp giải thuật metaheuristic CMSA với hiệu năng vượt trội"
        ]
    },
    {
        "id": "vinif-cfl-cross-nested-logit",
        "title_vi": "Competitive Facility Location under Cross-Nested Logit Customer Choice Model",
        "title_en": "Competitive Facility Location under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches",
        "category": "Đề tài Nghiên cứu Trọng điểm (National Innovation Grant)",
        "sponsor": "Quỹ Đổi mới sáng tạo Vingroup (VINIF)",
        "grant_code": "Grant VINIF.2024.DA072",
        "period": "2024 – 2026",
        "status": "Đã công bố & Tiếp tục mở rộng (Active)",
        "leads": [
            {
                "name": "Lê Bá Luật",
                "role": "Tác giả chính (Lead Researcher)"
            },
            {
                "name": "GS. Mai Tiến",
                "affiliation": "Singapore Management University (SMU)",
                "role": "Đồng tác giả / Cố vấn quốc tế"
            },
            {
                "name": "TS. Tạ Thúy Anh",
                "affiliation": "Trường ĐH Phenikaa",
                "role": "Đồng tác giả"
            },
            {
                "name": "PGS. TS. Hà Minh Hoàng",
                "affiliation": "VNU-HUS & SLSCM Lab",
                "role": "Đồng tác giả / Cố vấn cấp cao"
            },
            {
                "name": "TS. Vũ Đức Minh",
                "affiliation": "SLSCM Lab, Trường Công nghệ - NEU",
                "role": "Đồng tác giả / Trưởng Lab"
            }
        ],
        "description_vi": "Đề tài giải quyết bài toán lựa chọn vị trí cơ sở kinh doanh cạnh tranh dưới mô hình hành vi khách hàng Cross-Nested Logit (CNL). Nghiên cứu lần đầu chứng minh bài toán thuộc lớp NP-hard ngay cả với cấu trúc đơn giản, đồng thời biến đổi hàm mục tiêu phi lõm thành bài toán quy hoạch nón nón lồi số nguyên hỗn hợp (mixed-integer exponential cone convex program) để giải chính xác tối ưu.",
        "description_en": "Addresses competitive facility location under customer choice behavior captured by the general Cross-Nested Logit (CNL) model, establishing NP-hardness proofs and transforming the non-concave objective into a mixed-integer exponential cone convex program solvable via outer approximation.",
        "outcomes": [
            "Công bố bài báo quốc tế đỉnh cao trên INFORMS Journal on Computing (IJOC, 2026)",
            "Được biên tập viên Area Editor Andrea Lodi trực tiếp chấp nhận",
            "Mã nguồn mở và toàn bộ dữ liệu thực nghiệm được tích hợp chính thức vào IJOC GitHub Software Repository"
        ]
    },
    {
        "id": "training-smart-decisions",
        "title_vi": "Khóa đào tạo chuyên sâu: Từ dữ liệu đến phân tích và ra quyết định thông minh",
        "title_en": "Executive & Academic Training: From Data to Analytics and Intelligent Decision Making",
        "category": "Chương trình Đào tạo Chuyên sâu & Chuyển giao Tri thức",
        "organizer": "SLSCM Lab & Khoa Khoa học Dữ liệu và Trí tuệ Nhân tạo (FDA) – Trường Công nghệ, Đại học Kinh tế Quốc dân",
        "period": "Định kỳ hàng quý (2025 – 2026)",
        "status": "Đang tổ chức (Active)",
        "target_audience_vi": "Sinh viên ưu tú, học viên cao học, kỹ sư phân tích dữ liệu và chuyên viên quản trị vận hành, chuỗi cung ứng tại các doanh nghiệp sản xuất, bán lẻ và logistics.",
        "target_audience_en": "Talented undergraduates, graduate students, data analysts, and supply chain professionals from manufacturing, retail, and logistics enterprises.",
        "description_vi": "Khóa đào tạo ngắn hạn nhằm trang bị tư duy mô hình hóa toán học, kỹ năng lập trình tối ưu hóa với Python, Gurobi, OR-Tools và ứng dụng các thuật toán Machine Learning vào việc đưa ra các quyết định kinh doanh tối ưu.",
        "curriculum": [
            {
                "module_vi": "Chuyên đề 1: Phân tích Dữ liệu Vận hành & Trực quan hóa Chuỗi Cung ứng",
                "module_en": "Module 1: Operational Data Analysis & Supply Chain Visualization",
                "content_vi": "Làm sạch dữ liệu lớn, phân tích khám phá (EDA), trích xuất chỉ số hiệu quả vận hành (KPIs) trong kho bãi và vận tải."
            },
            {
                "module_vi": "Chuyên đề 2: Mô hình hóa Toán học & Vận trù học Thực chiến",
                "module_en": "Module 2: Practical Mathematical Modeling & Operations Research",
                "content_vi": "Xây dựng các mô hình quy hoạch tuyến tính (LP), quy hoạch nguyên (MIP) cho bài toán tồn kho, định tuyến xe (VRP) và điều độ sản xuất."
            },
            {
                "module_vi": "Chuyên đề 3: Công cụ Solvers Hiện đại trong Ra quyết định",
                "module_en": "Module 3: Modern Solvers in Business Decision Making",
                "content_vi": "Thực hành lập trình Python kết hợp Gurobi, Google OR-Tools, PuLP và SCIP để giải các bài toán quy mô công nghiệp."
            },
            {
                "module_vi": "Chuyên đề 4: Tích hợp AI và Học máy trong Tối ưu hóa Chuỗi cung ứng",
                "module_en": "Module 4: AI and Machine Learning in Supply Chain Optimization",
                "content_vi": "Mô hình kết hợp Dự báo và Tối ưu (Predict-then-Optimize), dự báo nhu cầu bằng Deep Learning kết hợp phân bổ nguồn lực."
            }
        ],
        "instructors": [
            "TS. Vũ Đức Minh (Head of SLSCM Lab, NEU)",
            "Đội ngũ giảng viên và chuyên gia nghiên cứu từ Khoa FDA, Trường Công nghệ - NEU"
        ]
    }
]

overview = {
    "name_en": "Smart Logistics and Supply Chain Management Lab",
    "name_vi": "Lab Quản trị Logistics và Chuỗi cung ứng thông minh",
    "abbreviation": "SLSCM Lab",
    "affiliation": "Trường Công nghệ, Đại học Kinh tế Quốc dân (College of Technology - National Economics University, NEU)",
    "faculty_department": "Khoa Khoa học Dữ liệu và Trí tuệ Nhân tạo (Faculty of Data Science and AI - FDA)",
    "address": "P1613, Tòa nhà A1, Đại học Kinh tế Quốc dân – 207 Giải Phóng, Hà Nội",
    "head_of_lab": {
        "name": "TS. Vũ Đức Minh",
        "name_en": "Dr. Duc-Minh Vu",
        "email": "minhvd@neu.edu.vn",
        "title": "Trưởng phòng thí nghiệm / Giảng viên (Head of Lab / Lecturer)",
        "office": "P1613, Tòa nhà A1, NEU"
    },
    "metrics": {
        "total_publications_2025_2026": len(publications),
        "journal_articles": sum(1 for p in publications if p["type"] == "Journal"),
        "q1_journals": sum(1 for p in publications if p["type"] == "Journal" and p.get("is_featured", False)),
        "conference_papers": sum(1 for p in publications if p["type"] == "Conference"),
        "book_chapters": sum(1 for p in publications if p["type"] == "Book Chapter"),
        "featured_papers": sum(1 for p in publications if p.get("is_featured", False)),
        "phd_scholarships": len(people["hall_of_fame"]),
        "valedictorians": sum(1 for h in people["hall_of_fame"] if "Valedictorian" in h["award_type"]),
        "active_projects": len(projects),
        "student_researchers": len(people["student_researchers"]),
        "international_partner_countries": len(people["global_academic_partners"])
    },
    "team_structure": {
        "total_faculty_researchers": 6,
        "professors": 1,
        "phd": 2,
        "phd_candidates": 2,
        "masters": 1,
        "talented_students": 10,
        "student_community": "Sinh viên tài năng tuyển chọn từ các ngành KHDL&TTNT, Toán Kinh tế, CNTT của NEU, cùng học viên HUST, VNU-HUS..."
    },
    "key_collaborators": [
        {
            "name": "PGS. TS. Hà Minh Hoàng",
            "role": "Cố vấn khoa học / Nghiên cứu gia cao cấp",
            "affiliation": "VNU University of Science & SLSCM Lab"
        },
        {
            "name": "ThS. Tạ Đình Quý",
            "role": "Nghiên cứu viên / Nghiên cứu sinh Tiến sĩ",
            "affiliation": "SLSCM Lab & Viện Toán học / HUST"
        },
        {
            "name": "Lê Bá Luật",
            "role": "Nghiên cứu viên trẻ / Tác giả chính IJOC & COR",
            "affiliation": "SLSCM Lab & Singapore Management University (SMU)"
        },
        {
            "name": "Trần Nam Khánh",
            "role": "Nghiên cứu viên trẻ / Đồng tác giả TRC",
            "affiliation": "SLSCM Lab"
        }
    ],
    "research_pillars": [
        {
            "id": "operational_optimization",
            "title_vi": "Tối ưu hóa Vận hành & Thiết kế Thuật toán",
            "title_en": "Operational Optimization & Algorithmic Design",
            "description_vi": "Phân tích và thiết kế thuật toán chính xác & metaheuristic cho các bài toán định tuyến (VRP, CARP), lập lịch (parallel machine scheduling, conflict jobs), đóng gói (packing) và bài toán định vị cơ sở cạnh tranh.",
            "topics": [
                "Vehicle Routing Problem (VRP, CARP)",
                "Parallel Machine Scheduling with Conflicting Jobs",
                "Branch-and-Cut & Exponential Cone Programming",
                "Orienteering & Set Team Orienteering Problems",
                "Competitive Facility Location"
            ],
            "featured_journals": [
                "INFORMS Journal on Computing (IJOC)",
                "Computers & Operations Research (COR)",
                "International Transactions in Operational Research (ITOR)",
                "European Journal of Operational Research (EJOR)"
            ]
        },
        {
            "id": "ml_optimization",
            "title_vi": "Tối ưu hóa trong Khoa học Dữ liệu & Trí tuệ Nhân tạo",
            "title_en": "Optimization in Data Science & Machine Learning",
            "description_vi": "Nghiên cứu các thuật toán tối ưu hóa phi đạo hàm (gradient-free), metaheuristics cho mạng nơ-ron (MetaPerceptron, GrafoRVFL), lý thuyết trò chơi an ninh Stackelberg và mô hình dự báo thị trường năng lượng.",
            "topics": [
                "Metaheuristics for Deep Learning (MetaPerceptron)",
                "Random Vector Functional Link Networks (GrafoRVFL)",
                "Stackelberg Security Games & Quantal Response",
                "Predict-then-Optimize & Time Series Forecasting"
            ],
            "featured_venues": [
                "IJCAI (Top-tier AI Conference)",
                "Neurocomputing",
                "Computer Standards & Interfaces",
                "CSONET / SOICT"
            ]
        },
        {
            "id": "green_transportation",
            "title_vi": "Mô hình Vận tải Hiện đại & Chuỗi Cung ứng Bền vững",
            "title_en": "Modern Transportation & Green Supply Chain",
            "description_vi": "Xây dựng mô hình chuỗi cung ứng thế hệ mới với sự tham gia của máy bay không người lái (drones/UAVs), xe điện sạc linh hoạt (EVRP-TW), điều độ xe buýt trường học và tối ưu hóa quản lý tiêu thụ năng lượng.",
            "topics": [
                "Revisit Flying Sidekick TSP (RV-FSTSP)",
                "Multi-Trip Drone Delivery with Time Windows",
                "Electric Vehicle Routing (Station-based vs Route-based Charging)",
                "School Bus Rescheduling under Disruption",
                "Smart Energy Demand Response"
            ],
            "featured_journals": [
                "Transportation Research Part C: Emerging Technologies (TRC)",
                "Journal of the Operational Research Society (JORS)",
                "Energy Research & Social Science (ERSS)",
                "COMOSA / CITA"
            ]
        }
    ],
    "hall_of_fame_summary": {
        "valedictorian_count": 2,
        "phd_scholarships_count": 3,
        "destinations": [
            "Singapore Management University (SMU, Singapore)",
            "Liverpool John Moores University (LJMU, United Kingdom)",
            "University of Connecticut (UConn, United States)"
        ]
    },
    "official_kpi_2025": {
        "internal_scientific_activities": 20,
        "internal_training_sessions": 8,
        "seminars_organized": 4,
        "research_publication_events": 2
    },
    "social": {
        "facebook": "https://www.facebook.com/slscm.lab",
        "website_fda": "https://fda.neu.edu.vn/slscm/"
    }
}

# Write files
pub_path = os.path.join(PROCESSED_DIR, 'slscm_publications_2025_2026.json')
with open(pub_path, 'w', encoding='utf-8') as f:
    json.dump(publications, f, ensure_ascii=False, indent=2)
print(f"Wrote {len(publications)} publications to {pub_path}")

people_path = os.path.join(PROCESSED_DIR, 'slscm_people.json')
with open(people_path, 'w', encoding='utf-8') as f:
    json.dump(people, f, ensure_ascii=False, indent=2)
print(f"Wrote people data to {people_path}")

projects_path = os.path.join(PROCESSED_DIR, 'slscm_projects.json')
with open(projects_path, 'w', encoding='utf-8') as f:
    json.dump(projects, f, ensure_ascii=False, indent=2)
print(f"Wrote {len(projects)} projects to {projects_path}")

overview_path = os.path.join(PROCESSED_DIR, 'slscm_overview.json')
with open(overview_path, 'w', encoding='utf-8') as f:
    json.dump(overview, f, ensure_ascii=False, indent=2)
print(f"Wrote overview data to {overview_path}")
