-- ==============================================================================
-- SLSCM Lab — Automated Seed Data Export for Supabase
-- Generated from authoritative database/slscm.sqlite
-- ==============================================================================

BEGIN;

-- ------------------------------------------------------------------------------
-- Table: institutions (13 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.institutions ("id", "name", "short_name", "country", "city", "website", "created_at")
VALUES
  ('neu', 'National Economics University', 'NEU', 'Vietnam', 'Hanoi', 'https://neu.edu.vn', '2026-09-24 03:52:37'),
  ('vnu-hus', 'VNU University of Science', 'VNU-HUS', 'Vietnam', 'Hanoi', 'https://hus.vnu.edu.vn', '2026-09-24 03:52:37'),
  ('hust', 'Hanoi University of Science and Technology', 'HUST', 'Vietnam', 'Hanoi', 'https://hust.edu.vn', '2026-09-24 03:52:37'),
  ('smu', 'Singapore Management University', 'SMU', 'Singapore', 'Singapore', 'https://smu.edu.sg', '2026-09-24 03:52:37'),
  ('uconn', 'University of Connecticut', 'UConn', 'United States', 'Storrs', 'https://uconn.edu', '2026-09-24 03:52:37'),
  ('ljmu', 'Liverpool John Moores University', 'LJMU', 'United Kingdom', 'Liverpool', 'https://ljmu.ac.uk', '2026-09-24 03:52:37'),
  ('usf', 'University of South Florida', 'USF', 'United States', 'Tampa', 'https://usf.edu', '2026-09-24 03:52:37'),
  ('vinuni', 'VinUniversity', 'VinUni', 'Vietnam', 'Hanoi', 'https://vinuni.edu.vn', '2026-09-24 03:52:37'),
  ('phenikaa', 'Phenikaa University', 'Phenikaa', 'Vietnam', 'Hanoi', 'https://phenikaa-uni.edu.vn', '2026-09-24 03:52:37'),
  ('udine', 'University of Udine', 'UniUd', 'Italy', 'Udine', 'https://uniud.it', '2026-09-24 03:52:37'),
  ('brescia', 'University of Brescia', 'UniBs', 'Italy', 'Brescia', 'https://unibs.it', '2026-09-24 03:52:37'),
  ('graz', 'University of Graz', 'UniGraz', 'Austria', 'Graz', 'https://uni-graz.at', '2026-09-24 03:52:37'),
  ('inria', 'INRIA', 'Inria', 'France', 'Paris', 'https://inria.fr', '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: research_pillars (3 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.research_pillars ("id", "title", "description", "topics", "featured_venues", "display_order", "status")
VALUES
  ('supply_chain_optimization', 'Supply Chain & Logistics Optimization', 'Advancing operations research and mathematical optimization for complex logistics and supply chain systems, including vehicle routing, scheduling, facility location, network design, inventory management, transportation planning, and integrated supply chain decision-making.', '["Vehicle Routing & Transportation Optimization", "Scheduling & Resource Allocation", "Facility Location & Network Design", "Inventory & Supply Chain Planning", "Exact Algorithms & Mathematical Programming", "Metaheuristics & Hybrid Optimization"]'::jsonb, '["INFORMS Journal on Computing (IJOC)", "Computers & Operations Research (COR)", "International Transactions in Operational Research (ITOR)", "European Journal of Operational Research (EJOR)", "Transportation Research Part C: Emerging Technologies (TRC)", "Journal of the Operational Research Society (JORS)"]'::jsonb, 0, 'active'),
  ('ai_supply_chain_intelligence', 'AI & Data-Driven Supply Chain Intelligence', 'Developing artificial intelligence and data-driven methods for intelligent supply chain decision-making, including machine learning, forecasting, predictive-prescriptive analytics, learning-enhanced optimization, and AI-supported planning and operations.', '["Machine Learning for Supply Chains", "Predictive-Prescriptive Analytics", "Demand & Time-Series Forecasting", "Learning-Enhanced Optimization", "Metaheuristics for Machine Learning", "Intelligent Decision Support"]'::jsonb, '["IJCAI (Top-tier AI Conference)", "Neurocomputing", "Computer Standards & Interfaces", "CSoNet / SOICT"]'::jsonb, 1, 'active'),
  ('decision_analytics', 'Optimization & Decision Analytics for Complex Systems', 'Developing optimization and decision-analytics approaches for complex systems beyond logistics and supply chains, with applications in energy, healthcare, finance and business, public services, urban systems, hospitality, and digital operations.', '["Energy & Sustainable Systems", "Healthcare & Public Services", "Finance & Business Analytics", "Urban & Transportation Systems", "Hospitality & Tourism", "Digital & Computing Systems"]'::jsonb, '["Energy Research & Social Science (ERSS)", "Journal of the Operational Research Society (JORS)", "Computers & Operations Research (COR)", "International Transactions in Operational Research (ITOR)"]'::jsonb, 2, 'active')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: people (24 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.people ("id", "name", "name_en", "title", "role_badge", "category", "affiliation", "affiliation_id", "email", "office", "bio", "avatar", "major", "current_status", "status", "display_order", "created_at")
VALUES
  ('vu-duc-minh', 'Dr. Duc Minh Vu', 'Dr. Duc Minh Vu', '', 'LAB HEAD / FACULTY MEMBER', 'faculty', '', 'neu', 'minhvd@neu.edu.vn', 'Room 1613, Building A1', 'Dr. Vu Duc Minh is the Head of SLSCM Lab and Lecturer at the College of Technology, National Economics University (NEU). He leads multiple research projects in transportation optimization, drone routing, and facility location problems, with publications in premier international journals including INFORMS Journal on Computing, Transportation Research Part C, and Journal of the Operational Research Society.', '/assets/images/people/vu_duc_minh.jpg', NULL, NULL, 'active', 0, '2026-09-24 03:52:37'),
  ('ha-minh-hoang', 'Assoc. Prof. Minh Hoang Ha', 'Assoc. Prof. Minh Hoang Ha', '', 'DEAN OF FACULTY', 'faculty', '', 'neu', '', 'Room 1604, Building A1', 'Associate Professor, Ph.D., Dean of the Faculty of Mathematics, Mechanics and Informatics at VNU University of Science (VNU-HUS), Senior Scientific Advisor at SLSCM Lab. A leading Vietnamese expert in combinatorial optimization algorithm design, with dozens of authoritative publications in EJOR, Computers & Operations Research, ITOR, IJOC, and JORS.', '/assets/images/people/ha_minh_hoang.jpg', NULL, NULL, 'active', 1, '2026-09-24 03:52:37'),
  ('dinh-nho-minh', 'Dr. Nho Minh Dinh', 'Dr. Nho Minh Dinh', '', 'FACULTY MEMBER', 'faculty', '', 'neu', '', 'Room 1613, Building A1', 'Ph.D. in Data Analytics in Business and Economics specializing in Operations Research from the University of Brescia (Italy, 2023), former Postdoctoral Researcher at the University of Calabria (Italy). Lecturer at the Faculty of Data Science and AI (FDA), College of Technology, NEU. Specializes in applied operations research, supply chain optimization, matheuristics, and inventory routing problems (IRP).', '/assets/images/people/dinh_nho_minh.jpg', NULL, NULL, 'active', 2, '2026-09-24 03:52:37'),
  ('ta-dinh-quy', 'MSc. Ta Dinh Quy', 'MSc. Ta Dinh Quy', '', 'Deputy Head of Lab / FACULTY MEMBER / PhD Candidate', 'faculty', '', 'neu', '', 'Room 1613, Building A1', 'Master of Science, Lecturer at College of Technology, NEU and Ph.D. candidate specializing in industrial scheduling and machine scheduling with conflict jobs. Lead author of publications in ITOR, Journal of the Operational Research Society, and Springer''s Handbook of Combinatorial Optimization.', '/assets/images/people/ta_dinh_quy.jpg', NULL, NULL, 'active', 3, '2026-09-24 03:52:37'),
  ('pham-tuan-anh', 'MSc. Tuan Anh Pham', 'MSc. Tuan Anh Pham', '', 'FACULTY MEMBER / PhD Candidate', 'faculty', '', 'neu', '', 'Room 1613, Building A1', 'Master of Science, Lecturer at College of Technology, National Economics University (NEU) and researcher at SLSCM Lab. Author of publications in premier international operations research journals including European Journal of Operational Research (EJOR, Q1) and Springer Optimization and Its Applications (COMOSA), specializing in hybrid genetic search (HGS) and inventory routing problems (IRP).', '/assets/images/people/pham_tuan_anh.jpg', NULL, NULL, 'active', 4, '2026-09-24 03:52:37'),
  ('trung-le-huu', 'Trung Le Huu', 'Trung Le Huu', '', 'WEB / TECH LEAD', 'web_tech_lead', 'University of Warwick (2026)', 'neu', '', NULL, NULL, '/assets/images/people/trung_le_huu.jpg', NULL, 'Awarded WMG Excellence Scholarship at the University of Warwick (2026)', 'active', 90, '2026-09-24 03:52:37'),
  ('tran-nam-khanh', 'Nam-Khanh Tran', 'Nam-Khanh Tran', NULL, NULL, 'student_researcher', 'VNU University of Science (VNU-HUS)', 'vnu-hus', '', NULL, NULL, '', 'Data Science', '', 'active', 100, '2026-09-24 03:52:37'),
  ('mai-thanh-tien', 'Mai Thanh Tien', 'Mai Thanh Tien', NULL, NULL, 'student_researcher', 'Hanoi University of Science and Technology', 'vnu-hus', '', NULL, NULL, '', 'Computer Science', '', 'active', 101, '2026-09-24 03:52:37'),
  ('student-3-phong-hoang', 'Phong Hoang', 'Phong Hoang', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Computer Science', '', 'active', 102, '2026-09-24 03:52:37'),
  ('student-4-gia-nguyen-pham', 'Gia Nguyen Pham', 'Gia Nguyen Pham', NULL, NULL, 'student_researcher', 'VNU University of Science (VNU-HUS)', 'vnu-hus', '', NULL, NULL, '', 'Mathematics & Computer Science', '', 'active', 103, '2026-09-24 03:52:37'),
  ('student-5-thu-ha-ha', 'Thu Ha Ha', 'Thu Ha Ha', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Data Science', '', 'active', 104, '2026-09-24 03:52:37'),
  ('student-6-thanh-dat-ta', 'Thanh Dat Ta', 'Thanh Dat Ta', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Data Science', '', 'active', 105, '2026-09-24 03:52:37'),
  ('student-7-nhat-minh-dang', 'Nhat Minh Dang', 'Nhat Minh Dang', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Data Science', '', 'active', 106, '2026-09-24 03:52:37'),
  ('student-8-nguyet-anh-cao', 'Nguyet Anh Cao', 'Nguyet Anh Cao', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Information Technology', '', 'active', 107, '2026-09-24 03:52:37'),
  ('student-9-quoc-dat-nguyen-tran', 'Quoc Dat Nguyen Tran', 'Quoc Dat Nguyen Tran', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Mathematical Economics', '', 'active', 108, '2026-09-24 03:52:37'),
  ('student-10-phung-thi-thu-trang', 'Phung Thi Thu Trang', 'Phung Thi Thu Trang', NULL, NULL, 'student_researcher', 'National Economics University (NEU)', 'neu', '', NULL, NULL, '', 'Data Science', '', 'active', 109, '2026-09-24 03:52:37'),
  ('student-11-tuan-anh-tran', 'Tuan Anh Tran', 'Tuan Anh Tran', NULL, NULL, 'student_researcher', 'VNU School of Engineering and Technology', 'neu', '', NULL, NULL, '', 'Computer Science', '', 'active', 110, '2026-09-24 03:52:37'),
  ('alumni-le-ba-luat', 'Ba Luat Le', 'Ba Luat Le', 'Former Lead Author & Junior Researcher', NULL, 'alumni', 'Singapore Management University (SMU), Singapore', 'smu', '', NULL, NULL, '/assets/images/people/le_ba_luat.jpg', NULL, 'PhD Candidate in Operations Research', 'active', 200, '2026-09-24 03:52:37'),
  ('alumni-hoa-thi-thu-trang', 'Thu Trang Hoa Thi', 'Thu Trang Hoa Thi', 'Former Student Researcher & Scholar', NULL, 'alumni', 'Singapore Management University (SMU), Singapore', 'smu', '', NULL, NULL, '/assets/images/people/hoa_thi_thu_trang.jpg', NULL, 'Research Engineer in Computing & AI', 'active', 201, '2026-09-24 03:52:37'),
  ('alumni-mai-thanh-loc', 'Thanh Loc Mai', 'Thanh Loc Mai', 'Former Student in Mathematical Economics, NEU', NULL, 'alumni', 'VinUniversity (VinUni), Vietnam', 'vinuni', '', NULL, NULL, '/assets/images/people/mai_thanh_loc.jpg', NULL, 'Master''s Scholar in Computer Science & Analytics', 'active', 202, '2026-09-24 03:52:37'),
  ('alumni-la-quang-chien', 'Quang Chien La', 'Quang Chien La', 'Former Student in Mathematical Economics, NEU', NULL, 'alumni', 'VinUniversity (VinUni), Vietnam', 'vinuni', '', NULL, NULL, '', NULL, 'Master''s Scholar in Operations Research & Analytics', 'active', 203, '2026-09-24 03:52:37'),
  ('alumni-nguyen-tat-dat', 'Nguyen Tat Dat', 'Nguyen Tat Dat', 'Former Research Fellow & Lead Author (EJOR Q1)', NULL, 'alumni', 'Liverpool John Moores University (LJMU), UK', 'ljmu', '', NULL, NULL, '/assets/images/people/nguyen_tat_dat.jpg', NULL, 'PhD Researcher in Operations Research', 'active', 204, '2026-09-24 03:52:37'),
  ('alumni-nguyen-hai-thu', 'Hai Thu Nguyen', 'Hai Thu Nguyen', 'Former Undergraduate Scholar (Valedictorian Intake 63)', NULL, 'alumni', 'University of Connecticut (UConn), USA', 'uconn', '', NULL, NULL, '/assets/images/people/nguyen_hai_thu.jpg', NULL, 'PhD Fellow in Actuarial Science & Risk Analytics', 'active', 205, '2026-09-24 03:52:37'),
  ('alumni-dang-trung-cuong', 'Trung Cuong Dang', 'Trung Cuong Dang', 'Former Graduate Researcher', NULL, 'alumni', 'University of South Florida (USF), USA', 'usf', '', NULL, NULL, '/assets/images/people/dang_trung_cuong.jpg', NULL, 'PhD Researcher in Industrial Engineering & Analytics', 'active', 206, '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: person_research_interests (3 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.person_research_interests ("person_id", "interest", "order_index")
VALUES
  ('trung-le-huu', 'Bounded-optimal search', 0),
  ('trung-le-huu', 'Multi-Agent Systems', 1),
  ('trung-le-huu', 'Vehicle Routing & Optimization', 2)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: person_featured_publications (5 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.person_featured_publications ("person_id", "publication_title", "order_index")
VALUES
  ('trung-le-huu', 'CITA (2025)', 0),
  ('tran-nam-khanh', 'TRC (2026)', 0),
  ('tran-nam-khanh', 'CITA (2025)', 1),
  ('student-4-gia-nguyen-pham', 'COMOSA (2025)', 0),
  ('student-8-nguyet-anh-cao', 'COMOSA (2026)', 0)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: publications (53 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.publications ("id", "title", "year", "venue", "type", "doi", "link", "abstract", "bibtex", "research_pillar", "primary_pillar_id", "is_featured", "badge", "status", "created_at", "keywords", "abstract_source")
VALUES
  ('cao-2026-drone-tourism-comosa', 'Drone Tourism Routing Under Energy, Time-Window and Communication-Coverage Constraints', 2026, 'International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2026), Springer', 'Conference', NULL, 'https://comosa.vn/accepted-papers/', 'We study the drone tourism routing problem subject to battery energy limitations, customer and scenic viewpoint time-windows, and continuous communication-coverage guarantees. The model optimizes flight paths for unmanned aerial vehicles to maximize tourist utility and sight coverage while ensuring strict energy feasibility and reliable telecommunication links with ground control stations.', '@inproceedings{cao_2026_drone_tourism_comosa,
  title = {Drone Tourism Routing Under Energy, Time-Window and Communication-Coverage Constraints},
  author = {Cao Nguyet Anh and Vu Duc Minh and Le Thi Bich Hanh and Pham Thanh Binh},
  booktitle = {The 1st International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2025), Springer},
  year = {2026},
  url = {https://comosa.vn/accepted-papers/}
}', 'green_transportation', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["drone-logistics", "tourism-routing", "orienteering"]'::jsonb, NULL),
  ('dinh-2025-schoolbus-jors', 'The rescheduling school bus routing problem under a constraint on the number of students with negative impact', 2026, 'Journal of the Operational Research Society', 'Journal', '10.1080/01605682.2025.2519991', 'https://doi.org/10.1080/01605682.2025.2519991', 'This study presents a case study of the School Bus Routing Problem (SBRP), focusing on improving the quality of student transportation services. Although numerous studies have addressed the SBRP, this study tackles a new variant driven by a negative impact policy to limit the number of continuing students facing extended travel times. We present this variant and propose a mathematical formulation along with a hybrid metaheuristic approach for it. Furthermore, we conduct comprehensive experiments to evaluate algorithms’ performance and various configurations of the negative impact policy on both artificial and real instances. Computational results confirm the effectiveness of our hybrid algorithm.', '@article{dinh_2025_schoolbus_jors,
  title = {The rescheduling school bus routing problem under a constraint on the number of students with negative impact},
  author = {Quy Ta Dinh and Thu Huong Dang and Minh Hoàng Hà and Duc Minh Vu and Tien Mai},
  journal = {Journal of the Operational Research Society},
  year = {2026},
  doi = {10.1080/01605682.2025.2519991},
  url = {https://doi.org/10.1080/01605682.2025.2519991}
}', 'green_transportation', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["school-transportation", "vehicle-routing", "metaheuristics"]'::jsonb, NULL),
  ('ha-2026-hdc-cor', 'On the Hierarchical Directed Capacitated Arc Routing Problem', 2026, 'Computers & Operations Research', 'Journal', '10.1016/j.cor.2026.107495', 'https://doi.org/10.1016/j.cor.2026.107495', 'The Hierarchical Directed Capacitated Arc Routing Problems (HDCARP) is a variant of the Capacitated Arc Routing Problems (CARPs), in which the arcs in a graph are partitioned into clusters. However, unlike traditional CARPs that aim to minimise total time, the HDCARP focuses on minimizing the maximum completion time of each priority class in a hierarchical fashion. Practical applications of the HDCARP include snow plowing, salt spreading, street cleaning, and waste collection. In this study, we explore two variants of the HDCARP. The key difference between these variants lies in the consideration of precedence relations between clusters within routes. We propose MILP formulations and matheuristics for both HDCARP variants. The MILP formulations enable us to find optimal solutions for small-scale instances and evaluate the quality of matheuristics. Our matheuristics are based on decomposing the problem into multiple sub-problems, resulting in faster running time for large-scale instances. We conduct extensive computational experiments to assess the performance of these approaches and present our findings.', '@article{ha_2026_hdc_cor,
  title = {On the Hierarchical Directed Capacitated Arc Routing Problem},
  author = {Minh Hoàng Hà and Thu Huong Dang and Ba Luat Le and Trung Thanh Nguyen and André Langevin},
  journal = {Computers & Operations Research},
  year = {2026},
  doi = {10.1016/j.cor.2026.107495},
  url = {https://doi.org/10.1016/j.cor.2026.107495}
}', 'operational_optimization', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["arc-routing", "exact-optimization", "metaheuristics"]'::jsonb, NULL),
  ('hong-2026-fstsp-cita', 'A 2-Index Stage-Based Formulation and a Construct-Merge-Solve and Adapt Algorithm for the Flying Sidekick Traveling Salesman Problem', 2025, 'The 14th Conference on Information Technology and its Applications (CITA 2025), LNNS, Springer', 'Conference', '10.1007/978-3-032-00972-2_6', 'https://doi.org/10.1007/978-3-032-00972-2_6', 'In this work, we present the first 2-index stage-based formulation for the Flying Sidekick Traveling Salesman Problem (FSTSP). Additionally, we propose a Construct-Merge-Solve and Adapt (CMSA) algorithm designed to generate high-quality feasible solutions. Experimental results demonstrate that the proposed algorithm consistently produces good solutions in a fraction of the time required by state-of-the-art mixed-integer linear programming solvers, which often struggle to find even the first feasible solution for large and practical instances.', '@inproceedings{hong_2025_fstsp_cita,
  title = {A 2-Index Stage-Based Formulation and a Construct-Merge-Solve and Adapt Algorithm for the Flying Sidekick Traveling Salesman Problem},
  author = {Le Thi Hong and Vu Duc Minh and Tran Nam Khanh and Nguyen Dinh Cong and Le Huu Trung},
  booktitle = {The 14th Conference on Information Technology and its Applications (CITA 2025), LNNS, Springer},
  year = {2025 },
  doi = {10.1007/978-3-032-00972-2_6},
  url = {https://doi.org/10.1007/978-3-032-00972-2_6}
}', 'green_transportation', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["drone-logistics", "vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, NULL),
  ('hong-2026-rvfstsp-trc', 'A stage-based formulation and meta-heuristic algorithm for the revisit Flying SideKick Traveling Salesman Problem', 2026, 'Transportation Research Part C: Emerging Technologies', 'Journal', '10.1016/j.trc.2026.105906', 'https://doi.org/10.1016/j.trc.2026.105906', 'The Flying Sidekick Traveling Salesman Problem (FSTSP) is an emerging delivery routing problem that coordinates a truck and an unmanned aerial vehicle (drone) to serve customer requests. In this paper, we study the Revisit Flying Sidekick Traveling Salesman Problem (RV-FSTSP), a generalization of the FSTSP that provides greater operational flexibility by allowing the truck to revisit previously served customer locations and remain stationary to support multi-trip drone sorties. We develop a stage-based mixed-integer linear programming (MILP) formulation to model the problem''s combinatorial structure, establishing polynomial-sized constraints for both the revisit and stationary support capabilities. To efficiently solve practical and large-scale instances, we propose a tailored metaheuristic algorithm. Extensive computational experiments on benchmark instances demonstrate the effectiveness of our proposed mathematical formulation and show that the RV-FSTSP approach significantly reduces total delivery times compared to the traditional FSTSP.', '@article{hong_2026_rvfstsp_trc,
  title = {A stage-based formulation and meta-heuristic algorithm for the revisit Flying SideKick Traveling Salesman Problem},
  author = {Le Thi Hong and Duc D. Vu and Tran Nam Khanh and Nguyen Dinh Cong and Duc-Minh Vu},
  journal = {Transportation Research Part C: Emerging Technologies},
  year = {2026},
  doi = {10.1016/j.trc.2026.105906},
  url = {https://doi.org/10.1016/j.trc.2026.105906}
}', 'green_transportation', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["drone-logistics", "vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, NULL),
  ('le-2026-cfl-ijoc', 'Competitive Facility Location Under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches', 2026, 'INFORMS Journal on Computing', 'Journal', '10.1287/ijoc.2025.1150', 'https://doi.org/10.1287/ijoc.2025.1150', 'We study the competitive facility location problem, in which a firm aims to establish new facilities in a market already occupied by competitors. In this problem, customer behavior is a crucial factor in making optimal location decisions. We explore a general class of customer choice models, known as the cross-nested logit model, which is recognized for its flexibility and generality in predicting people’s choice behavior. To explore the problem, we first demonstrate that it is NP-hard even when there is only one customer class and the cross-nested structure has only two nests. To tackle the challenging facility location problem, we demonstrate that the objective function under a general cross-nested structure is not concave. Interestingly, we show that, by a change of variables, the objective function can be converted to a mixed-integer exponential cone convex program, enabling it to be solved to optimality via an outer approximation algorithm. Extensive experiments show the efficiency of our approach and provide analyses on the benefits of using the cross-nested model in the facility location context.', '@article{le_2026_cfl_ijoc,
  title = {Competitive Facility Location Under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches},
  author = {Ba Luat Le and Tien Mai and Thuy Anh Ta and Minh Hoàng Hà and Duc-Minh Vu},
  journal = {INFORMS Journal on Computing},
  year = {2026},
  doi = {10.1287/ijoc.2025.1150},
  url = {https://doi.org/10.1287/ijoc.2025.1150}
}', 'operational_optimization', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["facility-location", "customer-choice", "exact-optimization"]'::jsonb, NULL),
  ('nguyen-2026-parallel-scheduling-comosa', 'Improved Bounds for the Energy-Constrained Parallel Machine Scheduling Problem to Minimize Total Completion Time', 2026, 'International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2026), Springer', 'Conference', NULL, 'https://comosa.vn/accepted-papers/', 'This paper investigates the energy-constrained parallel identical machine scheduling problem to minimize total completion time. We propose novel lower and upper bounding techniques that tightly capture energy consumption thresholds and non-linear power costs across operational periods, accelerating exact branch-and-bound and constraint programming solvers.', '@inproceedings{nguyen_2026_parallel_scheduling_comosa,
  title = {Improved Bounds for the Energy-Constrained Parallel Machine Scheduling Problem to Minimize Total Completion Time},
  author = {Viet Nguyen Huu and Tien Thanh Mai and Quy Ta Dinh and Minh Hoang Ha and Binh Huynh Thi Thanh},
  booktitle = {The 1st International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2025), Springer},
  year = {2026},
  url = {https://comosa.vn/accepted-papers/}
}', 'operational_optimization', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["scheduling", "exact-optimization"]'::jsonb, NULL),
  ('pham-2025-drone-tw-comosa', 'A Hybrid Genetic Search for Energy-Aware Multi-Trip Drone Routing with Time-Windows', 2025, 'Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)', 'Conference', NULL, 'https://link.springer.com/book/9783032154194', 'We study an energy-aware multi-trip drone routing problem with customer time windows (MDRP-TW), in which a fleet of unmanned aerial vehicles with limited battery capacities performs multiple delivery sorties from a depot to serve geographically dispersed customers within specified time frames. To realistically capture drone energy consumption, the model accounts for payload-dependent battery depletion and replenishment times between consecutive trips. We formulate the problem and develop a Hybrid Genetic Search (HGS) algorithm that integrates specialized crossover operators with problem-tailored local search routines to efficiently navigate the search space. Extensive computational experiments on newly generated and benchmark instances demonstrate the effectiveness and scalability of the proposed method in producing high-quality delivery schedules under stringent energy and time-window constraints.', '@inproceedings{pham_2026_drone_tw_comosa,
  title = {A Hybrid Genetic Search for Energy-Aware Multi-Trip Drone Routing with Time-Windows},
  author = {Tuan Anh Pham and Minh Hoàng Hà and Duc Minh Vu and Duc Dong Do},
  booktitle = {Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)},
  year = {2026},
  url = {https://link.springer.com/book/9783032154194}
}', 'green_transportation', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["drone-logistics", "vehicle-routing", "metaheuristics"]'::jsonb, NULL),
  ('pham-2026-ssg-ijcai', 'Beyond Homogeneous Adversaries: Stackelberg Security Games with Mixed Quantal Response', 2026, 'Proceedings of the Thirty-Fifth International Joint Conference on Artificial Intelligence (IJCAI 2026)', 'Conference', '10.24963/ijcai.2026/392', 'https://doi.org/10.24963/ijcai.2026/392', 'The quantal response (QR) model is widely used in Stackelberg security games (SSGs) to capture boundedly rational adversaries. Existing work on SSGs under QR, however, almost exclusively assumes a homogeneous attacker population, ignoring heterogeneity in attacker preferences and rationality. We study SSG with mixed quantal response attackers, where the follower population consists of multiple discrete attacker types, each following a type-specific QR model. The defender allocates limited resources across targets, while an attacker drawn from this heterogeneous population observes the defender’s strategy and attacks a single target. This results in a highly non-convex equilibrium computation problem. We develop a polynomial-time approximation scheme (PTAS) for this setting when the number of attacker types is bounded, based on an exponential cone programming formulation combined with a carefully designed Branch-and-Bound procedure. Experiments demonstrate that our approach outperforms standard gradient-based methods and that explicitly modeling attacker heterogeneity yields significant gains over traditional SSG models with a single QR attacker.', '@inproceedings{pham_2026_ssg_ijcai,
  title = {Beyond Homogeneous Adversaries: Stackelberg Security Games with Mixed Quantal Response},
  author = {Hoang Giang Pham and Tien Mai and Thuy Anh Ta and Minh Hoàng Hà},
  booktitle = {Proceedings of the Thirty-Fifth International Joint Conference on Artificial Intelligence (IJCAI 2026)},
  year = {2026},
  doi = {10.24963/ijcai.2026/392},
  url = {https://doi.org/10.24963/ijcai.2026/392}
}', 'ml_optimization', 'ai_supply_chain_intelligence', true, '', 'published', '2026-09-24 03:52:37', '["security-games"]'::jsonb, NULL),
  ('rosati-2026-itor', 'Exact and Metaheuristic Approaches to Minimizing Makespan in Parallel Machine Scheduling with Conflicting Jobs', 2026, 'International Transactions in Operational Research', 'Journal', '10.1111/itor.70177', 'https://doi.org/10.1111/itor.70177', 'We address the scheduling conflicting jobs on parallel identical machines problem with makespan minimization, a classical and computationally challenging variant of parallel machine scheduling. We develop and evaluate three distinct solution methodologies: a novel constraint programming (CP) formulation, and two metaheuristics: a multi-neighborhood simulated annealing that relies on an implicit solution representation and a greedy decoder, and a CP-based large neighborhood search that employs operators specifically tailored for the problem. The methods are tuned using statistically rigorous procedures and compared to highlight the strengths and weaknesses of each approach. For this purpose, we introduce and make publicly available a novel, challenging dataset, appropriately divided into training and validation instances. This dataset supports our experiments and provides a foundation for future benchmarking. Computational results show that the proposed CP formulation significantly outperforms an existing CP method, proving optimality on several instances within short computing times. Meanwhile, the MNSA metaheuristic consistently delivers high-quality solutions, especially on instances where the exact method has difficulty converging, with more consistent gaps in the presence of high conflict rates.', '@article{rosati_2026_itor,
  title = {Exact and Metaheuristic Approaches to Minimizing Makespan in Parallel Machine Scheduling with Conflicting Jobs},
  author = {Roberto Maria Rosati and Dinh Quy Ta and Minh Hoàng Hà and Andrea Schaerf},
  journal = {International Transactions in Operational Research},
  year = {2026},
  doi = {10.1111/itor.70177},
  url = {https://doi.org/10.1111/itor.70177}
}', 'operational_optimization', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["scheduling", "exact-optimization", "metaheuristics"]'::jsonb, NULL),
  ('tran-2026-drone-locker-comosa', 'On the Drone-Locker Location Scheduling Problem', 2026, 'International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2026), Springer', 'Conference', NULL, 'https://comosa.vn/accepted-papers/', 'We introduce and study the Drone-Locker Location Scheduling Problem (DLLSP), which jointly optimizes the placement of automated parcel lockers and the flight scheduling of autonomous delivery drones in urban last-mile logistics. Mixed-integer programming models and tailored metaheuristics are developed to minimize combined facility opening costs and delivery makespan.', '@inproceedings{tran_2026_drone_locker_comosa,
  title = {On the Drone-Locker Location Scheduling Problem},
  author = {Thi Nhung Tran and Thu Trang Hoa and Hai Dang Le and Minh Hoang Ha},
  booktitle = {The 1st International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2025), Springer},
  year = {2026},
  url = {https://comosa.vn/accepted-papers/}
}', 'operational_optimization', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["drone-logistics", "facility-location", "scheduling"]'::jsonb, NULL),
  ('tran-2025-evrptw-comosa', 'Electric Vehicle Routing Problem with Time Windows and Station-Based or Route-Based Charging Options', 2025, 'Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)', 'Conference', NULL, 'https://link.springer.com/book/9783032154194', 'The Electric Vehicle Routing Problem with Time Windows and Station-based or Route-based Charging Options addresses fleet optimization incorporating both conventional charging stations and continuous wireless charging infrastructure. This paper extends Schneider et al.''s foundational EVRP-TW model with arc-based dynamic wireless charging representation, partial coverage modeling, and hierarchical multi-objective optimization prioritizing fleet minimization. Computational experiments on Schneider benchmark instances demonstrate substantial operational benefits, with distance and time improvements ranging from 0.7% to 35.9% in secondary objective components. Analysis reveals that 20% wireless coverage achieves immediate benefits, while 60% coverage delivers optimal performance across all test instances for infrastructure investment decisions.', '@inproceedings{tran_2025_evrptw_comosa,
  title = {Electric Vehicle Routing Problem with Time Windows and Station-Based or Route-Based Charging Options},
  author = {Trung Duc Tran and Duc Minh Vu and Ngoc Doanh Nguyen and Gia Nguyen Pham and Laurent El Ghaoui and Minh Hoàng Hà},
  booktitle = {Optimization, Modeling, Simulation, and Analytics (COMOSA 2025 / Springer)},
  year = {2025},
  url = {https://link.springer.com/book/9783032154194}
}', 'green_transportation', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["electric-vehicles", "vehicle-routing"]'::jsonb, NULL),
  ('vu-2026-demand-response-erss', 'Designing effective demand response: A review of behavioral insights, consumer engagement, and operational strategies in energy systems', 2026, 'Energy Research & Social Science', 'Journal', '10.1016/j.erss.2025.104474', 'https://doi.org/10.1016/j.erss.2025.104474', 'Demand response (DR) programs help electricity systems balance supply and demand by encouraging consumers to adjust their usage in response to price signals or incentives. As population growth, urbanization, and the electrification of transportation and industry continue to increase energy needs, flexible and effective DR programs have become increasingly important. However, consumer participation remains difficult to secure because individuals are influenced by a range of cognitive factors that shape how they perceive and respond to DR incentives. In this paper, we identify five broad categories of cognitive influences that systematically affect consumer decision-making in DR settings. For each category, we provide representative examples from DR programs and review the relevant literature. We then develop a conceptual framework linking consumer engagement, cognitive influences, and socioeconomic factors, and propose unified strategies for integrating behavioral interventions at each stage of the DR engagement process. These strategies aim not only to strengthen consumer participation but also to enhance the overall effectiveness of DR programs. By deepening our understanding of how behavioral factors shape consumer responses, this review offers actionable insights for practitioners, policymakers, and researchers seeking to design DR interventions that improve energy system performance while promoting efficiency and sustainable consumption habits.', '@article{vu_2026_demand_response_erss,
  title = {Designing effective demand response: A review of behavioral insights, consumer engagement, and operational strategies in energy systems},
  author = {Duc D. Vu and Akhtar Hussain and Duc-Minh Vu and Xiao Zhang and Van-Hai Bui},
  journal = {Energy Research & Social Science},
  year = {2026},
  doi = {10.1016/j.erss.2025.104474},
  url = {https://doi.org/10.1016/j.erss.2025.104474}
}', 'green_transportation', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["energy-systems"]'::jsonb, NULL),
  ('zhao-2025-irp-ejor', 'Large Neighborhood and Hybrid Genetic Search for Inventory Routing Problems', 2026, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2025.11.021', 'https://doi.org/10.1016/j.ejor.2025.11.021', 'The inventory routing problem (IRP) focuses on jointly optimizing inventory and distribution operations from a supplier to retailers over multiple days. Compared to other problems from the vehicle routing family, the interrelations between inventory and routing decisions render IRP optimization more challenging and call for advanced solution techniques. A few studies have focused on developing large neighborhood search approaches for this class of problems, but this remains a research area with vast possibilities due to the challenges related to the integration of inventory and routing decisions. In this study, we advance this research area by developing a new large neighborhood search operator tailored for the IRP. Specifically, the operator optimally removes and reinserts all visits to a specific retailer while minimizing routing and inventory costs. We propose an efficient tailored dynamic programming algorithm that exploits preprocessing and acceleration strategies. The operator is used to build an effective local search routine, and included in a state-of-the-art routing algorithm, i.e., Hybrid Genetic Search (HGS). Through extensive computational experiments, we demonstrate that the resulting heuristic algorithm leads to solutions of unmatched quality up to this date, especially on large-scale benchmark instances.', '@article{zhao_2025_irp_ejor,
  title = {Large Neighborhood and Hybrid Genetic Search for Inventory Routing Problems},
  author = {Jingyi Zhao and Claudia Archetti and Tuan Anh Pham and Thibaut Vidal},
  journal = {European Journal of Operational Research},
  year = {2026},
  doi = {10.1016/j.ejor.2025.11.021},
  url = {https://doi.org/10.1016/j.ejor.2025.11.021}
}', 'operational_optimization', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["inventory-routing", "vehicle-routing", "metaheuristics"]'::jsonb, NULL),
  ('dinh-2025-parallel-scheduling-hbco', 'Exact Approaches for Scheduling Problems on Parallel Identical Machines with Conflict Jobs', 2025, 'Handbook of Combinatorial Optimization (Springer Nature)', 'Book Chapter', '10.1007/978-1-4614-6624-6_108-1', 'https://doi.org/10.1007/978-1-4614-6624-6_108-1', 'Machine scheduling problems involving conflict jobs can be seen as a constrained version of the classical scheduling problem, in which jobs may not be proceeded simultaneously on different machines. This conflict constraint naturally arises in several practical applications and has recently received considerable attentions in the research community. In fact, the problem is typically NP-hard (even for approximation), and most of algorithmic results achieved so far have heavily relied on special structures of the underlying graph used to model the conflict-job relation. Our focus is on three objective functions: minimizing the makespan, minimizing the weighted summation of the jobs’ completion time, and maximizing the total weights of completed jobs; the first two of which have been intensively studied in the scheduling literature, but have been not considered for problems with conflict jobs. For each objective function, we present several mixed integer linear programming models and a constraint programming model, from which we can solve the problems to optimality using dedicated solvers. Binary search-based algorithms are also proposed to solve the makespan problem. The results of numerical experiments performed on randomly generated data sets with up to 90 jobs and 6 machines are reported and analyzed to verify the performance of the considered formulations.', '@incollection{dinh_2025_parallel_scheduling_hbco,
  title = {Exact Approaches for Scheduling Problems on Parallel Identical Machines with Conflict Jobs},
  author = {Quy Ta Dinh and Duc Minh Vu and Trung Thanh Nguyen and Anh Duc Le and Minh Hoàng Hà},
  booktitle = {Handbook of Combinatorial Optimization (Springer Nature)},
  year = {2025},
  doi = {10.1007/978-1-4614-6624-6_108-1},
  url = {https://doi.org/10.1007/978-1-4614-6624-6_108-1}
}', 'operational_optimization', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["scheduling", "exact-optimization"]'::jsonb, NULL),
  ('le-2025-fptas-csonet', 'Facility Location Under Nonlinear Customer Demand: A Fully Polynomial-Time Approximation Scheme', 2025, 'Computational Data and Social Networks (CSoNet 2025), LNCS 15417, Springer', 'Conference', '10.1007/978-981-96-6389-7_3', 'https://doi.org/10.1007/978-981-96-6389-7_3', 'This work addresses the facility location problem, a key area of research in Operations Research and Artificial Intelligence. Specifically, we examine a competitive facility location problem where a firm seeks to establish new facilities in a market already served by existing competitors. To predict customer demand, we utilize a general class of customer behavior models, known as the nested-logit model, which is widely recognized as one of the most popular demand models in the literature. The facility location problem under the nested-logit model is characterized by its high nonlinearity and complexity. Existing methods either do not operate within polynomial time or fail to guarantee near-optimal solutions at any desired level of precision. In this study, by leveraging the unique structure of the nested logit choice model, we propose a Fully Polynomial-Time Approximation Scheme (FPTAS) to efficiently solve the problem. To the best of our knowledge, this is the first FPTAS developed for this type of competitive facility location problem.', '@inproceedings{le_2025_fptas_csonet,
  title = {Facility Location Under Nonlinear Customer Demand: A Fully Polynomial-Time Approximation Scheme},
  author = {Ba Luat Le and Thuy Anh Ta and Ngoc Anh Vu Thi and Minh Hoàng Hà},
  booktitle = {Computational Data and Social Networks (CSoNet 2024), LNCS 15417, Springer},
  year = {2025},
  doi = {10.1007/978-981-96-6389-7_3},
  url = {https://doi.org/10.1007/978-981-96-6389-7_3}
}', 'operational_optimization', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["facility-location", "customer-choice", "approximation-algorithms"]'::jsonb, NULL),
  ('nguyen-2025-set-top-ejor', 'The set team orienteering problem', 2025, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2024.09.021', 'https://doi.org/10.1016/j.ejor.2024.09.021', 'We introduce the Set Team Orienteering Problem (STOP), a generalised variant of the Set Orienteering Problem (SOP), in which customers’ locations are split into multiple clusters (or groups). Each cluster is associated with a profit that can be gained only if at least one customer from the cluster is visited. There is a fleet of homogeneous vehicles at a depot, and each vehicle has a limited travel time. The goal of the STOP is to find a set of feasible vehicle routes to collect the maximum profit. We first formulate the problem as a Mixed Integer Linear Programming (MILP) to mathematically describe it. A branch-and-price (B&P) algorithm is then developed to solve the problem to optimality. To deal with large instances, we propose a Large Neighbourhood Search (LNS), which relies on problem-tailored solution representation, removal, and insertion operators. Multiple experiments on newly generated instances confirm the performance of our approaches. The B&P is able to obtain optimal certificates for 77.6% of the STOP instances. Our LNS can achieve optimal solutions for all of these instances except one. More remarkably, we test the algorithms on the SOP via benchmarks available in the literature. It is shown that our B&P can close optimality gaps in 61.2% of these instances. This is the first time such a large number of SOP instances are solved to optimality. Our LNS outperforms existing algorithms proposed to solve the SOP in terms of solution quality. Out of 612 considered instances, it improves 43 best-known solutions.', '@article{nguyen_2025_set_top_ejor,
  title = {The set team orienteering problem},
  author = {Tat Dat Nguyen and Rafael Martinelli and Quang Anh Pham and Minh Hoàng Hà},
  journal = {European Journal of Operational Research},
  year = {2025},
  doi = {10.1016/j.ejor.2024.09.021},
  url = {https://doi.org/10.1016/j.ejor.2024.09.021}
}', 'operational_optimization', 'supply_chain_optimization', true, '', 'published', '2026-09-24 03:52:37', '["orienteering", "vehicle-routing"]'::jsonb, NULL),
  ('pham-2025-lng-csonet', 'Machine Learning-Based Forecasting of LNG Spot Prices: A Case Study on the JKM Index', 2025, 'CSoNet 2025 – AI-TECH Workshop', 'Conference', NULL, 'https://csonet-conf.github.io/csonet25/index.php/program/index.html', 'Accurate forecasting of liquefied natural gas (LNG) prices is critical for energy market participants, procurement planning, and risk management. In this study, we investigate machine learning-based approaches for forecasting Asian LNG spot prices, using the Japan Korea Marker (JKM) index as a primary benchmark. We analyze historical market fundamentals, regional supply-demand dynamics, and cross-commodity price signals to train and evaluate various predictive models, including tree-based ensembles and deep learning architectures. Empirical results demonstrate the superior predictive accuracy of machine learning frameworks compared to traditional econometric baselines, providing valuable insights for energy trading and logistics planning.', '@inproceedings{pham_2025_lng_csonet,
  title = {Machine Learning-Based Forecasting of LNG Spot Prices: A Case Study on the JKM Index},
  author = {Duy-Phuong Pham and Thanh-Hoang Le and Tien-Dzung Vu and Duc-Minh Vu and Ba-Tuan Tran and Van-Tu Nguyen and Van-Nhan Truong and Thanh-Sang Nguyen and Tuyet-Vy Vu},
  booktitle = {CSoNet 2025 – AI-TECH Workshop},
  year = {2025},
  url = {https://csonet-conf.github.io/csonet25/index.php/program/index.html}
}', 'ml_optimization', 'ai_supply_chain_intelligence', false, '', 'published', '2026-09-24 03:52:37', '["forecasting", "machine-learning", "energy-systems"]'::jsonb, NULL),
  ('pham-2025-soict-cutting-plane', 'Constraint Programming-Based Cutting Plane Algorithm for a Combination of Orienteering and Maximum Capture Problem', 2025, 'Information and Communication Technology (SOICT 2024), Springer CCIS', 'Conference', '10.1007/978-981-96-4282-3_29', 'https://doi.org/10.1007/978-981-96-4282-3_29', 'In this paper, we study a new variant of orienteering problem (OP) where each vertex in the OP tour is a facility within a competitive market context, where customer demand is predicted by a random utility choice model. Unlike prior research, which primarily focuses on simple objective function such as maximizing a linear sum of score of selected vertices, we introduce a complicated non-linear objective function that necessitate the selection of locations to maximize a profit value such as expected customer demand or revenue. In our study, routing constraints included in the form of the OP is handled by Constraint Programming (CP), and the non-linear objective function, resulting from the utilization of random utilities, is tackled by two types of valid cuts, namely, outer-approximation and submodular cuts. These lead to the development of an exact solution methods: Cutting Plane, where these valid cuts are iteratively added to a master problem. Extensive experiments are conducted on problem instances of varying sizes, demonstrating that our approach excels in terms of solution quality and computation time when compared to other baseline approach.', '@inproceedings{pham_2025_soict_cutting_plane,
  title = {Constraint Programming-Based Cutting Plane Algorithm for a Combination of Orienteering and Maximum Capture Problem},
  author = {Hoang Giang Pham and Tien Mai and Minh Hoàng Hà},
  booktitle = {Information and Communication Technology (SOICT 2024), Springer CCIS},
  year = {2025},
  doi = {10.1007/978-981-96-4282-3_29},
  url = {https://doi.org/10.1007/978-981-96-4282-3_29}
}', 'operational_optimization', 'supply_chain_optimization', false, '', 'published', '2026-09-24 03:52:37', '["orienteering", "constraint-programming"]'::jsonb, NULL),
  ('thieu-2025-graforvfl-neucom', 'GrafoRVFL: A gradient-free optimization framework for boosting random vector functional link network', 2025, 'Neurocomputing', 'Journal', '10.1016/j.neucom.2025.130898', 'https://doi.org/10.1016/j.neucom.2025.130898', 'Random Vector Functional Link (RVFL) networks are valued for their rapid training and efficient architecture. However, the performance of these networks is significantly hindered by the challenge of hyperparameter tuning. To address this, the authors introduce GrafoRVFL, a framework designed to optimize RVFL networks using gradient-free metaheuristic algorithms (such as Genetic Algorithms, Particle Swarm Optimization, Whale Optimization Algorithm, etc.). By moving away from traditional gradient-based optimization, this framework provides a more robust way to tune hyperparameters and enhance the predictive performance of RVFL models across various applications. The library is implemented in NumPy and integrates seamlessly with the Scikit-Learn interface, allowing it to be easily incorporated into standard machine learning workflows.', '@article{thieu_2025_graforvfl_neucom,
  title = {GrafoRVFL: A gradient-free optimization framework for boosting random vector functional link network},
  author = {Nguyen Van Thieu and Nguyen Thanh Hoang and Hossam Faris},
  journal = {Neurocomputing},
  year = {2025},
  doi = {10.1016/j.neucom.2025.130898},
  url = {https://doi.org/10.1016/j.neucom.2025.130898}
}', 'ml_optimization', 'ai_supply_chain_intelligence', true, '', 'published', '2026-09-24 03:52:37', '["machine-learning", "metaheuristics"]'::jsonb, NULL),
  ('thieu-2025-metaperceptron-csi', 'MetaPerceptron: A standardized framework for metaheuristic-driven multi-layer perceptron optimization', 2025, 'Computer Standards & Interfaces', 'Journal', '10.1016/j.csi.2025.103977', 'https://doi.org/10.1016/j.csi.2025.103977', 'The Multi-Layer Perceptron (MLP) is a foundational neural network architecture widely used for modeling complex, non-linear relationships. However, traditional MLP training—typically reliant on gradient descent—often struggles with challenges such as susceptibility to local optima, saddle points, and overfitting. While metaheuristic algorithms (MHAs) have emerged as robust alternatives for optimizing MLP training, there has historically been a lack of a comprehensive, standardized framework to integrate these approaches. This paper introduces MetaPerceptron, an extensible open-source Python library designed to bridge this gap. The framework provides a standardized environment for hybridizing metaheuristic algorithms with MLP models, facilitating tasks such as weight optimization, hyperparameter tuning, and feature selection. The library is compatible with Scikit-Learn and supports a wide range of metaheuristic techniques to improve the training performance and reliability of MLP models in various regression and classification applications.', '@article{thieu_2025_metaperceptron_csi,
  title = {MetaPerceptron: A standardized framework for metaheuristic-driven multi-layer perceptron optimization},
  author = {Nguyen Van Thieu and Seyedali Mirjalili and Harish Garg and Nguyen Thanh Hoang},
  journal = {Computer Standards & Interfaces},
  year = {2025},
  doi = {10.1016/j.csi.2025.103977},
  url = {https://doi.org/10.1016/j.csi.2025.103977}
}', 'ml_optimization', 'ai_supply_chain_intelligence', true, '', 'published', '2026-09-24 03:52:37', '["machine-learning", "metaheuristics"]'::jsonb, NULL),
  ('journal-10-1007-s10288-022-00527-z', 'An efficient branch-and-cut algorithm for the parallel drone scheduling traveling salesman problem', 2023, '4OR', 'Journal', '10.1007/s10288-022-00527-z', 'https://doi.org/10.1007/s10288-022-00527-z', 'This paper proposes an efficient branch-and-cut algorithm to exactly solve the parallel drone scheduling traveling salesman problem. The problem is first formulated as a mixed integer linear program with truck-flow variables defined on undirected edges, not on directed arcs as in existing models. The formulation is then strengthened by valid inequalities and the branch-and-cut algorithm is developed. The experimental results show that our algorithm can find optimal solutions for all existing instances, but two in a reasonable running time. To make the problem more challenging for future solution methods, we introduce two new sets of 120 larger instances with the number of customers varying from 318 to 783 and test our algorithm and investigate the performance of state-of-the-art metaheuristics on these instances. We show that the proposed algorithm can steadily solve the instances with up to 400 customers to optimality. Optimal solutions of several cases with 600 and 783 customers are also found by our algorithm. This is the first time problems of such a large size are optimally solved.', '@article{journal-10-1007-s10288-022-00527-z,
  title = {An efficient branch-and-cut algorithm for the parallel drone scheduling traveling salesman problem},
  author = {Minh Anh Nguyen and Hai Long Luong and Minh Hoàng Hà and Ha-Bang Ban},
  journal = {4OR},
  year = {2023},
  volume = {21},
  number = {4},
  pages = {609-637},
  doi = {10.1007/s10288-022-00527-z},
  url = {https://doi.org/10.1007/s10288-022-00527-z}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "scheduling", "branch-and-cut"]'::jsonb, 'https://link.springer.com/article/10.1007/s10288-022-00527-z'),
  ('journal-10-1007-s10878-023-01066-x', 'New mixed integer linear programming models and an iterated local search for the clustered traveling salesman problem with relaxed priority rule', 2023, 'Journal of Combinatorial Optimization', 'Journal', '10.1007/s10878-023-01066-x', 'https://doi.org/10.1007/s10878-023-01066-x', 'The Traveling Salesman Problem (TSP) is a well known problem in operations research with various studies and applications. In this paper, we address a variant of the TSP in which the customers are divided into several priority groups and the order of servicing groups can be flexibly changed with a rule called the d-relaxed priority rule. The problem is called the Clustered Traveling Salesman Problem with Relaxed Priority Rule (CTSP-d). We propose two new Mixed Integer Linear Programming (MILP) models for the CTSP-d and a metaheuristic based on Iterated Local Search (ILS) with operators designed for or adapted to the problem. The experimental results obtained on the benchmark instances show that two new models performs better than previous ones, and ILS also proves its performance with 13 new best known solutions found and significant stability compared to existing metaheuristics.', '@article{journal-10-1007-s10878-023-01066-x,
  title = {New mixed integer linear programming models and an iterated local search for the clustered traveling salesman problem with relaxed priority rule},
  author = {Thanh Tan Doan and Nathalie Bostel and Minh Hoàng Hà and Vu Hoang Vuong Nguyen},
  journal = {Journal of Combinatorial Optimization},
  year = {2023},
  volume = {46},
  number = {1},
  article-number = {1},
  doi = {10.1007/s10878-023-01066-x},
  url = {https://doi.org/10.1007/s10878-023-01066-x}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "metaheuristics", "exact-optimization"]'::jsonb, 'https://link.springer.com/article/10.1007/s10878-023-01066-x'),
  ('journal-10-1287-trsc-2022-1192', 'The Parallel Drone Scheduling Traveling Salesman Problem with Collective Drones', 2023, 'Transportation Science', 'Journal', '10.1287/trsc.2022.1192', 'https://doi.org/10.1287/trsc.2022.1192', 'In this paper, we study a new variant of the parallel drone scheduling traveling salesman problem that aims to increase the utilization of drones, particularly for heavy item deliveries. The system under consideration adopts a technology that combines multiple drones to form a collective drone (c-drone) capable of transporting heavier items. The innovative concept is expected to add further flexibility in vehicle assignment decisions. An especially difficult challenge to address is the collaboration among drones because it requires temporal synchronization between their delivery tours. To better model the reality, we also consider that drone power consumption is a nonlinear function of both speed and parcel weight. We first develop a two-index mixed integer linear programming (MILP) formulation from which a simple branch and cut is developed to solve small-size instances to optimality. To efficiently handle larger problem instances, we propose a ruin-and-recreate metaheuristic with problem-tailored removal and insertion operators, in which an efficient move evaluation procedure based on the topological sort is designed to deal with the complexity of the synchronization constraints. Computational experiments demonstrate the validity of the developed MILP model and the performance of the proposed metaheuristic. Sensitivity analyses based on the classification and regression tree are performed to investigate the benefits of using c-drones and the important factors affecting the efficiency of the new transportation system.', '@article{journal-10-1287-trsc-2022-1192,
  title = {The Parallel Drone Scheduling Traveling Salesman Problem with Collective Drones},
  author = {Minh Anh Nguyen and Minh Hoàng Hà},
  journal = {Transportation Science},
  year = {2023},
  volume = {57},
  number = {4},
  pages = {866-888},
  doi = {10.1287/trsc.2022.1192},
  url = {https://doi.org/10.1287/trsc.2022.1192}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "scheduling", "vehicle-routing"]'::jsonb, 'https://api.crossref.org/works/10.1287%2Ftrsc.2022.1192'),
  ('journal-10-1016-j-cor-2021-105566', 'Branch-and-check approaches for the tourist trip design problem with rich constraints', 2022, 'Computers & Operations Research', 'Journal', '10.1016/j.cor.2021.105566', 'https://doi.org/10.1016/j.cor.2021.105566', 'The tourist trip design problem is an extension of the orienteering problem applied to tourism. The problem consists in selecting a subset of locations to visit from among a larger set while maximizing the benefit for the tourist. The benefit is given by the sum of the rewards collected at each location visited. We consider a variant of the problem that deals not only with “typical” constraints such as budget, opening-time hours (i.e., time windows at the locations), and maximum trip duration but also with other practical tourism constraints such as mandatory visits, limits on the number of locations of each type, and the order at which selected locations are visited. To solve this problem, we propose a branch-and-check approach in which the master problem selects a subset of locations, verifying all except time-related constraints, and these locations define candidate solutions to the master problem. For each candidate solution, the slave problem checks whether a feasible trip can be built using the given locations. To accelerate the branch-and-check approach, we propose and test improvements, including preprocessing to tighten the master-slave problem, valid inequalities generated dynamically to strengthen the master problem, and a local branching and variable neighborhood search to find new feasible solutions. Finally, we report the experimental results and compare the performance of the proposed exact algorithm with that of a mathematical solver.', '@article{journal-10-1016-j-cor-2021-105566,
  title = {Branch-and-check approaches for the tourist trip design problem with rich constraints},
  author = {Duc Minh Vu and Yannick Kergosien and Jorge E. Mendoza and Pierre Desport},
  journal = {Computers & Operations Research},
  year = {2022},
  volume = {138},
  pages = {105566},
  article-number = {105566},
  doi = {10.1016/j.cor.2021.105566},
  url = {https://doi.org/10.1016/j.cor.2021.105566}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["tourism-routing", "orienteering", "exact-optimization"]'::jsonb, 'https://optimization-online.org/wp-content/uploads/2020/07/7885.pdf'),
  ('journal-10-1016-j-ejor-2022-01-029', 'Solving the time dependent minimum tour duration and delivery man problems with dynamic discretization discovery', 2022, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2022.01.029', 'https://doi.org/10.1016/j.ejor.2022.01.029', 'In this paper, we present exact methods for solving the Time Dependent Minimum Tour Duration Problem (TD-MTDP) and the Time Dependent Delivery Man Problem (TD-DMP). Both methods are based on a Dynamic Discretization Discovery (DDD) approach for solving the Time Dependent Traveling Salesman Problem with Time Windows (TD-TSPTW). Unlike the TD-TSPTW, these problems involve objective functions that depend in part on the time at which the vehicle departs the depot. As such, optimizing these problems adds a scheduling dimension to the problem. We present multiple enhancements to the DDD method, including enabling it to dynamically determine which waiting opportunities at the depot to model. With an extensive computational study we demonstrate that the resulting methods outperform all known methods for both the TD-MTDP and TD-DMP on instances taken from the literature.', '@article{journal-10-1016-j-ejor-2022-01-029,
  title = {Solving the time dependent minimum tour duration and delivery man problems with dynamic discretization discovery},
  author = {Duc Minh Vu and Mike Hewitt and Duc D. Vu},
  journal = {European Journal of Operational Research},
  year = {2022},
  volume = {302},
  number = {3},
  pages = {831-846},
  doi = {10.1016/j.ejor.2022.01.029},
  url = {https://doi.org/10.1016/j.ejor.2022.01.029}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["time-dependent-routing", "vehicle-routing", "exact-optimization"]'::jsonb, 'https://www.sciencedirect.com/science/article/abs/pii/S0377221722000674'),
  ('journal-10-1038-s41598-022-24181-x', 'Predicting the risk of osteoporosis in older Vietnamese women using machine learning approaches', 2022, 'Scientific Reports', 'Journal', '10.1038/s41598-022-24181-x', 'https://doi.org/10.1038/s41598-022-24181-x', 'Osteoporosis contributes significantly to health and economic burdens worldwide. However, the development of osteoporosis-related prediction tools has been limited for lower-middle-income countries, especially Vietnam. This study aims to develop prediction models for the Vietnamese population as well as evaluate the existing tools to forecast the risk of osteoporosis and evaluate the contribution of covariates that previous studies have determined to be risk factors for osteoporosis. The prediction models were developed to predict the risk of osteoporosis using machine learning algorithms. The performance of the included prediction models was evaluated based on two scenarios; in the first one, the original test parameters were directly modeled, and in the second the original test parameters were transformed into binary covariates. The area under the receiver operating characteristic curve, the Brier score, precision, recall and F1-score were calculated to evaluate the models’ performance in both scenarios. The contribution of the covariates was estimated using the Permutation Feature Importance estimation. Four models, namely, Logistic Regression, Support Vector Machine, Random Forest and Neural Network, were developed through two scenarios. During the validation phase, these four models performed competitively against the reference models, with the areas under the curve above 0.81. Age, height and weight contributed the most to the risk of osteoporosis, while the correlation of the other covariates with the outcome was minor. Machine learning algorithms have a proven advantage in predicting the risk of osteoporosis among Vietnamese women over 50 years old. Additional research is required to more deeply evaluate the performance of the models on other high-risk populations.', '@article{journal-10-1038-s41598-022-24181-x,
  title = {Predicting the risk of osteoporosis in older Vietnamese women using machine learning approaches},
  author = {Hanh My Bui and Minh Hoang Ha and Hoang Giang Pham and Thang Phuoc Dao and Thuy-Trang Thi Nguyen and Minh Loi Nguyen and Ngan Thi Vuong and Xuyen Hong Thi Hoang and Loc Tien Do and Thanh Xuan Dao and Cuong Quang Le},
  journal = {Scientific Reports},
  year = {2022},
  volume = {12},
  number = {1},
  article-number = {20160},
  doi = {10.1038/s41598-022-24181-x},
  url = {https://doi.org/10.1038/s41598-022-24181-x}
}', 'ml_optimization', 'decision_analytics', false, NULL, 'published', '2026-09-24 07:13:30', '["healthcare-analytics", "machine-learning"]'::jsonb, 'https://api.crossref.org/works/10.1038%2Fs41598-022-24181-x'),
  ('journal-10-1111-itor-12797', 'Solving the clustered traveling salesman problem with d-relaxed priority rule', 2022, 'International Transactions in Operational Research', 'Journal', '10.1111/itor.12797', 'https://doi.org/10.1111/itor.12797', 'The Clustered Traveling Salesman Problem with a Prespecified Order on the Clusters, a variant of the well-known traveling salesman problem is studied in literature. In this problem, delivery locations are divided into clusters with different urgency levels and more urgent locations must be visited before less urgent ones. However, this could lead to an inefficient route in terms of traveling cost. This priority-oriented constraint can be relaxed by a rule called d-relaxed priority that provides a trade-off between transportation cost and emergency level. Our research proposes two approaches to solve the problem with d-relaxed priority rule. We improve the mathematical formulation proposed in the literature to construct an exact solution method. A meta-heuristic method based on the framework of Iterated Local Search with problem-tailored operators is also introduced to find approximate solutions. Experimental results show the effectiveness of our methods.', '@article{journal-10-1111-itor-12797,
  title = {Solving the clustered traveling salesman problem with d-relaxed priority rule},
  author = {Minh Hoàng Hà and Hoa Nguyen Phuong and Huyen Tran Ngoc Nhat and André Langevin and Martin Trépanier},
  journal = {International Transactions in Operational Research},
  year = {2022},
  volume = {29},
  number = {2},
  pages = {837-853},
  doi = {10.1111/itor.12797},
  url = {https://doi.org/10.1111/itor.12797}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, 'https://arxiv.org/abs/1810.03981'),
  ('journal-10-1016-j-ejor-2021-07-008', 'The min-cost parallel drone scheduling vehicle routing problem', 2022, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2021.07.008', 'https://doi.org/10.1016/j.ejor.2021.07.008', 'Adopting unmanned aerial vehicles (UAV), also known as drones, into the last-mile-delivery sector and having them work alongside trucks with the aim of improving service quality and reducing the transportation cost gives rise to a new class of Vehicle Routing Problems (VRPs). In this paper, we introduce a new optimization problem called the min-cost Parallel Drone Scheduling Vehicle Routing Problem (PDSVRP). This problem is a variant of the well-known Parallel Drone Scheduling Traveling Salesman Problem (PDSTSP) recently introduced in the literature in which we allow multiple trucks and consider the objective of minimizing the total transportation costs. We formulate the problem as a Mixed Integer Linear Program and then develop a Ruin and Recreate (R&R) algorithm. Exploiting PDSVRP solution characteristics in an effective manner, our heuristic manages to introduce \sufficient" rooms to a solution via new removal operators during the ruin phase. It is expected to enhance the possibilities for improving solutions later in the recreate phase. Multiple experiments on a new set of randomly generated instances confirm the performance of our approach. To explore the benefits of drone delivery as well as the insight into the impact of related factors on the contribution of drones’ use to operational cost, a sensitivity analysis is conducted. We also adapt the proposed algorithm to solve the PDSTSP and validate it via benchmarks available in the literature. It is shown that our algorithm outperforms state-of-the-art algorithms in terms of solution quality. Out of 90 considered instances, it finds 26 new best known solutions.', '@article{journal-10-1016-j-ejor-2021-07-008,
  title = {The min-cost parallel drone scheduling vehicle routing problem},
  author = {Minh Anh Nguyen and Giang Thi-Huong Dang and Minh Hoàng Hà and Minh-Trien Pham},
  journal = {European Journal of Operational Research},
  year = {2022},
  volume = {299},
  number = {3},
  pages = {910-930},
  doi = {10.1016/j.ejor.2021.07.008},
  url = {https://doi.org/10.1016/j.ejor.2021.07.008}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "vehicle-routing", "scheduling"]'::jsonb, 'https://eprints.uet.vnu.edu.vn/eprints/id/eprint/4567/'),
  ('journal-10-1111-itor-13052', 'The two‐echelon routing problem with truck and drones', 2022, 'International Transactions in Operational Research', 'Journal', '10.1111/itor.13052', 'https://doi.org/10.1111/itor.13052', 'In this paper, we study novel variants of the well‐known two‐echelon vehicle routing problem in which a truck works on the first echelon to transport parcels and a fleet of drones to intermediate depots while in the second echelon, the drones are used to deliver parcels from intermediate depots to customers. The objective is to minimize the completion time instead of the transportation cost as in classical two‐echelon vehicle routing problems. Depending on the context, a drone can be launched from the truck at an intermediate depot once (single‐trip drone) or several times (multiple‐trip drone). Mixed‐integer linear programming models are first proposed to formulate mathematically the problems and solve to optimality small‐sized instances. To handle larger instances, a metaheuristic based on the idea of greedy randomized adaptive search procedure is introduced. The main novel feature of our metaheuristic lies in the design of initial solution construction and local search operators, which can cover all the decision layers of the problems and run in using additional data structures. Experimental results obtained on instances of different contexts are reported and analyzed.', '@article{journal-10-1111-itor-13052,
  title = {The two‐echelon routing problem with truck and drones},
  author = {Lam Vu and Duy Manh Vu and Minh Hoàng Hà and Viet‐Phuong Nguyen},
  journal = {International Transactions in Operational Research},
  year = {2022},
  volume = {29},
  number = {5},
  pages = {2968-2994},
  doi = {10.1111/itor.13052},
  url = {https://doi.org/10.1111/itor.13052}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "vehicle-routing"]'::jsonb, 'https://api.crossref.org/works/10.1111%2Fitor.13052'),
  ('journal-10-1287-trsc-2020-1035', 'Arc Routing with Time-Dependent Travel Times and Paths', 2021, 'Transportation Science', 'Journal', '10.1287/trsc.2020.1035', 'https://doi.org/10.1287/trsc.2020.1035', 'Vehicle routing algorithms usually reformulate the road network into a complete graph in which each arc represents the shortest path between two locations. Studies on time-dependent routing followed this model and therefore defined the speed functions on the complete graph. We argue that this model is often inadequate, in particular for arc routing problems involving services on edges of a road network. To fill this gap, we formally define the time-dependent capacitated arc routing problem (TDCARP), with travel and service speed functions given directly at the network level. Under these assumptions, the quickest path between locations can change over time, leading to a complex problem that challenges the capabilities of current solution methods. We introduce effective algorithms for preprocessing quickest paths in a closed form, efficient data structures for travel time queries during routing optimization, and heuristic and exact solution approaches for the TDCARP. Our heuristic uses the hybrid genetic search principle with tailored solution-decoding algorithms and lower bounds for filtering moves. Our branch-and-price algorithm exploits dedicated pricing routines, heuristic dominance rules, and completion bounds to find optimal solutions for problems counting up to 75 services. From these algorithms, we measure the benefits of time-dependent routing optimization for different levels of travel-speed data accuracy.', '@article{journal-10-1287-trsc-2020-1035,
  title = {Arc Routing with Time-Dependent Travel Times and Paths},
  author = {Thibaut Vidal and Rafael Martinelli and Tuan Anh Pham and Minh Hoàng Hà},
  journal = {Transportation Science},
  year = {2021},
  volume = {55},
  number = {3},
  pages = {706-724},
  doi = {10.1287/trsc.2020.1035},
  url = {https://doi.org/10.1287/trsc.2020.1035}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["arc-routing", "time-dependent-routing"]'::jsonb, 'https://api.crossref.org/works/10.1287%2Ftrsc.2020.1035'),
  ('journal-10-15625-1813-9663-37-4-16180', 'THE TRAVELING SALESMAN PROBLEM WITH MULTI-VISIT DRONE', 2021, 'Journal of Computer Science and Cybernetics', 'Journal', '10.15625/1813-9663/37/4/16180', 'https://doi.org/10.15625/1813-9663/37/4/16180', 'This paper deals with the Traveling Salesman Problem with Multi-Visit Drone (TSP-MVD) in which a truck works in collaboration with a drone that can serve up to q > 1 customers consecutively during each sortie. We propose a Mixed Integer Linear Programming (MILP) formulation and a metaheuristic based on Iterated Local Search to solve the problem. Benchmark instances collected from the literature of the special case with q = 1 are used to test the performance of our algorithms. The obtained results show that our MILP model can solve a number of instances to optimality. This is the first time optimal solutions for these instances are reported. Our ILS performs better other algorithms in terms of both solution quality and running time on several class of instances. The numerical results obtained by testing the methods on new randomly generated instances show again the effectiveness of the methods as well as the positive impact of using the multi-visit drone.', '@article{journal-10-15625-1813-9663-37-4-16180,
  title = {THE TRAVELING SALESMAN PROBLEM WITH MULTI-VISIT DRONE},
  author = {Quang Minh Ha and Duy Manh Vu and Xuan Thanh Le and Minh Ha Hoang},
  journal = {Journal of Computer Science and Cybernetics},
  year = {2021},
  volume = {37},
  number = {4},
  pages = {465-493},
  doi = {10.15625/1813-9663/37/4/16180},
  url = {https://doi.org/10.15625/1813-9663/37/4/16180}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "vehicle-routing"]'::jsonb, 'https://api.crossref.org/works/10.15625%2F1813-9663%2F37%2F4%2F16180'),
  ('journal-10-1016-j-ejtl-2021-100039', 'The vehicle routing problem with relaxed priority rules', 2021, 'EURO Journal on Transportation and Logistics', 'Journal', '10.1016/j.ejtl.2021.100039', 'https://doi.org/10.1016/j.ejtl.2021.100039', 'The Vehicle Routing Problem (VRP) is one of the most studied topics in Operations Research. Among the numerous variants of the VRP, this research addresses the VRP with relaxed priority rules (VRP-RPR) in which customers are assigned to several priority groups and customers with the highest priorities typically need to be served before lower priority ones. Additional rules are used to control the trade-off between priority and cost efficiency. We propose a Mixed Integer Linear Programming (MILP) model to formulate the problem and to solve small-sized instances. A metaheuristic based on the Adaptive Large Neighborhood Search (ALNS) algorithm with problem-tailored components is then designed to handle the problem at larger scales. The experimental results demonstrate the performance of our proposed algorithm. Remarkably, it outperforms a metaheuristic recently proposed to solve the Clustered Traveling Saleman Problem with d-relaxed priority rule (CTSP-d), a special case of VRP-RPR, in both solution quality and computational time.', '@article{journal-10-1016-j-ejtl-2021-100039,
  title = {The vehicle routing problem with relaxed priority rules},
  author = {Thanh Tan Doan and Nathalie Bostel and Minh Hoàng Hà},
  journal = {EURO Journal on Transportation and Logistics},
  year = {2021},
  volume = {10},
  pages = {100039},
  article-number = {100039},
  doi = {10.1016/j.ejtl.2021.100039},
  url = {https://doi.org/10.1016/j.ejtl.2021.100039}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing"]'::jsonb, 'https://api.openalex.org/works/doi:10.1016%2Fj.ejtl.2021.100039'),
  ('journal-10-1016-j-trc-2021-103077', 'Toward a more flexible VRP with pickup and delivery allowing consolidations', 2021, 'Transportation Research Part C: Emerging Technologies', 'Journal', '10.1016/j.trc.2021.103077', 'https://doi.org/10.1016/j.trc.2021.103077', 'One important requirement of modern supply chain management is the frequent exchange of containers via multiple cross-docks which requires spatial and time synchronisations between different types of vehicle. Moreover, as collaborations in logistics between several companies become popular, more flexible and extended models must be solved to consider the different needs of the companies. This is of high importance in a new logistics concept, the Physical Internet, which is expected to considerably improve the way logistics are handled in the current supply chain management. To optimise the aforementioned requirements, a rich vehicle routing problem with pickup and delivery including numerous attributes is modelled and solved. A mathematical formulation is proposed and implemented in CPLEX to solve the problem. Given the complexity of the problem, solving large instances with exact methods is very time-consuming. Therefore, a multi-threaded meta-heuristic based on Simulated Annealing is developed. A set of new operators coupled with a restart strategy and memory are developed to help improve the performance. Computational results on a generated data-set showed that the proposed meta-heuristic is superior to the CPLEX solver in terms of solvability and computational time. The proposed meta-heuristic was also compared with the best-known results by current state-of-the-art methods on a classical benchmark on pickup and delivery problems with time windows (with up to 200 customers). The experimental results showed that the proposed method was able to match the best-known results in many of these large scale instances.', '@article{journal-10-1016-j-trc-2021-103077,
  title = {Toward a more flexible VRP with pickup and delivery allowing consolidations},
  author = {Yannis Ancele and Minh Hoàng Hà and Charly Lersteau and Dante Ben Matellini and Trung Thanh Nguyen},
  journal = {Transportation Research Part C: Emerging Technologies},
  year = {2021},
  volume = {128},
  pages = {103077},
  article-number = {103077},
  doi = {10.1016/j.trc.2021.103077},
  url = {https://doi.org/10.1016/j.trc.2021.103077}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "pickup-and-delivery"]'::jsonb, 'https://researchonline.ljmu.ac.uk/id/eprint/14549/'),
  ('journal-10-1287-trsc-2019-0911', 'Dynamic Discretization Discovery for Solving the Time-Dependent Traveling Salesman Problem with Time Windows', 2020, 'Transportation Science', 'Journal', '10.1287/trsc.2019.0911', 'https://doi.org/10.1287/trsc.2019.0911', 'We present a new solution approach for the time-dependent traveling salesman problem with time windows. This problem considers a salesman who departs from his home, has to visit a number of cities within a predetermined period of time, and then, returns home. The problem allows for travel times that can depend on the time of departure. We consider two objectives for the problem: (1) a makespan objective that seeks to return the salesman to his home as early as possible and (2) a duration objective that seeks to minimize the amount of time that he is away from his home. The solution approach is based on an integer programming formulation of the problem on a time-expanded network, because doing so enables time dependencies to be embedded in the definition of the network. However, because such a time-expanded network (and thus, the integer programming formulation) can rapidly become prohibitively large, the solution approach uses a dynamic discretization discovery framework, which has been effective in other contexts. Our computational results indicate that the solution approach outperforms the best-known methods on benchmark instances and is robust with respect to instance parameters.', '@article{journal-10-1287-trsc-2019-0911,
  title = {Dynamic Discretization Discovery for Solving the Time-Dependent Traveling Salesman Problem with Time Windows},
  author = {Duc Minh Vu and Mike Hewitt and Natashia Boland and Martin Savelsbergh},
  journal = {Transportation Science},
  year = {2020},
  volume = {54},
  number = {3},
  pages = {703-720},
  doi = {10.1287/trsc.2019.0911},
  url = {https://doi.org/10.1287/trsc.2019.0911}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["time-dependent-routing", "vehicle-routing", "exact-optimization"]'::jsonb, 'https://api.crossref.org/works/10.1287%2Ftrsc.2019.0911'),
  ('journal-10-1007-s10732-019-09431-y', 'A hybrid genetic algorithm for the traveling salesman problem with drone', 2020, 'Journal of Heuristics', 'Journal', '10.1007/s10732-019-09431-y', 'https://doi.org/10.1007/s10732-019-09431-y', 'This paper addresses the traveling salesman problem with drone (TSP-D), in which a truck and drone are used to deliver parcels to customers. The objective of this problem is to either minimize the total operational cost (min-cost TSP-D) or minimize the completion time for the truck and drone (min-time TSP-D). This problem has gained a lot of attention in the last few years reflecting the recent trends in a new delivery method among logistics companies. To solve the TSP-D, we propose a hybrid genetic search with dynamic population management and adaptive diversity control based on a split algorithm, problem-tailored crossover and local search operators, a new restore method to advance the convergence and an adaptive penalization mechanism to dynamically balance the search between feasible/infeasible solutions. The computational results show that the proposed algorithm outperforms two existing methods in terms of solution quality and improves many best known solutions found in the literature. Moreover, various analyses on the impacts of crossover choice and heuristic components have been conducted to investigate their sensitivity to the performance of our method.', '@article{journal-10-1007-s10732-019-09431-y,
  title = {A hybrid genetic algorithm for the traveling salesman problem with drone},
  author = {Quang Minh Ha and Yves Deville and Quang Dung Pham and Minh Hoàng Hà},
  journal = {Journal of Heuristics},
  year = {2020},
  volume = {26},
  number = {2},
  pages = {219-247},
  doi = {10.1007/s10732-019-09431-y},
  url = {https://doi.org/10.1007/s10732-019-09431-y}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "vehicle-routing", "metaheuristics"]'::jsonb, 'https://link.springer.com/article/10.1007/s10732-019-09431-y'),
  ('journal-10-1016-j-cor-2020-105085', 'A new constraint programming model and a linear programming-based adaptive large neighborhood search for the vehicle routing problem with synchronization constraints', 2020, 'Computers & Operations Research', 'Journal', '10.1016/j.cor.2020.105085', 'https://doi.org/10.1016/j.cor.2020.105085', 'We consider a vehicle routing problem which seeks to minimize cost subject to time window and synchronization constraints. In this problem, the fleet of vehicles is categorized into regular and special vehicles. Some customers require both vehicles’ services, whose service start times at the customer are synchronized. Despite its important real-world application, this problem has rarely been studied in the literature. To solve the problem, we propose a Constraint Programming (CP) model and an Adaptive Large Neighborhood Search (ALNS) in which the design of insertion operators is based on solving linear programming (LP) models to check the insertion feasibility. A number of acceleration techniques is also proposed to significantly reduce the computational time. The computational experiments show that our new CP model finds better solutions than an existing CP-based ALNS, when used on small instances with 25 customers and with a much shorter running time. Our LP-based ALNS dominates the CP-based ALNS, in terms of solution quality, when it provides solutions with better objective values, on average, for all instance classes. This demonstrates the advantage of using linear programming instead of constraint programming when dealing with a variant of vehicle routing problems with relatively tight constraints, which is often considered to be more favorable for CP-based methods. We also adapt our algorithm to solve a well-studied variant of the problem, and the obtained results show that the algorithm provides good solutions as state-of-the-art approaches and improves four best known solutions.', '@article{journal-10-1016-j-cor-2020-105085,
  title = {A new constraint programming model and a linear programming-based adaptive large neighborhood search for the vehicle routing problem with synchronization constraints},
  author = {Minh Hoàng Hà and Tat Dat Nguyen and Thinh Nguyen Duy and Hoang Giang Pham and Thuy Do and Louis-Martin Rousseau},
  journal = {Computers & Operations Research},
  year = {2020},
  volume = {124},
  pages = {105085},
  article-number = {105085},
  doi = {10.1016/j.cor.2020.105085},
  url = {https://doi.org/10.1016/j.cor.2020.105085}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "scheduling", "constraint-programming", "metaheuristics"]'::jsonb, 'https://eprints.uet.vnu.edu.vn/eprints/id/eprint/4061/'),
  ('journal-10-1186-s40649-020-00078-5', 'Solving the k-dominating set problem on very large-scale networks', 2020, 'Computational Social Networks', 'Journal', '10.1186/s40649-020-00078-5', 'https://doi.org/10.1186/s40649-020-00078-5', 'The well-known minimum dominating set problem (MDSP) aims to construct the minimum-size subset of vertices in a graph such that every other vertex has at least one neighbor in the subset. In this article, we study a general version of the problem that extends the neighborhood relationship: two vertices are called neighbors of each other if there exists a path through no more than k edges between them. The problem called “minimum k -dominating set problem” (M k DSP) becomes the classical dominating set problem if k is 1 and has important applications in monitoring large-scale social networks. We propose an efficient heuristic algorithm that can handle real-world instances with up to 17 million vertices and 33 million edges. This is the first time such large graphs are solved for the minimum k -dominating set problem.', '@article{journal-10-1186-s40649-020-00078-5,
  title = {Solving the k-dominating set problem on very large-scale networks},
  author = {Minh Hai Nguyen and Minh Hoàng Hà and Diep N. Nguyen and The Trung Tran},
  journal = {Computational Social Networks},
  year = {2020},
  volume = {7},
  number = {1},
  article-number = {4},
  doi = {10.1186/s40649-020-00078-5},
  url = {https://doi.org/10.1186/s40649-020-00078-5}
}', 'operational_optimization', 'decision_analytics', false, NULL, 'published', '2026-09-24 07:13:30', '["graph-optimization"]'::jsonb, 'https://api.crossref.org/works/10.1186%2Fs40649-020-00078-5'),
  ('journal-10-25073-2588-1086-vnucsce-235', 'Improved Particle Swarm Optimization of Three-Dimensional Path Planning for Fixed Wing Unmanned Aerial Vehicle', 2019, 'VNU Journal of Science: Computer Science and Communication Engineering', 'Journal', '10.25073/2588-1086/vnucsce.235', 'https://doi.org/10.25073/2588-1086/vnucsce.235', 'Path planning for Unmanned Aerial Vehicle (UAV) targets at generating an optimal global path to the target, avoiding collisions and optimizing the given cost function under constraints. In this paper, the path planning problem for UAV in pre-known 3D environment is presented. Particle Swarm Optimization (PSO) was proved the efficiency for various problems. PSO has high convergence speed yet with its major drawback of premature convergence when solving large-scale optimization problems. In this paper, the improved PSO with adaptive mutation to overcome its drawback in order to applied PSO the UAV path planning in real 3D environment which composed of mountains and constraints. The effectiveness of the proposed PSO algorithm is compared to Genetic Algorithm, standard PSO and other improved PSO using 3D map of Daklak, Dakrong and Langco Beach. The results have shown the potential for applying proposed algorithm in optimizing the 3D UAV path planning.', '@article{journal-10-25073-2588-1086-vnucsce-235,
  title = {Improved Particle Swarm Optimization of Three-Dimensional Path Planning for Fixed Wing Unmanned Aerial Vehicle},
  author = {Giang Thi - Huong Dang and Quang - Huy Vuong and Minh Hoang Ha and Minh - Trien Pham},
  journal = {VNU Journal of Science: Computer Science and Communication Engineering},
  year = {2019},
  volume = {35},
  number = {2},
  doi = {10.25073/2588-1086/vnucsce.235},
  url = {https://doi.org/10.25073/2588-1086/vnucsce.235}
}', 'operational_optimization', 'decision_analytics', false, NULL, 'published', '2026-09-24 07:13:30', '["uav-path-planning", "metaheuristics"]'::jsonb, 'https://api.crossref.org/works/10.25073%2F2588-1086%2Fvnucsce.235'),
  ('journal-10-1007-s10898-019-00741-w', 'On three soft rectangle packing problems with guillotine constraints', 2019, 'Journal of Global Optimization', 'Journal', '10.1007/s10898-019-00741-w', 'https://doi.org/10.1007/s10898-019-00741-w', 'We investigate how to partition a rectangular region of length $$L_1$$ and height $$L_2$$ into n rectangles of given areas $$(a_1, \dots , a_n)$$ using two-stage guillotine cuts, so as to minimize either (i) the sum of the perimeters, (ii) the largest perimeter, or (iii) the maximum aspect ratio of the rectangles. These problems play an important role in the ongoing Vietnamese land-allocation reform, as well as in the optimization of matrix multiplication algorithms. We show that the first problem can be solved to optimality in $${{\mathcal {O}}}(n \log n)$$ , while the two others are NP-hard. We propose mixed integer linear programming formulations and a binary search-based approach for solving the NP-hard problems. Experimental analyses are conducted to compare the solution approaches in terms of computational efficiency and solution quality, for different objectives.', '@article{journal-10-1007-s10898-019-00741-w,
  title = {On three soft rectangle packing problems with guillotine constraints},
  author = {Quoc Trung Bui and Thibaut Vidal and Minh Hoàng Hà},
  journal = {Journal of Global Optimization},
  year = {2019},
  volume = {74},
  number = {1},
  pages = {45-62},
  doi = {10.1007/s10898-019-00741-w},
  url = {https://doi.org/10.1007/s10898-019-00741-w}
}', 'operational_optimization', 'decision_analytics', false, NULL, 'published', '2026-09-24 07:13:30', '["packing"]'::jsonb, 'https://link.springer.com/article/10.1007/s10898-019-00741-w'),
  ('journal-10-1007-s13676-017-0103-x', 'Scheduled service network design with resource acquisition and management', 2018, 'EURO Journal on Transportation and Logistics', 'Journal', '10.1007/s13676-017-0103-x', 'https://doi.org/10.1007/s13676-017-0103-x', 'We present a new planning model for freight consolidation carriers, one that links strategic, resource acquisition, and allocation decisions with tactical, service network design-related decisions. Specifically, such as service network design models that recognize resource constraints, the model selects services and routes both commodities and the resources needed to support the services that transport them. In addition, the model recognizes that resources can be grouped into types that differ from one another with respect to capabilities, e.g., speeds, capacities, scheduling rules, etc. Ultimately, along with recognizing resource constraints, the model also makes strategic decisions such as how many resources of each type should be acquired, to what terminal new resources should be assigned, and which existing terminal-based resources should be reassigned. As such, the model can be used from a strategic planning, resource acquisition, mixing, and allocation perspective as it provides an estimate of the impact of such decisions on transportation costs. We extend a matheuristic for a service network design problem with a fixed set (both in number and allocation) of resources of a single type to one that can also make these acquisition and allocation decisions for multiple types of resource. Then, with an extensive computational study, we demonstrate the efficacy of the matheuristic and benchmark its performance against both a leading commercial solver and a column generation-based heuristic. Finally, we perform an extensive computational study to understand how the resource-related and service network design-related components of the model interact, including how freight volumes and cost structures impact how many resources should be acquired.', '@article{journal-10-1007-s13676-017-0103-x,
  title = {Scheduled service network design with resource acquisition and management},
  author = {Teodor Gabriel Crainic and Mike Hewitt and Michel Toulouse and Duc Minh Vu},
  journal = {EURO Journal on Transportation and Logistics},
  year = {2018},
  volume = {7},
  number = {3},
  pages = {277-309},
  doi = {10.1007/s13676-017-0103-x},
  url = {https://doi.org/10.1007/s13676-017-0103-x}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["service-network-design", "supply-chain-networks"]'::jsonb, 'https://api.openalex.org/works/doi:10.1007%2Fs13676-017-0103-x'),
  ('journal-10-1016-j-dib-2018-03-106', 'Description of the datasets for the experiments in the paper “solving the multi-vehicle multi-covering tour problem”', 2018, 'Data in Brief', 'Journal', '10.1016/j.dib.2018.03.106', 'https://doi.org/10.1016/j.dib.2018.03.106', 'This data article contains data related to the research article entitled, “Solving the multi-vehicle multi-covering tour problem” (Pham et al., 2017) [4]. All data of this article was generated from instances kroA100, kroB100, kroC100, kroD100, kroA200, and kroB200 from TSPLIB. It can be downloaded from public repository. This data can be used as benchmarks for the covering tour problem (CTP) variants, such as m-CTP-p, m-CTP, mm-CTP-p, mm-CTP, mm-CTP-o, mm-CTP-wo. We tested our algorithm on these data and results are shown in Pham et al. (2017) [4].', '@article{journal-10-1016-j-dib-2018-03-106,
  title = {Description of the datasets for the experiments in the paper “solving the multi-vehicle multi-covering tour problem”},
  author = {Tuan Anh Pham and Minh Hoàng Hà and Xuan Hoai Nguyen},
  journal = {Data in Brief},
  year = {2018},
  volume = {18},
  pages = {1146-1148},
  doi = {10.1016/j.dib.2018.03.106},
  url = {https://doi.org/10.1016/j.dib.2018.03.106}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "data-resources"]'::jsonb, 'https://api.openalex.org/works/doi:10.1016%2Fj.dib.2018.03.106'),
  ('journal-10-1016-j-trc-2017-11-015', 'On the min-cost Traveling Salesman Problem with Drone', 2018, 'Transportation Research Part C: Emerging Technologies', 'Journal', '10.1016/j.trc.2017.11.015', 'https://doi.org/10.1016/j.trc.2017.11.015', 'Over the past few years, unmanned aerial vehicles (UAV), also known as drones, have been adopted as part of a new logistic method in the commercial sector called "last-mile delivery". In this novel approach, they are deployed alongside trucks to deliver goods to customers to improve the quality of service and reduce the transportation cost. This approach gives rise to a new variant of the traveling salesman problem (TSP), called TSP with drone (TSP-D). A variant of this problem that aims to minimize the time at which truck and drone finish the service (or, in other words, to maximize the quality of service) was studied in the work of Murray and Chu (2015). In contrast, this paper considers a new variant of TSP-D in which the objective is to minimize operational costs including total transportation cost and one created by waste time a vehicle has to wait for the other. The problem is first formulated mathematically. Then, two algorithms are proposed for the solution. The first algorithm (TSP-LS) was adapted from the approach proposed by Murray and Chu (2015), in which an optimal TSP solution is converted to a feasible TSP-D solution by local searches. The second algorithm, a Greedy Randomized Adaptive Search Procedure (GRASP), is based on a new split procedure that optimally splits any TSP tour into a TSP-D solution. After a TSP-D solution has been generated, it is then improved through local search operators. Numerical results obtained on various instances of both objective functions with different sizes and characteristics are presented. The results show that GRASP outperforms TSP-LS in terms of solution quality under an acceptable running time.', '@article{journal-10-1016-j-trc-2017-11-015,
  title = {On the min-cost Traveling Salesman Problem with Drone},
  author = {Quang Minh Ha and Yves Deville and Quang Dung Pham and Minh Hoàng Hà},
  journal = {Transportation Research Part C: Emerging Technologies},
  year = {2018},
  volume = {86},
  pages = {597-621},
  doi = {10.1016/j.trc.2017.11.015},
  url = {https://doi.org/10.1016/j.trc.2017.11.015}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["drone-logistics", "vehicle-routing", "exact-optimization"]'::jsonb, 'https://research.dial.uclouvain.be/entities/publication/59a52e10-b259-480c-b51b-997a337875f9'),
  ('journal-10-1016-j-ejor-2017-08-027', 'The vehicle routing problem with service level constraints', 2018, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2017.08.027', 'https://doi.org/10.1016/j.ejor.2017.08.027', 'We consider a vehicle routing problem which seeks to minimize cost subject to service level constraints on several groups of deliveries. This problem captures some essential challenges faced by a logistics provider which operates transportation services for a limited number of partners and should respect contractual obligations on service levels. The problem also generalizes several important classes of vehicle routing problems with profits. To solve it, we propose a compact mathematical formulation, a branch-and-price algorithm, and a hybrid genetic algorithm with population management, which relies on problem-tailored solution representation, crossover and local search operators, as well as an adaptive penalization mechanism establishing a good balance between service levels and costs. Our computational experiments show that the proposed heuristic returns very high-quality solutions for this difficult problem, matches all optimal solutions found for small and medium-scale benchmark instances, and improves upon existing algorithms for two important special cases: the vehicle routing problem with private fleet and common carrier, and the capacitated profitable tour problem. The branch-and-price algorithm also produces new optimal solutions for all three problems.', '@article{journal-10-1016-j-ejor-2017-08-027,
  title = {The vehicle routing problem with service level constraints},
  author = {Teobaldo Bulhões and Minh Hoàng Hà and Rafael Martinelli and Thibaut Vidal},
  journal = {European Journal of Operational Research},
  year = {2018},
  volume = {265},
  number = {2},
  pages = {544-558},
  doi = {10.1016/j.ejor.2017.08.027},
  url = {https://doi.org/10.1016/j.ejor.2017.08.027}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing"]'::jsonb, 'https://www.semanticscholar.org/paper/d09f0b96a0890913c862cb042fb493b86222ac29'),
  ('journal-10-1080-00207543-2016-1233363', 'Designing service sectors for daily maintenance operations in a road network', 2017, 'International Journal of Production Research', 'Journal', '10.1080/00207543.2016.1233363', 'https://doi.org/10.1080/00207543.2016.1233363', 'The problem of designing service sectors in a road network for the organisation of route maintenance activities is addressed in this paper. The decisions involve determining the locations of a set of depots and assigning road segments to the selected depots to form service sectors. Routing operations must be taken into consideration while partitioning service sectors in order to precisely evaluate deadhead and required number of vehicles. The problem is thus formulated as a location-arc routing problem and solved by a branch-and-cut algorithm. A three-stage heuristic algorithm with sector design component is developed to solve the medium- and large-sized problems. The computational experiments demonstrate the effectiveness of the heuristic algorithm, and the superiority of the heuristic algorithm to the exact method in terms of some specific partition evaluation criteria.', '@article{journal-10-1080-00207543-2016-1233363,
  title = {Designing service sectors for daily maintenance operations in a road network},
  author = {Lu Chen and Boxiao Chen and Quoc Trung Bui and Minh Hoàng Hà},
  journal = {International Journal of Production Research},
  year = {2017},
  volume = {55},
  number = {8},
  pages = {2251-2265},
  doi = {10.1080/00207543.2016.1233363},
  url = {https://doi.org/10.1080/00207543.2016.1233363}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["road-maintenance", "service-network-design"]'::jsonb, 'https://api.openalex.org/works/doi:10.1080%2F00207543.2016.1233363'),
  ('journal-10-1016-j-cor-2017-07-009', 'Solving the multi-vehicle multi-covering tour problem', 2017, 'Computers & Operations Research', 'Journal', '10.1016/j.cor.2017.07.009', 'https://doi.org/10.1016/j.cor.2017.07.009', 'The well-known multi-vehicle covering tour problem (m-CTP) involves finding a minimum-length set of vehicle routes passing through a subset of vertices, subject to constraints on the length of each route and the number of vertices that it contains, such that each vertex not included in any route is covered. Here, a vertex is considered as covered if it lies within a given distance of at least a vertex of a route. This article introduces a generalized variant of the m-CTP that we called the multi-vehicle multi-covering Tour Problem (mm-CTP). In the mm-CTP, a vertex must be covered at least not only once but several times. Three variants of the problem are considered. The binary mm-CTP where a vertex is visited at most once, the mm-CTP without overnight where revisiting a vertex is allowed only after passing through another vertex and the mm-CTP with overnight where revisiting a vertex is permitted without any restrictions. We first propose graph transformations to convert the last two variants into the binary one and focus mostly on solving this variant. A special case of the problem is then formulated as an integer linear program and a branch-and-cut algorithm is developed. We also develop a Genetic Algorithm (GA) that provides high-quality solutions for the problem. Extensive computational results on the new problem mm-CTP as well as its other special cases show the performance of our methods. In particular, our GA outperforms the current best metaheuristics proposed for a wide class of CTP problems.', '@article{journal-10-1016-j-cor-2017-07-009,
  title = {Solving the multi-vehicle multi-covering tour problem},
  author = {Tuan Anh Pham and Minh Hoàng Hà and Xuan Hoai Nguyen},
  journal = {Computers & Operations Research},
  year = {2017},
  volume = {88},
  pages = {258-278},
  doi = {10.1016/j.cor.2017.07.009},
  url = {https://doi.org/10.1016/j.cor.2017.07.009}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, 'https://www.sciencedirect.com/science/article/abs/pii/S0305054817301958'),
  ('journal-10-1287-trsc-2014-0525', 'Service Network Design with Resource Constraints', 2016, 'Transportation Science', 'Journal', '10.1287/trsc.2014.0525', 'https://doi.org/10.1287/trsc.2014.0525', 'We first present a new service network design model for freight consolidation carriers, one that selects services and routes both commodities and resources needed to support the services that transport them, while explicitly recognizing that there are limits on how many resources are available at each terminal. We next present a solution approach that combines column generation, meta-heuristic, and exact optimization techniques to produce high-quality solutions. We demonstrate the efficacy of the approach with an extensive computational study and benchmark its performance against both a leading commercial solver and a column generation-based heuristic.', '@article{journal-10-1287-trsc-2014-0525,
  title = {Service Network Design with Resource Constraints},
  author = {Teodor Gabriel Crainic and Mike Hewitt and Michel Toulouse and Duc Minh Vu},
  journal = {Transportation Science},
  year = {2016},
  volume = {50},
  number = {4},
  pages = {1380-1393},
  doi = {10.1287/trsc.2014.0525},
  url = {https://doi.org/10.1287/trsc.2014.0525}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["service-network-design", "supply-chain-networks"]'::jsonb, 'https://api.crossref.org/works/10.1287%2Ftrsc.2014.0525'),
  ('journal-10-1016-j-tre-2015-11-006', 'A robust optimization approach for the road network daily maintenance routing problem with uncertain service time', 2016, 'Transportation Research Part E: Logistics and Transportation Review', 'Journal', '10.1016/j.tre.2015.11.006', 'https://doi.org/10.1016/j.tre.2015.11.006', 'This paper studies the robust optimization approach for the routing problem encountered in daily maintenance operations of a road network. The uncertainty of service time is considered. The robust optimization approach yields routes that minimize total cost while being less sensitive to substantial deviations of service times. A robust optimization model is developed and solved by the branch-and-cut method. In computational experiments, the behavior of the robust solutions and their performance are analyzed using Monte Carlo simulation. The robust optimization model is also compared with a classic chance-constrained programming model. The experimental analysis provides managerial insights for decision makers to determine an appropriate routing strategy.', '@article{journal-10-1016-j-tre-2015-11-006,
  title = {A robust optimization approach for the road network daily maintenance routing problem with uncertain service time},
  author = {Lu Chen and Michel Gendreau and Minh Hoàng Hà and André Langevin},
  journal = {Transportation Research Part E: Logistics and Transportation Review},
  year = {2016},
  volume = {85},
  pages = {40-51},
  doi = {10.1016/j.tre.2015.11.006},
  url = {https://doi.org/10.1016/j.tre.2015.11.006}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["road-maintenance", "vehicle-routing", "stochastic-robust-optimization"]'::jsonb, 'https://www.sciencedirect.com/science/article/pii/S1366554515002094'),
  ('journal-10-1016-j-cor-2013-08-017', 'An exact algorithm and a metaheuristic for the generalized vehicle routing problem with flexible fleet size', 2014, 'Computers & Operations Research', 'Journal', '10.1016/j.cor.2013.08.017', 'https://doi.org/10.1016/j.cor.2013.08.017', 'The generalized vehicle routing problem (GVRP) involves finding a minimum-length set of vehicle routes passing through a set of clusters, where each cluster contains a number of vertices, such that the tour includes exactly one vertex from each cluster and satisfies capacity constraints. We consider a version of the GVRP where the number of vehicles is a decision variable. This paper introduces a new mathematical formulation based on a two-commodity flow model. We solve the problem using a branch-and-cut algorithm and a metaheuristic that is a hybrid of the greedy randomized adaptive search procedure (GRASP) and the evolutionary local search (ELS) proposed in [18]. We perform computational experiments on instances from the literature to demonstrate the performance of our algorithms.', '@article{journal-10-1016-j-cor-2013-08-017,
  title = {An exact algorithm and a metaheuristic for the generalized vehicle routing problem with flexible fleet size},
  author = {Minh Hoàng Hà and Nathalie Bostel and André Langevin and Louis-Martin Rousseau},
  journal = {Computers & Operations Research},
  year = {2014},
  volume = {43},
  pages = {9-19},
  doi = {10.1016/j.cor.2013.08.017},
  url = {https://doi.org/10.1016/j.cor.2013.08.017}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, 'https://www.sciencedirect.com/science/article/pii/S0305054813002232'),
  ('journal-10-1016-j-tre-2014-02-002', 'Optimizing road network daily maintenance operations with stochastic service and travel times', 2014, 'Transportation Research Part E: Logistics and Transportation Review', 'Journal', '10.1016/j.tre.2014.02.002', 'https://doi.org/10.1016/j.tre.2014.02.002', 'This paper studies optimization methods for a routing problem encountered in daily maintenance operations of a road network. Stochastic service and travel times on road segments are considered. The problem is formulated as a variation of the capacitated arc routing problem (CARP). A chance-constrained programming model is firstly developed and solved by a branch-and-cut algorithm. A stochastic programming model with recourse is also proposed to take into account the recourse costs in case of route failure. The problem is solved by an adaptive large neighborhood search algorithm. The computational experiments demonstrate the effectiveness of the algorithm.', '@article{journal-10-1016-j-tre-2014-02-002,
  title = {Optimizing road network daily maintenance operations with stochastic service and travel times},
  author = {Lu Chen and Minh Hoàng Hà and André Langevin and Michel Gendreau},
  journal = {Transportation Research Part E: Logistics and Transportation Review},
  year = {2014},
  volume = {64},
  pages = {88-102},
  doi = {10.1016/j.tre.2014.02.002},
  url = {https://doi.org/10.1016/j.tre.2014.02.002}
}', 'green_transportation', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["road-maintenance", "vehicle-routing", "stochastic-robust-optimization"]'::jsonb, 'https://www.sciencedirect.com/science/article/pii/S136655451400026X')
ON CONFLICT DO NOTHING;

INSERT INTO public.publications ("id", "title", "year", "venue", "type", "doi", "link", "abstract", "bibtex", "research_pillar", "primary_pillar_id", "is_featured", "badge", "status", "created_at", "keywords", "abstract_source")
VALUES
  ('journal-10-1002-net-21525', 'Solving the close‐enough arc routing problem', 2014, 'Networks', 'Journal', '10.1002/net.21525', 'https://doi.org/10.1002/net.21525', 'The close‐enough arc routing problem has an interesting real‐life application to routing for meter reading. In this article, we propose a new mathematical formulation for this problem. We analyze our formulation and compare it with two formulations in the literature. We also develop branch‐and‐cut algorithms to solve the problem to optimality. We present computational results for instances based on three types of graphs: directed, undirected, and mixed.', '@article{journal-10-1002-net-21525,
  title = {Solving the close‐enough arc routing problem},
  author = {Minh Hoàng Hà and Nathalie Bostel and André Langevin and Louis‐Martin Rousseau},
  journal = {Networks},
  year = {2014},
  volume = {63},
  number = {1},
  pages = {107-118},
  doi = {10.1002/net.21525},
  url = {https://doi.org/10.1002/net.21525}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["arc-routing"]'::jsonb, 'https://api.crossref.org/works/10.1002%2Fnet.21525'),
  ('journal-10-1007-s10732-013-9225-y', 'A three-phase matheuristic for capacitated multi-commodity fixed-cost network design with design-balance constraints', 2013, 'Journal of Heuristics', 'Journal', '10.1007/s10732-013-9225-y', 'https://doi.org/10.1007/s10732-013-9225-y', 'This paper proposes a three-phase matheuristic solution strategy for the capacitated multi-commodity fixed-cost network design problem with design-balance constraints. The proposed matheuristic combines exact and neighbourhood-based methods. Tabu search and restricted path relinking meta-heuristics cooperate to generate as many feasible solutions as possible. The two meta-heuristics incorporate new neighbourhoods, and computationally efficient exploration procedures. The feasible solutions generated by the two procedures are then used to identify an appropriate part of the solution space where an exact solver intensifies the search. Computational experiments on benchmark instances show that the proposed algorithm finds good solutions to large-scale problems in a reasonable amount of time.', '@article{journal-10-1007-s10732-013-9225-y,
  title = {A three-phase matheuristic for capacitated multi-commodity fixed-cost network design with design-balance constraints},
  author = {Duc Minh Vu and Teodor Gabriel Crainic and Michel Toulouse},
  journal = {Journal of Heuristics},
  year = {2013},
  volume = {19},
  number = {5},
  pages = {757-795},
  doi = {10.1007/s10732-013-9225-y},
  url = {https://doi.org/10.1007/s10732-013-9225-y}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["supply-chain-networks", "metaheuristics"]'::jsonb, 'https://link.springer.com/article/10.1007/s10732-013-9225-y'),
  ('journal-10-1016-j-ejor-2012-11-012', 'An exact algorithm and a metaheuristic for the multi-vehicle covering tour problem with a constraint on the number of vertices', 2013, 'European Journal of Operational Research', 'Journal', '10.1016/j.ejor.2012.11.012', 'https://doi.org/10.1016/j.ejor.2012.11.012', 'The multi-vehicle covering tour problem (m-CTP) involves finding a minimum-length set of vehicle routes passing through a subset of vertices, subject to constraints on the length of each route and the number of vertices that it contains, such that each vertex not included in any route lies within a given distance of a route. This paper tackles a particular case of m-CTP where only the restriction on the number of vertices is considered, i.e., the constraint on the length is relaxed. The problem is solved by a branch-and-cut algorithm and a metaheuristic. To develop the branch-and-cut algorithm, we use a new integer programming formulation based on a two-commodity flow model. The metaheuristic is based on the evolutionary local search (ELS) method proposed in [23]. Computational results are reported for a set of test problems derived from the TSPLIB.', '@article{journal-10-1016-j-ejor-2012-11-012,
  title = {An exact algorithm and a metaheuristic for the multi-vehicle covering tour problem with a constraint on the number of vertices},
  author = {Minh Hoàng Hà and Nathalie Bostel and André Langevin and Louis-Martin Rousseau},
  journal = {European Journal of Operational Research},
  year = {2013},
  volume = {226},
  number = {2},
  pages = {211-220},
  doi = {10.1016/j.ejor.2012.11.012},
  url = {https://doi.org/10.1016/j.ejor.2012.11.012}
}', 'operational_optimization', 'supply_chain_optimization', false, NULL, 'published', '2026-09-24 07:13:30', '["vehicle-routing", "exact-optimization", "metaheuristics"]'::jsonb, 'https://hanalog.ca/wp-content/uploads/2016/09/HBLR_mCTP.pdf')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: publication_authors (228 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.publication_authors ("publication_id", "person_id", "author_name", "author_order", "is_highlighted")
VALUES
  ('cao-2026-drone-tourism-comosa', NULL, 'Cao Nguyet Anh', 0, false),
  ('cao-2026-drone-tourism-comosa', NULL, 'Vu Duc Minh', 1, false),
  ('cao-2026-drone-tourism-comosa', NULL, 'Le Thi Bich Hanh', 2, false),
  ('cao-2026-drone-tourism-comosa', NULL, 'Pham Thanh Binh', 3, false),
  ('dinh-2025-schoolbus-jors', NULL, 'Quy Ta Dinh', 0, false),
  ('dinh-2025-schoolbus-jors', NULL, 'Thu Huong Dang', 1, false),
  ('dinh-2025-schoolbus-jors', NULL, 'Minh Hoàng Hà', 2, false),
  ('dinh-2025-schoolbus-jors', NULL, 'Duc Minh Vu', 3, false),
  ('dinh-2025-schoolbus-jors', NULL, 'Tien Mai', 4, false),
  ('ha-2026-hdc-cor', NULL, 'Minh Hoàng Hà', 0, false),
  ('ha-2026-hdc-cor', NULL, 'Thu Huong Dang', 1, false),
  ('ha-2026-hdc-cor', NULL, 'Ba Luat Le', 2, false),
  ('ha-2026-hdc-cor', NULL, 'Trung Thanh Nguyen', 3, false),
  ('ha-2026-hdc-cor', NULL, 'André Langevin', 4, false),
  ('hong-2026-fstsp-cita', NULL, 'Le Thi Hong', 0, false),
  ('hong-2026-fstsp-cita', NULL, 'Vu Duc Minh', 1, false),
  ('hong-2026-fstsp-cita', NULL, 'Tran Nam Khanh', 2, false),
  ('hong-2026-fstsp-cita', NULL, 'Nguyen Dinh Cong', 3, false),
  ('hong-2026-fstsp-cita', NULL, 'Le Huu Trung', 4, false),
  ('hong-2026-rvfstsp-trc', NULL, 'Le Thi Hong', 0, false),
  ('hong-2026-rvfstsp-trc', NULL, 'Duc D. Vu', 1, false),
  ('hong-2026-rvfstsp-trc', NULL, 'Tran Nam Khanh', 2, false),
  ('hong-2026-rvfstsp-trc', NULL, 'Nguyen Dinh Cong', 3, false),
  ('hong-2026-rvfstsp-trc', NULL, 'Duc-Minh Vu', 4, false),
  ('le-2026-cfl-ijoc', NULL, 'Ba Luat Le', 0, false),
  ('le-2026-cfl-ijoc', NULL, 'Tien Mai', 1, false),
  ('le-2026-cfl-ijoc', NULL, 'Thuy Anh Ta', 2, false),
  ('le-2026-cfl-ijoc', NULL, 'Minh Hoàng Hà', 3, false),
  ('le-2026-cfl-ijoc', NULL, 'Duc-Minh Vu', 4, false),
  ('nguyen-2026-parallel-scheduling-comosa', NULL, 'Viet Nguyen Huu', 0, false),
  ('nguyen-2026-parallel-scheduling-comosa', NULL, 'Tien Thanh Mai', 1, false),
  ('nguyen-2026-parallel-scheduling-comosa', NULL, 'Quy Ta Dinh', 2, false),
  ('nguyen-2026-parallel-scheduling-comosa', NULL, 'Minh Hoang Ha', 3, false),
  ('nguyen-2026-parallel-scheduling-comosa', NULL, 'Binh Huynh Thi Thanh', 4, false),
  ('pham-2025-drone-tw-comosa', NULL, 'Tuan Anh Pham', 0, false),
  ('pham-2025-drone-tw-comosa', NULL, 'Minh Hoàng Hà', 1, false),
  ('pham-2025-drone-tw-comosa', NULL, 'Duc Minh Vu', 2, false),
  ('pham-2025-drone-tw-comosa', NULL, 'Duc Dong Do', 3, false),
  ('pham-2026-ssg-ijcai', NULL, 'Hoang Giang Pham', 0, false),
  ('pham-2026-ssg-ijcai', NULL, 'Tien Mai', 1, false),
  ('pham-2026-ssg-ijcai', NULL, 'Thuy Anh Ta', 2, false),
  ('pham-2026-ssg-ijcai', NULL, 'Minh Hoàng Hà', 3, false),
  ('rosati-2026-itor', NULL, 'Roberto Maria Rosati', 0, false),
  ('rosati-2026-itor', NULL, 'Dinh Quy Ta', 1, false),
  ('rosati-2026-itor', NULL, 'Minh Hoàng Hà', 2, false),
  ('rosati-2026-itor', NULL, 'Andrea Schaerf', 3, false),
  ('tran-2026-drone-locker-comosa', NULL, 'Thi Nhung Tran', 0, false),
  ('tran-2026-drone-locker-comosa', NULL, 'Thu Trang Hoa', 1, false),
  ('tran-2026-drone-locker-comosa', NULL, 'Hai Dang Le', 2, false),
  ('tran-2026-drone-locker-comosa', NULL, 'Minh Hoang Ha', 3, false)
ON CONFLICT DO NOTHING;

INSERT INTO public.publication_authors ("publication_id", "person_id", "author_name", "author_order", "is_highlighted")
VALUES
  ('tran-2025-evrptw-comosa', NULL, 'Trung Duc Tran', 0, false),
  ('tran-2025-evrptw-comosa', NULL, 'Duc Minh Vu', 1, false),
  ('tran-2025-evrptw-comosa', NULL, 'Ngoc Doanh Nguyen', 2, false),
  ('tran-2025-evrptw-comosa', NULL, 'Gia Nguyen Pham', 3, false),
  ('tran-2025-evrptw-comosa', NULL, 'Laurent El Ghaoui', 4, false),
  ('tran-2025-evrptw-comosa', NULL, 'Minh Hoàng Hà', 5, false),
  ('vu-2026-demand-response-erss', NULL, 'Duc D. Vu', 0, false),
  ('vu-2026-demand-response-erss', NULL, 'Akhtar Hussain', 1, false),
  ('vu-2026-demand-response-erss', NULL, 'Duc-Minh Vu', 2, false),
  ('vu-2026-demand-response-erss', NULL, 'Xiao Zhang', 3, false),
  ('vu-2026-demand-response-erss', NULL, 'Van-Hai Bui', 4, false),
  ('zhao-2025-irp-ejor', NULL, 'Jingyi Zhao', 0, false),
  ('zhao-2025-irp-ejor', NULL, 'Claudia Archetti', 1, false),
  ('zhao-2025-irp-ejor', NULL, 'Tuan Anh Pham', 2, false),
  ('zhao-2025-irp-ejor', NULL, 'Thibaut Vidal', 3, false),
  ('dinh-2025-parallel-scheduling-hbco', NULL, 'Quy Ta Dinh', 0, false),
  ('dinh-2025-parallel-scheduling-hbco', NULL, 'Duc Minh Vu', 1, false),
  ('dinh-2025-parallel-scheduling-hbco', NULL, 'Trung Thanh Nguyen', 2, false),
  ('dinh-2025-parallel-scheduling-hbco', NULL, 'Anh Duc Le', 3, false),
  ('dinh-2025-parallel-scheduling-hbco', NULL, 'Minh Hoàng Hà', 4, false),
  ('le-2025-fptas-csonet', NULL, 'Ba Luat Le', 0, false),
  ('le-2025-fptas-csonet', NULL, 'Thuy Anh Ta', 1, false),
  ('le-2025-fptas-csonet', NULL, 'Ngoc Anh Vu Thi', 2, false),
  ('le-2025-fptas-csonet', NULL, 'Minh Hoàng Hà', 3, false),
  ('nguyen-2025-set-top-ejor', NULL, 'Tat Dat Nguyen', 0, false),
  ('nguyen-2025-set-top-ejor', NULL, 'Rafael Martinelli', 1, false),
  ('nguyen-2025-set-top-ejor', NULL, 'Quang Anh Pham', 2, false),
  ('nguyen-2025-set-top-ejor', NULL, 'Minh Hoàng Hà', 3, false),
  ('pham-2025-lng-csonet', NULL, 'Duy-Phuong Pham', 0, false),
  ('pham-2025-lng-csonet', NULL, 'Thanh-Hoang Le', 1, false),
  ('pham-2025-lng-csonet', NULL, 'Tien-Dzung Vu', 2, false),
  ('pham-2025-lng-csonet', NULL, 'Duc-Minh Vu', 3, false),
  ('pham-2025-lng-csonet', NULL, 'Ba-Tuan Tran', 4, false),
  ('pham-2025-lng-csonet', NULL, 'Van-Tu Nguyen', 5, false),
  ('pham-2025-lng-csonet', NULL, 'Van-Nhan Truong', 6, false),
  ('pham-2025-lng-csonet', NULL, 'Thanh-Sang Nguyen', 7, false),
  ('pham-2025-lng-csonet', NULL, 'Tuyet-Vy Vu', 8, false),
  ('pham-2025-soict-cutting-plane', NULL, 'Hoang Giang Pham', 0, false),
  ('pham-2025-soict-cutting-plane', NULL, 'Tien Mai', 1, false),
  ('pham-2025-soict-cutting-plane', NULL, 'Minh Hoàng Hà', 2, false),
  ('thieu-2025-graforvfl-neucom', NULL, 'Nguyen Van Thieu', 0, false),
  ('thieu-2025-graforvfl-neucom', NULL, 'Nguyen Thanh Hoang', 1, false),
  ('thieu-2025-graforvfl-neucom', NULL, 'Hossam Faris', 2, false),
  ('thieu-2025-metaperceptron-csi', NULL, 'Nguyen Van Thieu', 0, false),
  ('thieu-2025-metaperceptron-csi', NULL, 'Seyedali Mirjalili', 1, false),
  ('thieu-2025-metaperceptron-csi', NULL, 'Harish Garg', 2, false),
  ('thieu-2025-metaperceptron-csi', NULL, 'Nguyen Thanh Hoang', 3, false),
  ('journal-10-1007-s10288-022-00527-z', NULL, 'Minh Anh Nguyen', 0, false),
  ('journal-10-1007-s10288-022-00527-z', NULL, 'Hai Long Luong', 1, false),
  ('journal-10-1007-s10288-022-00527-z', NULL, 'Minh Hoàng Hà', 2, false)
ON CONFLICT DO NOTHING;

INSERT INTO public.publication_authors ("publication_id", "person_id", "author_name", "author_order", "is_highlighted")
VALUES
  ('journal-10-1007-s10288-022-00527-z', NULL, 'Ha-Bang Ban', 3, false),
  ('journal-10-1007-s10878-023-01066-x', NULL, 'Thanh Tan Doan', 0, false),
  ('journal-10-1007-s10878-023-01066-x', NULL, 'Nathalie Bostel', 1, false),
  ('journal-10-1007-s10878-023-01066-x', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1007-s10878-023-01066-x', NULL, 'Vu Hoang Vuong Nguyen', 3, false),
  ('journal-10-1287-trsc-2022-1192', NULL, 'Minh Anh Nguyen', 0, false),
  ('journal-10-1287-trsc-2022-1192', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1016-j-cor-2021-105566', NULL, 'Duc Minh Vu', 0, false),
  ('journal-10-1016-j-cor-2021-105566', NULL, 'Yannick Kergosien', 1, false),
  ('journal-10-1016-j-cor-2021-105566', NULL, 'Jorge E. Mendoza', 2, false),
  ('journal-10-1016-j-cor-2021-105566', NULL, 'Pierre Desport', 3, false),
  ('journal-10-1016-j-ejor-2022-01-029', NULL, 'Duc Minh Vu', 0, false),
  ('journal-10-1016-j-ejor-2022-01-029', NULL, 'Mike Hewitt', 1, false),
  ('journal-10-1016-j-ejor-2022-01-029', NULL, 'Duc D. Vu', 2, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Hanh My Bui', 0, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Minh Hoang Ha', 1, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Hoang Giang Pham', 2, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Thang Phuoc Dao', 3, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Thuy-Trang Thi Nguyen', 4, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Minh Loi Nguyen', 5, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Ngan Thi Vuong', 6, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Xuyen Hong Thi Hoang', 7, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Loc Tien Do', 8, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Thanh Xuan Dao', 9, false),
  ('journal-10-1038-s41598-022-24181-x', NULL, 'Cuong Quang Le', 10, false),
  ('journal-10-1111-itor-12797', NULL, 'Minh Hoàng Hà', 0, false),
  ('journal-10-1111-itor-12797', NULL, 'Hoa Nguyen Phuong', 1, false),
  ('journal-10-1111-itor-12797', NULL, 'Huyen Tran Ngoc Nhat', 2, false),
  ('journal-10-1111-itor-12797', NULL, 'André Langevin', 3, false),
  ('journal-10-1111-itor-12797', NULL, 'Martin Trépanier', 4, false),
  ('journal-10-1016-j-ejor-2021-07-008', NULL, 'Minh Anh Nguyen', 0, false),
  ('journal-10-1016-j-ejor-2021-07-008', NULL, 'Giang Thi-Huong Dang', 1, false),
  ('journal-10-1016-j-ejor-2021-07-008', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1016-j-ejor-2021-07-008', NULL, 'Minh-Trien Pham', 3, false),
  ('journal-10-1111-itor-13052', NULL, 'Lam Vu', 0, false),
  ('journal-10-1111-itor-13052', NULL, 'Duy Manh Vu', 1, false),
  ('journal-10-1111-itor-13052', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1111-itor-13052', NULL, 'Viet‐Phuong Nguyen', 3, false),
  ('journal-10-1287-trsc-2020-1035', NULL, 'Thibaut Vidal', 0, false),
  ('journal-10-1287-trsc-2020-1035', NULL, 'Rafael Martinelli', 1, false),
  ('journal-10-1287-trsc-2020-1035', NULL, 'Tuan Anh Pham', 2, false),
  ('journal-10-1287-trsc-2020-1035', NULL, 'Minh Hoàng Hà', 3, false),
  ('journal-10-15625-1813-9663-37-4-16180', NULL, 'Quang Minh Ha', 0, false),
  ('journal-10-15625-1813-9663-37-4-16180', NULL, 'Duy Manh Vu', 1, false),
  ('journal-10-15625-1813-9663-37-4-16180', NULL, 'Xuan Thanh Le', 2, false),
  ('journal-10-15625-1813-9663-37-4-16180', NULL, 'Minh Ha Hoang', 3, false),
  ('journal-10-1016-j-ejtl-2021-100039', NULL, 'Thanh Tan Doan', 0, false),
  ('journal-10-1016-j-ejtl-2021-100039', NULL, 'Nathalie Bostel', 1, false),
  ('journal-10-1016-j-ejtl-2021-100039', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1016-j-trc-2021-103077', NULL, 'Yannis Ancele', 0, false)
ON CONFLICT DO NOTHING;

INSERT INTO public.publication_authors ("publication_id", "person_id", "author_name", "author_order", "is_highlighted")
VALUES
  ('journal-10-1016-j-trc-2021-103077', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1016-j-trc-2021-103077', NULL, 'Charly Lersteau', 2, false),
  ('journal-10-1016-j-trc-2021-103077', NULL, 'Dante Ben Matellini', 3, false),
  ('journal-10-1016-j-trc-2021-103077', NULL, 'Trung Thanh Nguyen', 4, false),
  ('journal-10-1287-trsc-2019-0911', NULL, 'Duc Minh Vu', 0, false),
  ('journal-10-1287-trsc-2019-0911', NULL, 'Mike Hewitt', 1, false),
  ('journal-10-1287-trsc-2019-0911', NULL, 'Natashia Boland', 2, false),
  ('journal-10-1287-trsc-2019-0911', NULL, 'Martin Savelsbergh', 3, false),
  ('journal-10-1007-s10732-019-09431-y', NULL, 'Quang Minh Ha', 0, false),
  ('journal-10-1007-s10732-019-09431-y', NULL, 'Yves Deville', 1, false),
  ('journal-10-1007-s10732-019-09431-y', NULL, 'Quang Dung Pham', 2, false),
  ('journal-10-1007-s10732-019-09431-y', NULL, 'Minh Hoàng Hà', 3, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Minh Hoàng Hà', 0, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Tat Dat Nguyen', 1, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Thinh Nguyen Duy', 2, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Hoang Giang Pham', 3, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Thuy Do', 4, false),
  ('journal-10-1016-j-cor-2020-105085', NULL, 'Louis-Martin Rousseau', 5, false),
  ('journal-10-1186-s40649-020-00078-5', NULL, 'Minh Hai Nguyen', 0, false),
  ('journal-10-1186-s40649-020-00078-5', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1186-s40649-020-00078-5', NULL, 'Diep N. Nguyen', 2, false),
  ('journal-10-1186-s40649-020-00078-5', NULL, 'The Trung Tran', 3, false),
  ('journal-10-25073-2588-1086-vnucsce-235', NULL, 'Giang Thi - Huong Dang', 0, false),
  ('journal-10-25073-2588-1086-vnucsce-235', NULL, 'Quang - Huy Vuong', 1, false),
  ('journal-10-25073-2588-1086-vnucsce-235', NULL, 'Minh Hoang Ha', 2, false),
  ('journal-10-25073-2588-1086-vnucsce-235', NULL, 'Minh - Trien Pham', 3, false),
  ('journal-10-1007-s10898-019-00741-w', NULL, 'Quoc Trung Bui', 0, false),
  ('journal-10-1007-s10898-019-00741-w', NULL, 'Thibaut Vidal', 1, false),
  ('journal-10-1007-s10898-019-00741-w', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1007-s13676-017-0103-x', NULL, 'Teodor Gabriel Crainic', 0, false),
  ('journal-10-1007-s13676-017-0103-x', NULL, 'Mike Hewitt', 1, false),
  ('journal-10-1007-s13676-017-0103-x', NULL, 'Michel Toulouse', 2, false),
  ('journal-10-1007-s13676-017-0103-x', NULL, 'Duc Minh Vu', 3, false),
  ('journal-10-1016-j-dib-2018-03-106', NULL, 'Tuan Anh Pham', 0, false),
  ('journal-10-1016-j-dib-2018-03-106', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1016-j-dib-2018-03-106', NULL, 'Xuan Hoai Nguyen', 2, false),
  ('journal-10-1016-j-trc-2017-11-015', NULL, 'Quang Minh Ha', 0, false),
  ('journal-10-1016-j-trc-2017-11-015', NULL, 'Yves Deville', 1, false),
  ('journal-10-1016-j-trc-2017-11-015', NULL, 'Quang Dung Pham', 2, false),
  ('journal-10-1016-j-trc-2017-11-015', NULL, 'Minh Hoàng Hà', 3, false),
  ('journal-10-1016-j-ejor-2017-08-027', NULL, 'Teobaldo Bulhões', 0, false),
  ('journal-10-1016-j-ejor-2017-08-027', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1016-j-ejor-2017-08-027', NULL, 'Rafael Martinelli', 2, false),
  ('journal-10-1016-j-ejor-2017-08-027', NULL, 'Thibaut Vidal', 3, false),
  ('journal-10-1080-00207543-2016-1233363', NULL, 'Lu Chen', 0, false),
  ('journal-10-1080-00207543-2016-1233363', NULL, 'Boxiao Chen', 1, false),
  ('journal-10-1080-00207543-2016-1233363', NULL, 'Quoc Trung Bui', 2, false),
  ('journal-10-1080-00207543-2016-1233363', NULL, 'Minh Hoàng Hà', 3, false),
  ('journal-10-1016-j-cor-2017-07-009', NULL, 'Tuan Anh Pham', 0, false),
  ('journal-10-1016-j-cor-2017-07-009', NULL, 'Minh Hoàng Hà', 1, false)
ON CONFLICT DO NOTHING;

INSERT INTO public.publication_authors ("publication_id", "person_id", "author_name", "author_order", "is_highlighted")
VALUES
  ('journal-10-1016-j-cor-2017-07-009', NULL, 'Xuan Hoai Nguyen', 2, false),
  ('journal-10-1287-trsc-2014-0525', NULL, 'Teodor Gabriel Crainic', 0, false),
  ('journal-10-1287-trsc-2014-0525', NULL, 'Mike Hewitt', 1, false),
  ('journal-10-1287-trsc-2014-0525', NULL, 'Michel Toulouse', 2, false),
  ('journal-10-1287-trsc-2014-0525', NULL, 'Duc Minh Vu', 3, false),
  ('journal-10-1016-j-tre-2015-11-006', NULL, 'Lu Chen', 0, false),
  ('journal-10-1016-j-tre-2015-11-006', NULL, 'Michel Gendreau', 1, false),
  ('journal-10-1016-j-tre-2015-11-006', NULL, 'Minh Hoàng Hà', 2, false),
  ('journal-10-1016-j-tre-2015-11-006', NULL, 'André Langevin', 3, false),
  ('journal-10-1016-j-cor-2013-08-017', NULL, 'Minh Hoàng Hà', 0, false),
  ('journal-10-1016-j-cor-2013-08-017', NULL, 'Nathalie Bostel', 1, false),
  ('journal-10-1016-j-cor-2013-08-017', NULL, 'André Langevin', 2, false),
  ('journal-10-1016-j-cor-2013-08-017', NULL, 'Louis-Martin Rousseau', 3, false),
  ('journal-10-1016-j-tre-2014-02-002', NULL, 'Lu Chen', 0, false),
  ('journal-10-1016-j-tre-2014-02-002', NULL, 'Minh Hoàng Hà', 1, false),
  ('journal-10-1016-j-tre-2014-02-002', NULL, 'André Langevin', 2, false),
  ('journal-10-1016-j-tre-2014-02-002', NULL, 'Michel Gendreau', 3, false),
  ('journal-10-1002-net-21525', NULL, 'Minh Hoàng Hà', 0, false),
  ('journal-10-1002-net-21525', NULL, 'Nathalie Bostel', 1, false),
  ('journal-10-1002-net-21525', NULL, 'André Langevin', 2, false),
  ('journal-10-1002-net-21525', NULL, 'Louis‐Martin Rousseau', 3, false),
  ('journal-10-1007-s10732-013-9225-y', NULL, 'Duc Minh Vu', 0, false),
  ('journal-10-1007-s10732-013-9225-y', NULL, 'Teodor Gabriel Crainic', 1, false),
  ('journal-10-1007-s10732-013-9225-y', NULL, 'Michel Toulouse', 2, false),
  ('journal-10-1016-j-ejor-2012-11-012', NULL, 'Minh Hoàng Hà', 0, false),
  ('journal-10-1016-j-ejor-2012-11-012', NULL, 'Nathalie Bostel', 1, false),
  ('journal-10-1016-j-ejor-2012-11-012', NULL, 'André Langevin', 2, false),
  ('journal-10-1016-j-ejor-2012-11-012', NULL, 'Louis-Martin Rousseau', 3, false)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: projects (7 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.projects ("id", "title_en", "title_vi", "category", "category_en", "sponsor", "grant_code", "period", "status", "research_domain", "collaboration", "description_en", "description_vi", "methodology", "created_at")
VALUES
  ('rv-fstsp-optimization', 'Model and Algorithm Development for the Revisit Flying Sidekick Traveling Salesman Problem', 'Phát triển mô hình và giải thuật cho bài toán Revisit Flying Sidekick Traveling Salesman Problem', 'Đề tài Nghiên cứu Cấp cơ sở', 'Institutional Research Grant', 'National Economics University (NEU)', 'NEU.CS.2025.SLSCM01', '2025 – Present', 'Active', 'Green Transportation & Drone Logistics', '', 'Investigates coordinated truck-and-drone logistics for last-mile delivery, relaxing traditional single-visit restrictions to allow the truck to revisit customer nodes and serve as a stationary launchpad for multi-trip drone sorties.', 'Nghiên cứu mô hình kết hợp phương tiện xe tải và máy bay không người lái (drone) trong logistics giao nhận hàng hóa chặng cuối (last-mile delivery). Đề tài giải phóng các ràng buộc cứng nhắc truyền thống, cho phép xe tải có thể ghé thăm lại (revisit) các địa điểm đã phục vụ và dừng đỗ tĩnh để triển khai nhiều đợt xuất kích liên tiếp của drone.', 'Stage-based Integer Programming formulation combined with a high-performance matheuristic and constructive metaheuristic algorithm.', '2026-09-24 03:52:37'),
  ('vinif-cfl-cross-nested-logit', 'Competitive Facility Location under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches', 'Định vị Cơ sở Cạnh tranh Dưới Mô hình Lựa chọn Khách hàng Cross-Nested Logit', 'Đề tài Nghiên cứu Trọng điểm', 'National Innovation Research Grant', 'Vingroup Innovation Foundation (VINIF)', 'Grant VINIF.2024.DA072', '2024 – 2026', 'Active', 'Operational Optimization & Exact Algorithms', '', 'Addresses competitive facility location under customer choice behavior captured by the general Cross-Nested Logit (CNL) model, establishing NP-hardness proofs and transforming the non-concave objective into a mixed-integer exponential cone convex program solvable via outer approximation.', 'Đề tài giải quyết bài toán lựa chọn vị trí cơ sở kinh doanh cạnh tranh dưới mô hình hành vi khách hàng Cross-Nested Logit (CNL). Nghiên cứu lần đầu chứng minh bài toán thuộc lớp NP-hard ngay cả với cấu trúc đơn giản, đồng thời biến đổi hàm mục tiêu phi lõm thành bài toán quy hoạch nón lồi số nguyên hỗn hợp (mixed-integer exponential cone convex program) để giải chính xác tối ưu.', 'Outer Approximation Algorithm, Mixed-Integer Exponential Cone Programming, Mathematical Reduction Proofs.', '2026-09-24 03:52:37'),
  ('hanoi-smart-water-network', 'AI & OR for Hanoi Urban Smart Water Supply and Drainage Network Management', 'AI & OR trong Quản lý Mạng lưới Cấp thoát nước Đô thị Hà Nội', 'Dự án Thực chiến Liên phòng Thí nghiệm', 'Joint Lab Smart City Initiative', 'National Economics University & Municipal Partners', 'NEU-CADA-SLSCM-2025', '2025 – Present', 'Active', 'Smart Cities & Decision Analytics', 'Joint Lab Initiative: CADA (P1601 A1) & SLSCM (P1613 A1) - Faculty of Data Science & AI (FDA), College of Technology, NEU', 'An interdisciplinary smart city initiative applying AI, Data Science, and Operations Research to the urban water supply and drainage infrastructure of Hanoi. The project processes live IoT telemetry from flow, pressure, and water quality sensors.', 'Dự án liên ngành áp dụng Trí tuệ Nhân tạo (AI), Khoa học Dữ liệu và Vận trù học (OR) vào bài toán quản trị thông minh hệ thống hạ tầng cấp thoát nước của Thủ đô Hà Nội. Dự án xử lý chuỗi dữ liệu thực tế từ hệ thống cảm biến áp lực, lưu lượng và chất lượng nước phân tán trên toàn thành phố.', 'Predictive Machine Learning for inflow forecasting, coupled with mixed-integer nonlinear programming (MINLP) for optimal pump station dispatching.', '2026-09-24 03:52:37'),
  ('parallel-machine-conflict-scheduling', 'Exact and Metaheuristic Optimization for Parallel Machine Scheduling with Conflicting Jobs', 'Tối ưu hóa Điều độ Máy tính Song song với Ràng buộc Công việc Xung đột', 'Hợp tác Nghiên cứu Quốc tế', 'International Collaborative Project', 'University of Udine (Italy), Austrian Research Community & SLSCM Lab', 'INT-SCHED-2025-03', '2024 – 2026', 'Active', 'Combinatorial Optimization & Industrial Scheduling', '', 'Investigates scheduling conflicting jobs on identical parallel machines to minimize makespan, proposing novel constraint programming formulations alongside multi-neighborhood simulated annealing and large neighborhood search metaheuristics.', 'Nghiên cứu tập trung vào bài toán lập lịch các công việc có quan hệ xung đột (không thể thực hiện đồng thời hoặc trên cùng thiết bị) trên các máy song song đồng nhất nhằm tối thiểu hóa thời gian hoàn thành (makespan). Đề tài đề xuất mô hình lập trình ràng buộc (Constraint Programming) và thuật toán luyện kim mô phỏng đa lân cận (Multi-Neighborhood Simulated Annealing).', 'Constraint Programming (CP), Multi-Neighborhood Simulated Annealing (MNSA), CP-based Large Neighborhood Search (CP-LNS).', '2026-09-24 03:52:37'),
  ('hierarchical-arc-routing-urban', 'Hierarchical Directed Capacitated Arc Routing Problem: Formulations and Algorithmic Frameworks', 'Quy hoạch Định tuyến Cung có Phân cấp trong Thu gom Rác thải và Bảo trì Đường bộ Đô thị', 'Hợp tác Nghiên cứu Quốc tế', 'International Collaborative Project', 'Université de Montréal / CIRRELT (Canada) & SLSCM Lab', 'CIRRELT-SLSCM-2025', '2024 – 2026', 'Active', 'Operational Optimization & City Logistics', '', 'Studies the Hierarchical Directed Capacitated Arc Routing Problem (HDCARP) driven by municipal waste collection and road maintenance, proposing valid inequalities and advanced metaheuristics.', 'Giải quyết bài toán định tuyến cung có sức chứa và thứ tự ưu tiên phân cấp phục vụ (HDCARP), lấy cảm hứng từ các chiến dịch thu gom rác thải đô thị và cào tuyết bảo trì đường cao tốc theo thứ tự cấp bậc giao thông.', 'Valid Inequalities, Branch-and-Cut, and Large Neighborhood Search for Directed Graph Arc Routing.', '2026-09-24 03:52:37'),
  ('inventory-routing-optimization', 'Large Neighborhood and Hybrid Genetic Search for Multi-Period Inventory Routing', 'Tối ưu hóa Tồn kho và Định tuyến Phương tiện Đa kỳ (Inventory Routing Problem)', 'Đề tài Nghiên cứu Quốc tế', 'International Collaborative Project', 'SLSCM Lab & International Academic Collaborators', 'IRP-SLSCM-2025', '2024 – 2026', 'Active', 'Operational Optimization & Supply Chain Management', '', 'Develops state-of-the-art Hybrid Genetic Search and Large Neighborhood Search algorithms for multi-period inventory routing problems, unifying replenishment schedules with vehicle dispatching.', 'Nghiên cứu phát triển thuật toán di truyền lai ghép (Hybrid Genetic Search - HGS) và tìm kiếm lân cận lớn (LNS) giải quyết bài toán phối hợp tồn kho - vận tải đa kỳ với sức chứa giới hạn và tiêu hao nhiên liệu tối thiểu.', 'Hybrid Genetic Search (HGS), Adaptive Large Neighborhood Search (ALNS), Matheuristic decomposition.', '2026-09-24 03:52:37'),
  ('training-smart-decisions', 'Executive & Academic Training: From Data to Analytics and Intelligent Decision Making', 'Khóa đào tạo chuyên sâu: Từ dữ liệu đến phân tích và ra quyết định thông minh', 'Chương trình Đào tạo Chuyên sâu', 'Executive Training & Knowledge Transfer', 'College of Technology, NEU', 'TRAIN-FDA-2025', 'Quarterly (2025 – 2026)', 'Ongoing', 'Knowledge Transfer & Professional Education', '', 'Short-term executive training equipping professionals and researchers with mathematical modeling skills, Python optimization (Gurobi, OR-Tools), and Machine Learning integration for optimal operational decisions.', 'Khóa đào tạo ngắn hạn nhằm trang bị tư duy mô hình hóa toán học, kỹ năng lập trình tối ưu hóa với Python, Gurobi, OR-Tools và ứng dụng các thuật toán Machine Learning vào việc đưa ra các quyết định kinh doanh tối ưu.', 'Hands-on project-based learning, practical Python programming with commercial/open-source solvers.', '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: project_leads (24 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.project_leads ("id", "project_id", "person_id", "name", "email", "role", "affiliation", "order_index")
VALUES
  (1, 'rv-fstsp-optimization', NULL, 'TS. Vũ Đức Minh', 'minhvd@neu.edu.vn', 'Principal Investigator (PI)', 'SLSCM Lab, College of Technology - NEU', 0),
  (2, 'rv-fstsp-optimization', NULL, 'Trần Nam Khánh', '', 'Key Researcher', 'HUS-VNU & SLSCM Lab', 1),
  (3, 'rv-fstsp-optimization', NULL, 'Lê Thanh Hồng', '', 'Co-Author', 'SLSCM Lab', 2),
  (4, 'rv-fstsp-optimization', NULL, 'Nguyễn Đức Công', '', 'Researcher', 'SLSCM Lab', 3),
  (5, 'vinif-cfl-cross-nested-logit', NULL, 'Lê Bá Luật', '', 'Lead Researcher', 'SMU PhD Fellow & SLSCM Lab', 0),
  (6, 'vinif-cfl-cross-nested-logit', NULL, 'GS. Mai Tiến', '', 'International Co-Advisor', 'Singapore Management University (SMU)', 1),
  (7, 'vinif-cfl-cross-nested-logit', NULL, 'TS. Tạ Thúy Anh', '', 'Co-Author', 'Phenikaa University', 2),
  (8, 'vinif-cfl-cross-nested-logit', NULL, 'PGS. TS. Hà Minh Hoàng', '', 'Senior Scientific Advisor', 'VNU-HUS & SLSCM Lab', 3),
  (9, 'vinif-cfl-cross-nested-logit', NULL, 'TS. Vũ Đức Minh', '', 'Co-Author / Head of Lab', 'College of Technology, NEU', 4),
  (10, 'hanoi-smart-water-network', NULL, 'TS. Vũ Đức Minh', 'minhvd@neu.edu.vn', 'Co-Principal Investigator (SLSCM Lab)', 'SLSCM Lab, NEU', 0),
  (11, 'hanoi-smart-water-network', NULL, 'ThS. Lê Duy Khánh', 'khanhld@neu.edu.vn', 'Co-Principal Investigator (CADA Lab)', 'CADA Lab, NEU', 1),
  (12, 'parallel-machine-conflict-scheduling', NULL, 'ThS. Tạ Đình Quý', '', 'Lead Researcher / PhD Candidate', 'College of Technology, NEU & HUST', 0),
  (13, 'parallel-machine-conflict-scheduling', NULL, 'PGS. TS. Hà Minh Hoàng', '', 'Senior Scientific Advisor', 'VNU-HUS & SLSCM Lab', 1),
  (14, 'parallel-machine-conflict-scheduling', NULL, 'Roberto Maria Rosati', '', 'International Research Fellow', 'Austrian Research Community', 2),
  (15, 'parallel-machine-conflict-scheduling', NULL, 'GS. Andrea Schaerf', '', 'Faculty Advisor', 'University of Udine, Italy', 3),
  (16, 'hierarchical-arc-routing-urban', NULL, 'PGS. TS. Hà Minh Hoàng', '', 'Vietnam Lead', 'VNU-HUS & SLSCM Lab', 0),
  (17, 'hierarchical-arc-routing-urban', NULL, 'GS. André Langevin', '', 'Canada Lead', 'Polytechnique Montréal / CIRRELT', 1),
  (18, 'hierarchical-arc-routing-urban', NULL, 'Thu Huong Dang', '', 'Co-Author', 'VNU-HUS', 2),
  (19, 'hierarchical-arc-routing-urban', NULL, 'Lê Bá Luật', '', 'Co-Author', 'SMU & SLSCM Lab', 3),
  (20, 'inventory-routing-optimization', NULL, 'ThS. Phạm Tuấn Anh', '', 'Lead Researcher', 'College of Technology, NEU & SLSCM Lab', 0),
  (21, 'inventory-routing-optimization', NULL, 'GS. Claudia Archetti', '', 'International Co-Advisor', 'ESSEC Business School, France', 1),
  (22, 'inventory-routing-optimization', NULL, 'GS. Thibaut Vidal', '', 'Co-Advisor', 'Polytechnique Montréal / CIRRELT', 2),
  (23, 'training-smart-decisions', NULL, 'TS. Vũ Đức Minh', '', 'Director of Training / Lead Instructor', 'Head of SLSCM Lab, NEU', 0),
  (24, 'training-smart-decisions', NULL, 'TS. Đinh Nho Minh', '', 'Operations Research Instructor', 'Faculty of FDA, College of Technology - NEU', 1)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: project_publications (7 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.project_publications ("project_id", "publication_id", "display_order")
VALUES
  ('rv-fstsp-optimization', 'hong-2026-rvfstsp-trc', 0),
  ('vinif-cfl-cross-nested-logit', 'le-2026-cfl-ijoc', 0),
  ('hanoi-smart-water-network', 'vu-2026-demand-response-erss', 0),
  ('parallel-machine-conflict-scheduling', 'rosati-2026-itor', 0),
  ('hierarchical-arc-routing-urban', 'ha-2026-hdc-cor', 0),
  ('inventory-routing-optimization', 'zhao-2025-irp-ejor', 0),
  ('training-smart-decisions', 'thieu-2025-metaperceptron-csi', 0)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: project_outcomes (20 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.project_outcomes ("id", "project_id", "outcome_en", "outcome_vi", "order_index")
VALUES
  (1, 'rv-fstsp-optimization', 'Published in premier Q1 journal Transportation Research Part C: Emerging Technologies (2026, Vol. 192)', 'Công bố bài báo quốc tế Q1 trên tạp chí đỉnh cao Transportation Research Part C: Emerging Technologies (2026, Vol. 192)', 0),
  (2, 'rv-fstsp-optimization', 'Presented and published in Springer LNNS at International Conference CITA 2025', 'Công bố bài báo tại Hội nghị Quốc tế CITA 2025 (Lecture Notes in Networks and Systems, Springer)', 1),
  (3, 'rv-fstsp-optimization', 'Achieved up to 28.4% reduction in delivery mission completion time compared to classic FSTSP benchmarks', 'Tiết kiệm đến 28.4% tổng thời gian hoàn thành hành trình so với mô hình FSTSP truyền thống', 2),
  (4, 'vinif-cfl-cross-nested-logit', 'Accepted in flagship premier journal INFORMS Journal on Computing (IJOC, 2026)', 'Công bố bài báo quốc tế đỉnh cao trên INFORMS Journal on Computing (IJOC, 2026)', 0),
  (5, 'vinif-cfl-cross-nested-logit', 'Directly handled and accepted by Area Editor Andrea Lodi', 'Được Area Editor Andrea Lodi trực tiếp chấp nhận', 1),
  (6, 'vinif-cfl-cross-nested-logit', 'Open-source code and full benchmark suite integrated into the official IJOC GitHub Software Repository', 'Mã nguồn mở và toàn bộ dữ liệu thực nghiệm được tích hợp chính thức vào IJOC Software Repository', 2),
  (7, 'hanoi-smart-water-network', 'Real-time hydraulic telemetry and forecasting system for urban water distribution', 'Hệ thống mô hình hóa dự báo lưu lượng và áp lực mạng lưới thời gian thực', 0),
  (8, 'hanoi-smart-water-network', 'Intelligent pump and valve optimization algorithms reducing energy consumption by 14%', 'Thuật toán tối ưu hóa điều tiết bơm và đóng mở van thông minh giảm 14% điện năng tiêu thụ', 1),
  (9, 'hanoi-smart-water-network', 'Standardized IoT time-series telemetry data pipeline for smart municipal operations', 'Đường ống dữ liệu IoT time-series chuẩn hóa cho đô thị thông minh', 2),
  (10, 'hanoi-smart-water-network', 'Experimental solution deployed to municipal drainage and water supply management units', 'Chuyển giao giải pháp thử nghiệm cho các đơn vị vận hành cấp nước đô thị', 3),
  (11, 'parallel-machine-conflict-scheduling', 'Published in premier journal International Transactions in Operational Research (ITOR, 2026)', 'Công bố bài báo quốc tế trên International Transactions in Operational Research (ITOR, 2026)', 0),
  (12, 'parallel-machine-conflict-scheduling', 'Optimally solved large-scale benchmark instances from semiconductor chip manufacturing', 'Giải quyết tối ưu các bộ dữ liệu chuẩn quy mô lớn từ công nghiệp sản xuất linh kiện bán dẫn', 1),
  (13, 'parallel-machine-conflict-scheduling', 'Successfully modeled complex conflict graph constraints under non-trivial makespan objectives', 'Mô hình hóa thành công các ràng buộc đồ thị xung đột (conflict graphs) phức tạp', 2),
  (14, 'hierarchical-arc-routing-urban', 'Published in top operations research journal Computers & Operations Research (COR, Vol. 192, 2026)', 'Công bố bài báo quốc tế trên Computers & Operations Research (COR, Vol. 192, 2026)', 0),
  (15, 'hierarchical-arc-routing-urban', 'Established standard experimental benchmarks for hierarchical urban road network routing', 'Thiết lập benchmark thực nghiệm chuẩn mực cho lớp bài toán phân cấp mạng lưới đường bộ', 1),
  (16, 'inventory-routing-optimization', 'Published in premier journal European Journal of Operational Research (EJOR, Q1, 2025)', 'Công bố bài báo đỉnh cao trên European Journal of Operational Research (EJOR, Q1, 2025)', 0),
  (17, 'inventory-routing-optimization', 'Established new state-of-the-art solution records across international benchmark suites', 'Thiết lập kỷ lục lời giải mới trên các bộ dữ liệu benchmark quốc tế', 1),
  (18, 'training-smart-decisions', 'Trained over 120 professionals and researchers from supply chain and banking enterprises', 'Đã đào tạo thành công hơn 120 học viên từ các doanh nghiệp logistics và ngân hàng', 0),
  (19, 'training-smart-decisions', 'Standardized curriculum on Operations Research and Decision Intelligence with Python & Gurobi', 'Bộ giáo trình bài giảng chuẩn hóa về Vận trù học và Trí tuệ Ra quyết định', 1),
  (20, 'training-smart-decisions', 'Executive certificate of completion issued by College of Technology, NEU', 'Cấp chứng nhận hoàn thành chương trình bởi Trường Công nghệ - NEU', 2)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: project_tags (32 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.project_tags ("project_id", "tag")
VALUES
  ('rv-fstsp-optimization', 'Drone Routing'),
  ('rv-fstsp-optimization', 'FSTSP'),
  ('rv-fstsp-optimization', 'Matheuristics'),
  ('rv-fstsp-optimization', 'Transportation Research Part C'),
  ('rv-fstsp-optimization', 'Last-Mile Delivery'),
  ('vinif-cfl-cross-nested-logit', 'Facility Location'),
  ('vinif-cfl-cross-nested-logit', 'INFORMS JoC'),
  ('vinif-cfl-cross-nested-logit', 'Exponential Cone'),
  ('vinif-cfl-cross-nested-logit', 'Outer Approximation'),
  ('vinif-cfl-cross-nested-logit', 'VINIF'),
  ('hanoi-smart-water-network', 'Smart Water'),
  ('hanoi-smart-water-network', 'Urban IoT'),
  ('hanoi-smart-water-network', 'Pump Scheduling'),
  ('hanoi-smart-water-network', 'Time Series ML'),
  ('hanoi-smart-water-network', 'Joint Lab'),
  ('parallel-machine-conflict-scheduling', 'Machine Scheduling'),
  ('parallel-machine-conflict-scheduling', 'Conflict Jobs'),
  ('parallel-machine-conflict-scheduling', 'Constraint Programming'),
  ('parallel-machine-conflict-scheduling', 'Simulated Annealing'),
  ('parallel-machine-conflict-scheduling', 'ITOR'),
  ('hierarchical-arc-routing-urban', 'Arc Routing'),
  ('hierarchical-arc-routing-urban', 'HDCARP'),
  ('hierarchical-arc-routing-urban', 'Waste Management'),
  ('hierarchical-arc-routing-urban', 'Computers & Operations Research'),
  ('inventory-routing-optimization', 'Inventory Routing'),
  ('inventory-routing-optimization', 'HGS'),
  ('inventory-routing-optimization', 'Supply Chain'),
  ('inventory-routing-optimization', 'EJOR Q1'),
  ('training-smart-decisions', 'Executive Training'),
  ('training-smart-decisions', 'Python Solvers'),
  ('training-smart-decisions', 'Gurobi'),
  ('training-smart-decisions', 'Decision Intelligence')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: seminars (6 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.seminars ("id", "title", "title_vi", "speaker", "speaker_person_id", "speaker_role", "affiliation", "affiliation_id", "date", "time", "venue", "venue_type", "status", "category", "track", "abstract", "abstract_en", "related_paper_id", "related_project_id", "slides_available", "recording_available", "slides_url", "recording_url", "created_at")
VALUES
  ('seminar-cfl-conic-smu', 'Outer Approximation and Conic Reformulations for Non-Concave Competitive Facility Location', 'Outer Approximation and Conic Reformulations for Non-Concave Competitive Facility Location', 'Ba Luat Le', NULL, 'PhD Candidate in Operations Research (SMU Singapore) & Former SLSCM Lead Researcher', 'Singapore Management University (SMU) & SLSCM Lab', 'smu', '2026-03-15', '14:30 – 16:30 (GMT+7)', 'Room P1613, Building A1, National Economics University & Hybrid Microsoft Teams', 'Hybrid', 'Archived', 'Doctoral Research Colloquium', 'Operational Optimization & Exact Algorithms', 'The competitive facility location problem under the general Cross-Nested Logit (CNL) choice model poses severe computational challenges due to non-concavity and NP-hardness. In this colloquium, the speaker presents mathematical proofs transforming the problem into a mixed-integer exponential cone convex program solved to global optimality via outer approximation, recently accepted by INFORMS Journal on Computing (IJOC, 2026).', 'The competitive facility location problem under the general Cross-Nested Logit (CNL) choice model poses severe computational challenges due to non-concavity and NP-hardness. In this colloquium, the speaker presents mathematical proofs transforming the problem into a mixed-integer exponential cone convex program solved to global optimality via outer approximation, recently accepted by INFORMS Journal on Computing (IJOC, 2026).', 'le-2026-cfl-ijoc', 'vinif-cfl-cross-nested-logit', true, true, NULL, NULL, '2026-09-24 03:52:37'),
  ('seminar-rvfstsp-drone-logistics', 'Revisit Policies in Coordinated Truck-and-Drone Delivery: Mathematical Formulations and Large-Scale Metaheuristics', 'Revisit Policies in Coordinated Truck-and-Drone Delivery: Mathematical Formulations and Large-Scale Metaheuristics', 'Nam-Khanh Tran & Dr. Duc Minh Vu', NULL, 'Key Researcher (HUS-VNU) & Head of Lab (NEU)', 'VNU University of Science (HUS-VNU) & College of Technology, NEU', 'neu', '2026-02-28', '09:00 – 11:30 (GMT+7)', 'Room P1613, Building A1, National Economics University – 207 Giai Phong Road, Hanoi', 'In-Person', 'Archived', 'Faculty & Student Research Seminar', 'Transportation Logistics & Green Fleets', 'Traditional Flying Sidekick TSP restricts truck stops to single visits. This seminar presents breakthrough results from our recent Transportation Research Part C paper (2026): relaxing constraints to permit truck revisits as stationary multi-trip drone launchpads, achieving up to 28.4% makespan savings in last-mile operations.', 'Traditional Flying Sidekick TSP restricts truck stops to single visits. This seminar presents breakthrough results from our recent Transportation Research Part C paper (2026): relaxing constraints to permit truck revisits as stationary multi-trip drone launchpads, achieving up to 28.4% makespan savings in last-mile operations.', 'hong-2026-rvfstsp-trc', 'rv-fstsp-optimization', true, false, NULL, NULL, '2026-09-24 03:52:37'),
  ('seminar-cp-scheduling-udine', 'Constraint Programming vs. Simulated Annealing for Machine Scheduling with Conflicting Jobs', 'Constraint Programming vs. Simulated Annealing for Machine Scheduling with Conflicting Jobs', 'MSc. Ta Dinh Quy & Prof. Andrea Schaerf', NULL, 'PhD Candidate (NEU & HUST) & Full Professor (University of Udine)', 'College of Technology - NEU, HUST & University of Udine (Italy)', 'neu', '2026-01-20', '15:00 – 17:00 (GMT+7) / 09:00 – 11:00 (CET)', 'Virtual Joint Research Seminar (Hanoi – Udine Zoom)', 'Online', 'Archived', 'International Academic Exchange', 'Industrial Scheduling & Metaheuristics', 'International academic exchange between SLSCM Lab and the University of Udine (Italy), exploring exact CP formulations, multi-neighborhood simulated annealing, and constraint-based LNS for parallel machine scheduling under conflict graph constraints.', 'International academic exchange between SLSCM Lab and the University of Udine (Italy), exploring exact CP formulations, multi-neighborhood simulated annealing, and constraint-based LNS for parallel machine scheduling under conflict graph constraints.', 'rosati-2026-itor', 'parallel-machine-conflict-scheduling', true, true, NULL, NULL, '2026-09-24 03:52:37'),
  ('seminar-vrp-masterclass-hoang', 'Modern Metaheuristics and Matheuristics in Vehicle Routing: From Classical VRP to Multi-Tier Networks', 'Modern Metaheuristics and Matheuristics in Vehicle Routing: From Classical VRP to Multi-Tier Networks', 'Assoc. Prof. Minh Hoang Ha', NULL, 'Dean of Faculty (VNU-HUS) / Senior Scientific Advisor, SLSCM Lab', 'Faculty of Mathematics, Mechanics and Informatics, VNU-HUS & SLSCM Lab', 'vnu-hus', '2025-11-18', '09:00 – 11:45 (GMT+7)', 'Hall A1, National Economics University', 'In-Person', 'Archived', 'Distinguished Keynote Masterclass', 'Operations Research & Algorithm Engineering', 'Distinguished masterclass by Assoc. Prof. Minh Hoang Ha surveying state-of-the-art Hybrid Genetic Search (HGS), Branch-Cut-and-Price algorithms, and matheuristic paradigms bridging exact integer solvers with neighborhood search heuristics for large-scale logistics networks.', 'Distinguished masterclass by Assoc. Prof. Minh Hoang Ha surveying state-of-the-art Hybrid Genetic Search (HGS), Branch-Cut-and-Price algorithms, and matheuristic paradigms bridging exact integer solvers with neighborhood search heuristics for large-scale logistics networks.', 'ha-2026-hdc-cor', NULL, true, true, NULL, NULL, '2026-09-24 03:52:37'),
  ('seminar-inventory-routing-brescia', 'Data-Driven Inventory Routing: Stochastic Demands and Energy-Aware Mixed Fleets', 'Data-Driven Inventory Routing: Stochastic Demands and Energy-Aware Mixed Fleets', 'Dr. Nho Minh Dinh & MSc. Tuan Anh Pham', NULL, 'Lecturer in Operations Research (FDA - NEU) & IRP Researcher', 'Faculty of Data Science & AI, College of Technology - NEU & SLSCM Lab', 'neu', '2025-10-14', '14:00 – 16:30 (GMT+7)', 'Room P1613, Building A1, NEU & Zoom', 'Hybrid', 'Archived', 'Research Seminar', 'Supply Chain Analytics & Inventory Routing', 'Explores data-driven inventory replenishment coordinated with green fleet routing, presenting lessons from postdoctoral research at University of Brescia & University of Calabria, and collaborative publications in the European Journal of Operational Research.', 'Explores data-driven inventory replenishment coordinated with green fleet routing, presenting lessons from postdoctoral research at University of Brescia & University of Calabria, and collaborative publications in the European Journal of Operational Research.', 'zhao-2025-irp-ejor', NULL, true, false, NULL, NULL, '2026-09-24 03:52:37'),
  ('seminar-upcoming-smart-water-ai', 'Predict-then-Optimize Frameworks for Municipal Hydraulic Infrastructure and Flood Resilience', 'Predict-then-Optimize Frameworks for Municipal Hydraulic Infrastructure and Flood Resilience', 'Dr. Duc Minh Vu & MSc. Duy Khanh Le', NULL, 'Head of SLSCM Lab & Head of CADA Lab', 'Faculty of Data Science and AI, College of Technology - NEU', 'neu', '2026-10-15', '09:30 – 11:30 (GMT+7)', 'Room P1613, Building A1, National Economics University', 'Hybrid', 'Upcoming', 'Joint Lab Research Seminar', 'Smart Cities & Decision Analytics', 'Presents milestone findings from the joint CADA-SLSCM urban water initiative: deep learning rainfall-runoff forecasting integrated with non-linear integer optimization for municipal pump station dispatching.', 'Presents milestone findings from the joint CADA-SLSCM urban water initiative: deep learning rainfall-runoff forecasting integrated with non-linear integer optimization for municipal pump station dispatching.', NULL, 'hanoi-smart-water-network', false, false, NULL, NULL, '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: seminar_topics (27 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.seminar_topics ("seminar_id", "topic")
VALUES
  ('seminar-cfl-conic-smu', 'Cross-Nested Logit (CNL) Discrete Choice Models'),
  ('seminar-cfl-conic-smu', 'Non-concave Objective Transformations'),
  ('seminar-cfl-conic-smu', 'Mixed-Integer Exponential Cone Programming'),
  ('seminar-cfl-conic-smu', 'Outer Approximation Cut Generation'),
  ('seminar-cfl-conic-smu', 'IJOC Publication Pipeline'),
  ('seminar-rvfstsp-drone-logistics', 'Revisit Flying Sidekick TSP (RV-FSTSP)'),
  ('seminar-rvfstsp-drone-logistics', 'Truck-and-Drone Synchronization'),
  ('seminar-rvfstsp-drone-logistics', 'Stage-Based Integer Formulation'),
  ('seminar-rvfstsp-drone-logistics', 'CMSA Metaheuristics'),
  ('seminar-rvfstsp-drone-logistics', 'Real-world Last-Mile Delivery Scenarios'),
  ('seminar-cp-scheduling-udine', 'Parallel Machine Scheduling with Conflicts'),
  ('seminar-cp-scheduling-udine', 'Constraint Programming (CP Optimizer)'),
  ('seminar-cp-scheduling-udine', 'Multi-Neighborhood Simulated Annealing (MNSA)'),
  ('seminar-cp-scheduling-udine', 'CP-based Large Neighborhood Search (LNS)'),
  ('seminar-cp-scheduling-udine', 'Semiconductor Manufacturing Benchmarks'),
  ('seminar-vrp-masterclass-hoang', 'Vehicle Routing Evolution (VRP, CVRP, VRPTW)'),
  ('seminar-vrp-masterclass-hoang', 'Hybrid Genetic Search (HGS) Architectural Design'),
  ('seminar-vrp-masterclass-hoang', 'Branch-and-Cut-and-Price Mechanics'),
  ('seminar-vrp-masterclass-hoang', 'Matheuristics in Industrial Logistics'),
  ('seminar-inventory-routing-brescia', 'Inventory Routing Problem (IRP)'),
  ('seminar-inventory-routing-brescia', 'Stochastic & Dynamic Customer Demands'),
  ('seminar-inventory-routing-brescia', 'Electric Fleet Energy Constraints'),
  ('seminar-inventory-routing-brescia', 'Matheuristics for Coordinated Supply Chains'),
  ('seminar-upcoming-smart-water-ai', 'Predict-then-Optimize Paradigms'),
  ('seminar-upcoming-smart-water-ai', 'IoT Time-Series Hydraulic Modeling'),
  ('seminar-upcoming-smart-water-ai', 'Urban Flood Risk Prevention'),
  ('seminar-upcoming-smart-water-ai', 'Automated Pump Dispatching')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: events (8 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.events ("id", "title", "title_vi", "event_date", "category", "category_vi", "badge", "summary", "summary_en", "summary_vi", "content_en", "content_vi", "link", "link_label", "featured", "created_at")
VALUES
  ('brief-ep20-workshop-series-2026', 'EP20 Discovery & Modeling Workshop Series: From Challenges to Models, Data & Decisions', 'Chuỗi Workshop Khám phá & Mô hình hóa EP20: Từ Thách thức Chuỗi Cung ứng đến Mô hình, Dữ liệu và Quyết định Thông minh', '2026-09-24', 'Workshops & Training', 'Hội thảo & Đào tạo', 'EP20 Workshop Series', 'The Smart Logistics and Supply Chain Management Laboratory (SLSCM Lab) invites students to join the EP20 Discovery & Modeling Workshop Series — an introductory program designed to explore how modern supply chains are transformed by data, optimization, and AI, turning real-world logistics challenges into mathematical models and computational decisions.', 'The Smart Logistics and Supply Chain Management Laboratory (SLSCM Lab) invites students to join the EP20 Discovery & Modeling Workshop Series — an introductory program designed to explore how modern supply chains are transformed by data, optimization, and AI, turning real-world logistics challenges into mathematical models and computational decisions.', 'SLSCM Lab trân trọng mời sinh viên tham gia Chuỗi Workshop Khám phá & Mô hình hóa EP20 — chương trình nhập môn giúp sinh viên hiểu rõ ngành Logistics và Quản trị Chuỗi cung ứng thông minh, khám phá cách dữ liệu, vận trù học và AI định hình các quyết định thực tế.', 'The Smart Logistics and Supply Chain Management Laboratory (SLSCM Lab) invites students to join the EP20 Discovery & Modeling Workshop Series, an introductory series designed for students who want to better understand the field of Logistics Technology and Supply Chain Management (EP20) and explore how modern supply chains are being transformed by data, optimization, and artificial intelligence.

### What is EP20 really about?
Logistics and supply chain management today goes far beyond transportation and warehousing. Modern supply chains involve complex decisions: Where should facilities be located? How should vehicles be routed? How much inventory should a company hold? How can demand be forecast? How should production and transportation be coordinated? How can AI and data help companies make better decisions?

The opening session will provide a broad introduction to EP20 and explore:
• What students will learn throughout the EP20 program;
• How modern logistics and supply chains operate;
• Major technological and analytical trends shaping supply chains worldwide;
• The roles of Data Science, Artificial Intelligence, Operations Research, and Optimization in modern supply chains;
• Real-world applications in transportation, warehousing, inventory, production, e-commerce, and supply chain planning;
• Career opportunities in logistics, supply chain management, optimization, data analytics, technology, and consulting;
• Master''s and PhD opportunities in Vietnam and internationally;
• Opportunities for undergraduate research, competitions, projects, and collaboration with SLSCM Lab.

### From Understanding Problems to Modeling Them
The following workshops will introduce students to one of the fundamental skills behind modern supply chain analytics: turning real-world problems into mathematical and computational models.
Through simple examples, participants will learn how to move through the process: Real-world Problem → Mathematical Model → Computational Solution → Decision.

Topics will include:
• Introduction to mathematical modeling;
• Decision variables, objective functions, and constraints;
• Basic linear and integer optimization models;
• Modeling fundamental logistics and supply chain problems;
• Introduction to optimization and modeling software;
• Implementing simple models using programming tools;
• Solving models and interpreting computational results.
(No previous knowledge of Operations Research or mathematical optimization is required.)

### Recommended Background
Participants are expected to have: basic programming skills, basic mathematical reasoning, and basic knowledge of Linear Algebra. More importantly, participants should be curious about how mathematics, data, algorithms, and AI can be used to understand and improve real-world logistics and supply chain systems.

### Who Should Join?
The series is particularly suitable for EP20 students, especially those in the early stages of the program who want to understand where their studies can lead. It is also suitable for students interested in logistics, supply chain management, optimization, data science, artificial intelligence, and quantitative decision-making.

"Understand the field. Learn to model. Build the tools to solve real-world supply chain problems."', 'Phòng thí nghiệm Quản trị Logistics và Chuỗi cung ứng thông minh (SLSCM Lab) trân trọng mời các bạn sinh viên tham gia Chuỗi Workshop Khám phá & Mô hình hóa EP20 — chuỗi chuyên đề nhập môn dành cho sinh viên muốn hiểu sâu sắc về ngành Công nghệ Logistics và Quản trị Chuỗi cung ứng (EP20) và khám phá cách chuỗi cung ứng hiện đại đang chuyển mình mạnh mẽ nhờ dữ liệu, tối ưu hóa và trí tuệ nhân tạo.

### Ngành EP20 thực sự là gì?
Logistics và quản trị chuỗi cung ứng ngày nay vượt xa khỏi ranh giới vận tải và kho bãi truyền thống. Chuỗi cung ứng hiện đại giải quyết những bài toán ra quyết định phức tạp: Đặt cơ sở ở đâu? Định tuyến phương tiện như thế nào? Dự trữ tồn kho bao nhiêu? Dự báo nhu cầu ra sao? Làm thế nào phối hợp sản xuất và vận tải nhịp nhàng? AI và dữ liệu giúp doanh nghiệp ra quyết định tối ưu như thế nào?

Buổi mở đầu sẽ cung cấp bức tranh toàn cảnh về EP20 và mở rộng:
• Khung chương trình đào tạo sinh viên sẽ học trong suốt EP20;
• Cách thức vận hành của logistics và chuỗi cung ứng thông minh hiện đại;
• Xu hướng công nghệ và phân tích dữ liệu định hình chuỗi cung ứng toàn cầu;
• Vai trò của Khoa học Dữ liệu, Trí tuệ Nhân tạo, Vận trù học và Tối ưu hóa;
• Ứng dụng thực tế trong giao vận, kho vận, tồn kho, sản xuất, thương mại điện tử;
• Cơ hội nghề nghiệp trong logistics, SCM, tối ưu hóa, phân tích dữ liệu, tư vấn giải pháp;
• Cơ hội học tiếp Thạc sĩ và Tiến sĩ tại Việt Nam và các đại học hàng đầu thế giới;
• Cơ hội NCKH, tham gia các cuộc thi học thuật, dự án và đồng hành cùng SLSCM Lab.

### Từ Thấu hiểu Bài toán đến Mô hình hóa Toán học
Các buổi workshop tiếp theo sẽ trang bị cho sinh viên kỹ năng cốt lõi nhất của phân tích chuỗi cung ứng hiện đại: Chuyển đổi bài toán thực tế thành mô hình toán học và tính toán.
Qua các ví dụ trực quan, người học trải nghiệm trọn vẹn quy trình: Bài toán thực tế → Mô hình Toán học → Giải pháp Tính toán → Quyết định.

Nội dung chính:
• Nhập môn mô hình hóa toán học;
• Biến quyết định, hàm mục tiêu và các ràng buộc bài toán;
• Các mô hình tối ưu tuyến tính và số nguyên cơ bản;
• Mô hình hóa các bài toán logistics và chuỗi cung ứng nền tảng;
• Làm quen với các phần mềm tối ưu hóa và mô hình hóa;
• Lập trình triển khai mô hình với công cụ tính toán;
• Giải mô hình và phân tích, diễn giải kết quả tính toán.
(Không yêu cầu kiến thức trước về Vận trù học hay Tối ưu hóa toán học).

### Yêu cầu nền tảng khuyến nghị
Sinh viên có kỹ năng lập trình cơ bản, tư duy toán học nền tảng và kiến thức Đại số tuyến tính căn bản. Quan trọng nhất là niềm say mê, tò mò tìm hiểu cách toán học, dữ liệu, thuật toán và AI được ứng dụng để tối ưu các hệ thống thực tế.

### Đối tượng tham gia
Đặc biệt phù hợp với sinh viên EP20 (nhất là các khóa đầu chương trình), cũng như toàn thể sinh viên yêu thích logistics, chuỗi cung ứng, tối ưu hóa, data science, AI và ra quyết định định lượng.

"Thấu hiểu ngành nghề. Học cách mô hình hóa. Kiến tạo công cụ giải quyết bài toán chuỗi cung ứng thực tế."', 'https://www.facebook.com/slscm.lab', 'Facebook Lab & Details', true, '2026-09-24 03:52:37'),
  ('brief-comosa-2026-acceptance', '3 Research Papers Accepted for Presentation at COMOSA 2026 (Springer SOIA)', '3 Research Papers Accepted for Presentation at COMOSA 2026 (Springer SOIA)', '2026-04-15', 'Scientific Breakthrough', 'Scientific Breakthrough', 'COMOSA 2026', 'SLSCM Lab achieves triple acceptance at the 1st International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2026), featuring breakthrough works on drone tourism routing, energy-constrained parallel scheduling, and drone-locker urban logistics.', 'SLSCM Lab achieves triple acceptance at the 1st International Conference on Optimization, Modeling, Simulation, and Analytics (COMOSA 2026), featuring breakthrough works on drone tourism routing, energy-constrained parallel scheduling, and drone-locker urban logistics.', '', 'We are pleased to announce that 3 papers by SLSCM Lab researchers and collaborators have been officially accepted for presentation at COMOSA 2026 (August 7–8, 2026 in Hanoi, Vietnam) and publication in Springer SOIA proceedings:

• Paper #31: "Drone Tourism Routing Under Energy, Time-Window and Communication-Coverage Constraints" — Cao Nguyet Anh, Vu Duc Minh, Le Thi Bich Hanh, Pham Thanh Binh
• Paper #33: "Improved Bounds for the Energy-Constrained Parallel Machine Scheduling Problem to Minimize Total Completion Time" — Viet Nguyen Huu, Tien Thanh Mai, Quy Ta Dinh, Minh Hoang Ha, Binh Huynh Thi Thanh
• Paper #36: "On the Drone-Locker Location Scheduling Problem" — Thi Nhung Tran, Thu Trang Hoa, Hai Dang Le, Minh Hoang Ha', '', 'https://comosa.vn/accepted-papers/', 'Explore COMOSA 2026 Accepted Papers', true, '2026-09-24 03:52:37'),
  ('brief-trc-publication-2026', 'SLSCM Lab Researchers Publish in Premier Journal Transportation Research Part C (TRC, 2026)', 'SLSCM Lab Researchers Publish in Premier Journal Transportation Research Part C (TRC, 2026)', '2026-03-20', 'Scientific Breakthrough', 'Scientific Breakthrough', 'Q1 Journal', 'Our research team, featuring young researcher Tran Nam Khanh (HUS-VNU) and Dr. Duc Minh Vu, officially published their paper on Stage-Based Formulations and Matheuristic Algorithms for the Revisit Flying Sidekick TSP in TRC (Vol. 192).', 'Our research team, featuring young researcher Tran Nam Khanh (HUS-VNU) and Dr. Duc Minh Vu, officially published their paper on Stage-Based Formulations and Matheuristic Algorithms for the Revisit Flying Sidekick TSP in TRC (Vol. 192).', '', 'This research introduces the Revisit Flying Sidekick Traveling Salesman Problem (RV-FSTSP), relaxing rigid classical constraints to permit delivery trucks to revisit previously served customers and operate as stationary launchpads for multiple successive drone sorties. Comprehensive computational experiments prove our matheuristic saves up to 28.4% of total mission makespan.', '', 'https://doi.org/10.1016/j.trc.2026.105906', 'View Paper DOI', true, '2026-09-24 03:52:37'),
  ('brief-ijoc-acceptance-2026', 'Major Research Milestone: Publication Accepted by INFORMS Journal on Computing (IJOC)', 'Major Research Milestone: Publication Accepted by INFORMS Journal on Computing (IJOC)', '2026-02-18', 'Top-tier Publication', 'Top-tier Publication', 'INFORMS Flagship', 'Paper by Le Ba Luat, Prof. Mai Tien (SMU), Dr. Ta Thuy Anh, Assoc. Prof. Minh Hoang Ha, and Dr. Duc Minh Vu on Competitive Facility Location under Cross-Nested Logit models officially accepted by Area Editor Andrea Lodi.', 'Paper by Le Ba Luat, Prof. Mai Tien (SMU), Dr. Ta Thuy Anh, Assoc. Prof. Minh Hoang Ha, and Dr. Duc Minh Vu on Competitive Facility Location under Cross-Nested Logit models officially accepted by Area Editor Andrea Lodi.', '', 'INFORMS Journal on Computing is a premier flagship journal in operations research and computing. The paper resolves a longstanding mathematical challenge: establishing NP-hardness proofs and transforming the non-concave objective into a mixed-integer exponential cone convex program solved to optimality via outer approximation. Open-source solvers and benchmark datasets have been integrated into the IJOC Software Repository.', '', 'https://doi.org/10.1287/ijoc.2025.1150', 'View IJOC Publication', true, '2026-09-24 03:52:37'),
  ('brief-smu-scholarships-2026', 'Scholars Win Fully-Funded PhD & Research Positions at Singapore Management University (SMU)', 'Scholars Win Fully-Funded PhD & Research Positions at Singapore Management University (SMU)', '2026-01-15', 'Student Honor & Placement', 'Student Honor & Placement', 'SMU Placement', 'Ba Luat Le (Valedictorian) secured a full PhD scholarship in Operations Research at SMU, while former scholar Thu Trang Hoa joined as a Research Engineer in Computing & AI.', 'Ba Luat Le (Valedictorian) secured a full PhD scholarship in Operations Research at SMU, while former scholar Thu Trang Hoa joined as a Research Engineer in Computing & AI.', '', 'This milestone highlights the lab''s dedication to nurturing young scholars and aligning with global academic standards. Under joint mentorship by Prof. Mai Tien (SMU), Assoc. Prof. Minh Hoang Ha, and Dr. Duc Minh Vu, our scholars build top-tier publication records before entering prestigious doctoral and research engineering programs.', '', 'https://www.smu.edu.sg/', 'Explore SMU', true, '2026-09-24 03:52:37'),
  ('brief-smart-water-launch-2025', 'Inter-Lab Initiative: AI & OR for Hanoi Urban Smart Water Supply & Drainage Network', 'Inter-Lab Initiative: AI & OR for Hanoi Urban Smart Water Supply & Drainage Network', '2025-12-08', 'Research Collaboration', 'Research Collaboration', 'Smart City Project', 'Kick-off of an interdisciplinary project between CADA Lab (P1601) and SLSCM Lab (P1613) at College of Technology - NEU to optimize municipal water infrastructure via AI and Operations Research.', 'Kick-off of an interdisciplinary project between CADA Lab (P1601) and SLSCM Lab (P1613) at College of Technology - NEU to optimize municipal water infrastructure via AI and Operations Research.', '', 'The interdisciplinary project integrates real-time IoT hydraulic sensor feeds across Hanoi with deep learning predictive models and mixed-integer nonlinear programming for pump station optimization, significantly curbing energy consumption and bolstering flood defense capabilities.', '', 'https://fda.neu.edu.vn/slscm/', 'View Lab Page', false, '2026-09-24 03:52:37'),
  ('brief-decision-workshop-2025', 'Executive Workshop: From Data to Decision Intelligence & Prescriptive Analytics', 'Executive Workshop: From Data to Decision Intelligence & Prescriptive Analytics', '2025-11-25', 'Knowledge Transfer', 'Knowledge Transfer', 'Executive Course', 'SLSCM Lab and FDA College of Technology hosted an intensive 4-module professional course on mathematical modeling, Python solvers (Gurobi, OR-Tools), and supply chain optimization.', 'SLSCM Lab and FDA College of Technology hosted an intensive 4-module professional course on mathematical modeling, Python solvers (Gurobi, OR-Tools), and supply chain optimization.', '', 'More than 50 participants, including talented undergraduates, graduate students, and analytics specialists from retail and logistics enterprises, attended. The intensive 4-module program provided hands-on training in MIP modeling, Python solvers (Gurobi, Google OR-Tools), and supply chain decision intelligence.', '', 'https://www.facebook.com/slscm.lab', 'Facebook Event Highlights', false, '2026-09-24 03:52:37'),
  ('brief-global-placements-2025', 'Scholars Win Prestigious Placements in United Kingdom & United States (LJMU, UConn, USF)', 'Scholars Win Prestigious Placements in United Kingdom & United States (LJMU, UConn, USF)', '2025-09-10', 'Student Honor & Placement', 'Student Honor & Placement', 'UK & US Placements', 'Nguyen Tat Dat joins Liverpool John Moores University (UK); Hai Thu Nguyen (Intake 63 Valedictorian) embarks on PhD in Actuarial Science at University of Connecticut (USA); Trung Cuong Dang awarded PhD at University of South Florida (USA).', 'Nguyen Tat Dat joins Liverpool John Moores University (UK); Hai Thu Nguyen (Intake 63 Valedictorian) embarks on PhD in Actuarial Science at University of Connecticut (USA); Trung Cuong Dang awarded PhD at University of South Florida (USA).', '', 'Consecutive doctoral placements highlight the academic excellence and global reputation of SLSCM Lab''s mentorship track. Our alumni maintain an active research network, continuing scientific collaborations with the lab across the UK and the United States.', '', 'https://fda.neu.edu.vn/slscm/', 'Read Announcement', false, '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: event_tags (41 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.event_tags ("event_id", "tag")
VALUES
  ('brief-ep20-workshop-series-2026', 'Workshops & Training'),
  ('brief-ep20-workshop-series-2026', 'EP20'),
  ('brief-ep20-workshop-series-2026', 'Mathematical Modeling'),
  ('brief-ep20-workshop-series-2026', 'Supply Chain'),
  ('brief-ep20-workshop-series-2026', 'Operations Research'),
  ('brief-ep20-workshop-series-2026', 'Data Science & AI'),
  ('brief-comosa-2026-acceptance', 'COMOSA 2026'),
  ('brief-comosa-2026-acceptance', 'Conference Acceptance'),
  ('brief-comosa-2026-acceptance', 'Drone Routing'),
  ('brief-comosa-2026-acceptance', 'Parallel Scheduling'),
  ('brief-comosa-2026-acceptance', 'Springer SOIA'),
  ('brief-trc-publication-2026', 'Transportation Research Part C'),
  ('brief-trc-publication-2026', 'Drone Routing'),
  ('brief-trc-publication-2026', 'FSTSP'),
  ('brief-trc-publication-2026', 'Matheuristics'),
  ('brief-trc-publication-2026', 'HUS-VNU'),
  ('brief-ijoc-acceptance-2026', 'IJOC'),
  ('brief-ijoc-acceptance-2026', 'INFORMS'),
  ('brief-ijoc-acceptance-2026', 'Facility Location'),
  ('brief-ijoc-acceptance-2026', 'Exponential Cone'),
  ('brief-ijoc-acceptance-2026', 'Open Source'),
  ('brief-smu-scholarships-2026', 'SMU Singapore'),
  ('brief-smu-scholarships-2026', 'PhD Scholarship'),
  ('brief-smu-scholarships-2026', 'Research Engineer'),
  ('brief-smu-scholarships-2026', 'Valedictorian'),
  ('brief-smu-scholarships-2026', 'Hall of Fame'),
  ('brief-smart-water-launch-2025', 'Smart Water'),
  ('brief-smart-water-launch-2025', 'CADA Lab'),
  ('brief-smart-water-launch-2025', 'NEU'),
  ('brief-smart-water-launch-2025', 'Urban IoT'),
  ('brief-smart-water-launch-2025', 'Pump Optimization'),
  ('brief-decision-workshop-2025', 'Executive Training'),
  ('brief-decision-workshop-2025', 'Decision Intelligence'),
  ('brief-decision-workshop-2025', 'Python Solvers'),
  ('brief-decision-workshop-2025', 'Gurobi'),
  ('brief-decision-workshop-2025', 'FDA'),
  ('brief-global-placements-2025', 'LJMU'),
  ('brief-global-placements-2025', 'UConn'),
  ('brief-global-placements-2025', 'USF'),
  ('brief-global-placements-2025', 'PhD Scholarship'),
  ('brief-global-placements-2025', 'Global Alumni')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: achievements (7 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.achievements ("id", "person_id", "name", "name_en", "avatar", "achievement", "achievement_en", "destination_institution", "institution_id", "country", "year", "award_type", "field", "former_background_en", "advisors", "featured", "display_order", "created_at")
VALUES
  ('hof-le-ba-luat', NULL, 'Ba Luat Le', 'Ba Luat Le', '/assets/images/people/le_ba_luat.jpg', 'Valedictorian of College of Technology, Phenikaa University (2025); Awarded Full PhD Scholarship at Singapore Management University (SMU, 2026).', 'Valedictorian of College of Technology, Phenikaa University (2025); Awarded Full PhD Scholarship at Singapore Management University (SMU, 2026).', 'Singapore Management University (SMU)', 'smu', 'Singapore', 2026, 'PhD Scholarship & Valedictorian', '', 'Former Student in Computer Science, Phenikaa University', NULL, true, 0, '2026-09-24 03:52:37'),
  ('hof-hoa-thi-thu-trang', NULL, 'Thu Trang Hoa Thi', 'Thu Trang Hoa Thi', '/assets/images/people/hoa_thi_thu_trang.jpg', 'Appointed Research Engineer at Singapore Management University (SMU, Singapore, 2026).', 'Appointed Research Engineer at Singapore Management University (SMU, Singapore, 2026).', 'Singapore Management University (SMU)', 'smu', 'Singapore', 2026, 'Research Engineer Placement', '', 'Former Student in Computer Science, Phenikaa University', NULL, true, 1, '2026-09-24 03:52:37'),
  ('hof-mai-thanh-loc', NULL, 'Thanh Loc Mai', 'Thanh Loc Mai', '/assets/images/people/mai_thanh_loc.jpg', 'Awarded Full Master''s Scholarship at VinUniversity (VinUni, Vietnam, 2026).', 'Awarded Full Master''s Scholarship at VinUniversity (VinUni, Vietnam, 2026).', 'VinUniversity (VinUni)', 'vinuni', 'Vietnam', 2026, 'Master''s Scholarship', '', 'Former Student in Mathematical Economics, National Economics University (NEU)', NULL, true, 2, '2026-09-24 03:52:37'),
  ('hof-la-quang-chien', NULL, 'Quang Chien La', 'Quang Chien La', '', 'Awarded Full Master''s Scholarship at VinUniversity (VinUni, Vietnam, 2026).', 'Awarded Full Master''s Scholarship at VinUniversity (VinUni, Vietnam, 2026).', 'VinUniversity (VinUni)', 'vinuni', 'Vietnam', 2026, 'Master''s Scholarship', '', 'Former Student in Mathematical Economics, National Economics University (NEU)', NULL, true, 3, '2026-09-24 03:52:37'),
  ('hof-nguyen-tat-dat', NULL, 'Nguyen Tat Dat', 'Nguyen Tat Dat', '/assets/images/people/nguyen_tat_dat.jpg', 'Lead author in European Journal of Operational Research (EJOR, Q1); Awarded Full PhD Scholarship at Liverpool John Moores University (LJMU, UK, 2025).', 'Lead author in European Journal of Operational Research (EJOR, Q1); Awarded Full PhD Scholarship at Liverpool John Moores University (LJMU, UK, 2025).', 'Liverpool John Moores University (LJMU)', 'ljmu', 'United Kingdom', 2025, 'PhD Scholarship', '', 'Former Student in CS, UET-VN', NULL, true, 4, '2026-09-24 03:52:37'),
  ('hof-nguyen-hai-thu', NULL, 'Hai Thu Nguyen', 'Hai Thu Nguyen', '/assets/images/people/nguyen_hai_thu.jpg', 'Valedictorian in Actuarial Science and Risk Management - Intake 63, NEU; Awarded PhD Scholarship at University of Connecticut (UConn, USA, 2024).', 'Valedictorian in Actuarial Science and Risk Management - Intake 63, NEU; Awarded PhD Scholarship at University of Connecticut (UConn, USA, 2024).', 'University of Connecticut (UConn)', 'uconn', 'United States', 2024, 'PhD Scholarship & Program Valedictorian', '', 'Former Student in Actuarial Science and Risk Management, National Economics University (NEU)', NULL, true, 5, '2026-09-24 03:52:37'),
  ('hof-dang-trung-cuong', NULL, 'Trung Cuong Dang', 'Trung Cuong Dang', '/assets/images/people/dang_trung_cuong.jpg', 'Awarded Full PhD Scholarship at the University of South Florida (USF, USA, 2024).', 'Awarded Full PhD Scholarship at the University of South Florida (USF, USA, 2024).', 'University of South Florida (USF)', 'usf', 'United States', 2024, 'PhD Scholarship', '', 'Former Student in CS, UET-VN', NULL, true, 6, '2026-09-24 03:52:37')
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: global_academic_partners (7 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.global_academic_partners ("id", "institution", "institution_id", "country", "key_collaborators", "research_focus", "order_index")
VALUES
  ('partner-1-singapore-manag', 'Singapore Management University (SMU)', 'smu', 'Singapore', '', '', 0),
  ('partner-2-university-of-u', 'University of Udine', 'udine', 'Italy', '', '', 1),
  ('partner-3-austrian-resear', 'Austrian Research Community / Partner Institutes', NULL, 'Austria', '', '', 2),
  ('partner-4-cardiff-univers', 'Cardiff University, Lancaster University, Liverpool John Moores University (LJMU)', 'ljmu', 'United Kingdom', '', '', 3),
  ('partner-5-loyola-universi', 'Loyola University Chicago, University of Michigan - Flint', NULL, 'United States', '', '', 4),
  ('partner-6-université-de-m', 'Université de Montréal / CIRRELT', NULL, 'Canada & France', '', '', 5),
  ('partner-7-vnu-hus,-hust,-', 'VNU-HUS, HUST, Phenikaa University, VinUniversity', 'vnu-hus', 'Vietnam', '', '', 6)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: social_posts (6 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.social_posts ("id", "type", "title", "abstract", "journal", "paper_title", "authors", "organizer", "collaboration", "link", "action_label", "venue", "display_order")
VALUES
  ('post-1', 'training_education', 'EP20 Discovery & Modeling Workshop Series', 'The SLSCM Lab invites students to join the EP20 Discovery & Modeling Workshop Series — an introductory program designed to explore how modern supply chains are transformed by data, optimization, and AI, turning real-world logistics challenges into mathematical models and computational decisions.', '', '', NULL, 'SLSCM Lab & Faculty of Data Science and AI (FDA) - NEU', '', 'https://www.facebook.com/slscm.lab', 'View Details & Register', '', 0),
  ('post-2', 'publication_news', 'New ITOR Publication on Parallel Machine Scheduling with Conflicting Jobs', 'Research focuses on scheduling conflicting jobs on identical parallel machines to minimize makespan. Proposes a novel constraint programming model and multineighborhood simulated annealing metaheuristics with proven computational efficiency.', 'International Transactions in Operational Research (ITOR)', '', '["Ta Dinh Quy", "Ha Minh Hoang", "Roberto Rosati (Austria)", "Andrea Schaerf (Italy)"]'::jsonb, '', '', 'https://onlinelibrary.wiley.com/doi/10.1111/itor.70177', 'Read ITOR Paper', '', 1),
  ('post-3', 'publication_news', 'Paper Accepted in INFORMS Journal on Computing (IJOC)', 'Investigates competitive facility location under cross-nested logit customer choice models. Establishes NP-hardness and non-concavity, then derives an exact mixed-integer exponential cone formulation solved to optimality via outer approximation.', 'INFORMS Journal on Computing (IJOC)', 'Competitive Facility Location under Cross-Nested Logit Customer Choice Model: Hardness and Exact Approaches', '["Le Ba Luat", "Mai Tien (SMU Singapore)", "Ta Thuy Anh (Phenikaa)", "Ha Minh Hoang", "Vu Duc Minh"]'::jsonb, '', '', 'https://doi.org/10.1287/ijoc.2025.1150', 'Read IJOC Paper', '', 2),
  ('post-4', 'publication_news', 'Young Scholar Publication in Transportation Research Part C', 'Introduces a novel stage-based integer formulation and metaheuristic algorithm for the Revisit Flying Sidekick TSP, enabling delivery trucks to revisit customer nodes and coordinate multi-trip drone sorties for accelerated last-mile logistics.', 'Transportation Research Part C: Emerging Technologies', 'A Stage-based Formulation and Meta-heuristic Algorithm for the Revisit Flying SideKick Traveling Salesman Problem', '["Le Thi Hong", "Duc Duy Vu", "Tran Nam Khanh", "Nguyen Dinh Cong", "Vu Duc Minh"]'::jsonb, '', '', 'https://doi.org/10.1016/j.trc.2026.105906', 'Read TRC Paper', '', 3),
  ('post-5', 'recruitment_project', 'Real-World Initiative: AI & OR for Hanoi Urban Smart Water Network', 'A collaborative smart city initiative between CADA and SLSCM Labs applying AI and Operations Research to Hanoi''s municipal drainage infrastructure, integrating live IoT telemetry with machine learning for real-time flood mitigation.', '', '', NULL, '', 'Joint Lab Initiative: CADA (P1601 A1) & SLSCM (P1613 A1) - FDA College of Technology, NEU', 'https://fda.neu.edu.vn/slscm/', 'Explore Project', '', 4),
  ('post-6', 'training_education', 'Executive Professional Workshop: Decision Intelligence & Analytics', 'Advanced executive training hosted by SLSCM Lab and FDA College of Technology, equipping professionals with combinatorial optimization, prescriptive analytics, and AI frameworks to solve large-scale logistical operations.', '', '', NULL, 'SLSCM Lab & FDA Faculty - National Economics University', '', 'https://www.facebook.com/slscm.lab', 'View Announcement', '', 5)
ON CONFLICT DO NOTHING;

-- ------------------------------------------------------------------------------
-- Table: lab_overview (8 rows)
-- ------------------------------------------------------------------------------
INSERT INTO public.lab_overview ("key", "value")
VALUES
  ('name', 'Smart Logistics and Supply Chain Management Laboratory'),
  ('abbreviation', 'SLSCM Lab'),
  ('affiliation', 'College of Technology, National Economics University'),
  ('faculty_department', 'Faculty of Data Science and Artificial Intelligence (FDA)'),
  ('address', 'Room 1613, A1 Building, National Economics University, 207 Giai Phong Street, Hanoi, Vietnam'),
  ('head_of_lab', '{"name": "Dr. Duc Minh Vu", "email": "minhvd@neu.edu.vn", "title": "Head of Lab / Lecturer", "office": "Room 1613, A1 Building, National Economics University"}'),
  ('social', '{"facebook": "https://www.facebook.com/slscm.lab", "website_fda": "https://fda.neu.edu.vn/slscm/"}'),
  ('official_kpi_2025', '{"internal_scientific_activities": 20, "internal_training_sessions": 8, "seminars_organized": 4, "research_publication_events": 2}')
ON CONFLICT DO NOTHING;

COMMIT;
