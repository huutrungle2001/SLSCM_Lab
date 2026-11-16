-- Add RIVF 2026 and SOICT 2026 Publications

-- 1. Publication: le-2026-submilp-truck-drone-rivf
INSERT INTO public.publications (
  id, title, year, venue, type, doi, link, abstract, abstract_source,
  bibtex, research_pillar, primary_pillar_id, keywords, is_featured, badge, status
) VALUES (
  'le-2026-submilp-truck-drone-rivf',
  'A Component-Induced Dynamic SubMILP for Multi-Drop Revisit Truck-Drone Routing',
  2026,
  'The 2026 IEEE RIVF International Conference on Computing and Communication Technologies (RIVF 2026), IEEE Xplore',
  'Conference',
  NULL,
  'https://rivf2026.org/',
  'We study the multi-drop revisit truck-drone routing problem where unmanned aerial vehicles and ground vehicles collaborate to serve customer locations under dynamic scheduling constraints. We propose a component-induced dynamic SubMILP formulation and algorithmic framework that efficiently explores promising subproblems, achieving significant performance enhancements over benchmark exact and heuristic solvers.',
  'author',
  '@inproceedings{le_2026_submilp_truck_drone_rivf,
  title = {A Component-Induced Dynamic SubMILP for Multi-Drop Revisit Truck-Drone Routing},
  author = {Le Thi Hong and Tran Nam-Khanh and Nguyen Dinh Cong and Vu Duc Minh},
  booktitle = {Proceedings of the 2026 IEEE RIVF International Conference on Computing and Communication Technologies (RIVF 2026)},
  year = {2026},
  publisher = {IEEE}
}',
  'green_transportation',
  'supply_chain_optimization',
  '["drone-routing", "truck-drone", "submilp", "mathematical-programming", "logistics-optimization"]',
  false,
  'IEEE RIVF 2026',
  'published'
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  year = EXCLUDED.year,
  venue = EXCLUDED.venue,
  type = EXCLUDED.type,
  link = EXCLUDED.link,
  abstract = EXCLUDED.abstract,
  bibtex = EXCLUDED.bibtex,
  primary_pillar_id = EXCLUDED.primary_pillar_id,
  keywords = EXCLUDED.keywords,
  badge = EXCLUDED.badge,
  status = EXCLUDED.status;

DELETE FROM public.publication_authors WHERE publication_id = 'le-2026-submilp-truck-drone-rivf';
INSERT INTO public.publication_authors (publication_id, person_id, author_name, author_order, is_highlighted) VALUES
  ('le-2026-submilp-truck-drone-rivf', NULL, 'Hong Le Thi', 1, false),
  ('le-2026-submilp-truck-drone-rivf', 'tran-nam-khanh', 'Nam-Khanh Tran', 2, true),
  ('le-2026-submilp-truck-drone-rivf', NULL, 'Dinh Cong Nguyen', 3, false),
  ('le-2026-submilp-truck-drone-rivf', 'vu-duc-minh', 'Duc Minh Vu', 4, true)
ON CONFLICT (publication_id, author_order) DO NOTHING;

-- 2. Publication: pham-2026-oil-forecasting-soict
INSERT INTO public.publications (
  id, title, year, venue, type, doi, link, abstract, abstract_source,
  bibtex, research_pillar, primary_pillar_id, keywords, is_featured, badge, status
) VALUES (
  'pham-2026-oil-forecasting-soict',
  'Does More Information Help? Separating Information Value from Estimation-History Effects in Monthly Brent Crude Oil Forecasting',
  2026,
  'The 15th International Symposium on Information and Communication Technology (SOICT 2026)',
  'Conference',
  NULL,
  'https://www.facebook.com/share/p/1Fr3HmET2p/',
  'This paper investigates whether incorporating additional market and operational information improves monthly Brent crude oil price forecasting. Developed through a research collaboration between SLSCM Lab, Vietnam Petroleum Institute (VPI) experts, and NEU students, the study proposes a methodology to rigorously disentangle genuine information value from estimation-history effects in predictive time series models, offering actionable decision-support insights for energy and supply chain operations.',
  'author',
  '@inproceedings{pham_2026_oil_forecasting_soict,
  title = {Does More Information Help? Separating Information Value from Estimation-History Effects in Monthly Brent Crude Oil Forecasting},
  author = {Pham Duy-Phuong and Nguyen Vinh-Khanh and Hoang Thi-Thanh-Nhan and Hoang Anh-Minh and Doan Tien-Quyet and Nguyen Thanh-Sang and Hoang Duc-Manh and Vu Duc-Minh},
  booktitle = {Proceedings of the 15th International Symposium on Information and Communication Technology (SOICT 2026)},
  year = {2026}
}',
  'operational_optimization',
  'decision_analytics',
  '["forecasting", "crude-oil", "information-value", "energy-analytics", "time-series"]',
  false,
  'SOICT 2026 & VPI',
  'published'
) ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  year = EXCLUDED.year,
  venue = EXCLUDED.venue,
  type = EXCLUDED.type,
  link = EXCLUDED.link,
  abstract = EXCLUDED.abstract,
  bibtex = EXCLUDED.bibtex,
  primary_pillar_id = EXCLUDED.primary_pillar_id,
  keywords = EXCLUDED.keywords,
  badge = EXCLUDED.badge,
  status = EXCLUDED.status;

DELETE FROM public.publication_authors WHERE publication_id = 'pham-2026-oil-forecasting-soict';
INSERT INTO public.publication_authors (publication_id, person_id, author_name, author_order, is_highlighted) VALUES
  ('pham-2026-oil-forecasting-soict', NULL, 'Duy-Phuong Pham', 1, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Vinh-Khanh Nguyen', 2, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Thi-Thanh-Nhan Hoang', 3, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Anh-Minh Hoang', 4, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Tien-Quyet Doan', 5, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Thanh-Sang Nguyen', 6, false),
  ('pham-2026-oil-forecasting-soict', NULL, 'Duc-Manh Hoang', 7, false),
  ('pham-2026-oil-forecasting-soict', 'vu-duc-minh', 'Duc Minh Vu', 8, true)
ON CONFLICT (publication_id, author_order) DO NOTHING;
