-- Add publication: The parallel drone scheduling traveling salesman problem with lockers (TRC 2026)

INSERT INTO public.publications (
  id,
  title,
  year,
  venue,
  type,
  doi,
  link,
  abstract,
  abstract_source,
  bibtex,
  research_pillar,
  primary_pillar_id,
  keywords,
  is_featured,
  badge,
  status
)
VALUES (
  'hoa-2026-pdstsp-lockers-trc',
  'The parallel drone scheduling traveling salesman problem with lockers',
  2026,
  'Transportation Research Part C: Emerging Technologies',
  'Journal',
  '10.1016/j.trc.2026.106103',
  'https://doi.org/10.1016/j.trc.2026.106103',
  'In this paper, we study the Parallel Drone Scheduling Traveling Salesman Problem with Lockers (PDSTSP-L), a novel last-mile delivery framework integrating parcel lockers into coordinated truck-and-drone operations. Rather than restricting drone sorties to direct customer deliveries, the model incorporates smart automated parcel lockers as alternative delivery locations and drone battery-swapping stations, overcoming payload and battery endurance limitations while addressing recipient unavailability. We formulate the problem as a Mixed-Integer Linear Programming (MILP) model to minimize total operational costs, encompassing truck travel costs, drone operating costs, and customer compensation discounts for locker pick-up. To solve practical, large-scale instances with up to 200 customers, we develop an efficient Iterated Local Search (ILS) metaheuristic tailored with problem-specific destruction and local search operators. Computational experiments on benchmark instances confirm that the MILP model finds optimal solutions for small instances, while the proposed ILS metaheuristic achieves superior solution quality and computational efficiency on large networks. Sensitivity analyses demonstrate that integrating smart lockers substantially enhances delivery performance and reduces overall logistical costs.',
  'https://doi.org/10.1016/j.trc.2026.106103',
  '@article{hoa_2026_pdstsp_lockers_trc,
  title = {The parallel drone scheduling traveling salesman problem with lockers},
  author = {Thu Trang Hoa and Minh Anh Nguyen and Minh Hoàng Hà and Duc Minh Vu},
  journal = {Transportation Research Part C: Emerging Technologies},
  volume = {194},
  pages = {106103},
  year = {2026},
  doi = {10.1016/j.trc.2026.106103},
  url = {https://doi.org/10.1016/j.trc.2026.106103}
}',
  'green_transportation',
  'supply_chain_optimization',
  '["drone-logistics", "parcel-lockers", "vehicle-routing", "pdstsp", "mixed-integer-programming", "iterated-local-search", "last-mile-delivery"]'::jsonb,
  true,
  'TRC (SCIE Q1)',
  'published'
)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  year = EXCLUDED.year,
  venue = EXCLUDED.venue,
  type = EXCLUDED.type,
  doi = EXCLUDED.doi,
  link = EXCLUDED.link,
  abstract = EXCLUDED.abstract,
  abstract_source = EXCLUDED.abstract_source,
  bibtex = EXCLUDED.bibtex,
  research_pillar = EXCLUDED.research_pillar,
  primary_pillar_id = EXCLUDED.primary_pillar_id,
  keywords = EXCLUDED.keywords,
  is_featured = EXCLUDED.is_featured,
  badge = EXCLUDED.badge,
  status = EXCLUDED.status;

DELETE FROM public.publication_authors WHERE publication_id = 'hoa-2026-pdstsp-lockers-trc';

INSERT INTO public.publication_authors (
  publication_id,
  person_id,
  author_name,
  author_order,
  is_highlighted
)
VALUES
  ('hoa-2026-pdstsp-lockers-trc', 'alumni-hoa-thi-thu-trang', 'Thu Trang Hoa', 0, true),
  ('hoa-2026-pdstsp-lockers-trc', NULL, 'Minh Anh Nguyen', 1, true),
  ('hoa-2026-pdstsp-lockers-trc', 'ha-minh-hoang', 'Minh Hoàng Hà', 2, true),
  ('hoa-2026-pdstsp-lockers-trc', 'vu-duc-minh', 'Duc Minh Vu', 3, true)
ON CONFLICT (publication_id, author_order) DO UPDATE SET
  person_id = EXCLUDED.person_id,
  author_name = EXCLUDED.author_name,
  is_highlighted = EXCLUDED.is_highlighted;

-- Update site overview metrics in lab_overview
UPDATE public.lab_overview
SET value = '{"total_publications":55,"journal_articles":44,"q1_journals":21,"active_projects":6,"phd_msc_scholarships":6,"valedictorians":3,"student_researchers":11,"international_partner_countries":7}'
WHERE key = 'metrics';
