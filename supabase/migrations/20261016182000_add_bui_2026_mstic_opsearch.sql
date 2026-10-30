-- Add publication: Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs (OPSEARCH 2026)

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
  'bui-2026-mstic-opsearch',
  'Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs',
  2026,
  'OPSEARCH',
  'Journal',
  '10.1007/s12597-026-01275-y',
  'https://doi.org/10.1007/s12597-026-01275-y',
  'The Minimum Spanning Tree with Inner-node Costs (MSTIC) is an important variant of the classic spanning tree problem that incorporates both edge weights and costs for non-leaf nodes into the objective function. This problem is particularly relevant to real-world applications, such as network design and wireless sensor networks, where routers or hubs incur significantly higher installation costs compared to cables. The problem has been proven NP-hard and has primarily been addressed through approximation algorithms. In this paper, we propose two exact algorithms: an edge-based approach inspired by Kruskal’s algorithm and a node-based approach inspired by Prim’s algorithm. Two new theoretical results on edge stability and optimal leaf connection are established to improve pruning efficiency. Computational experiments on 210 synthetic benchmark instances with up to 100 nodes indicate that our algorithms can find optimal solutions in a short time for instances up to 40 nodes. The Prim-based algorithm achieves better performance than the Kruskal-based algorithm in terms of both solution quality and pruning efficiency. These algorithms are well-suited for decision-support systems that require exact optimal solutions in small- to medium-scale infrastructure planning.',
  'https://link.springer.com/article/10.1007/s12597-026-01275-y',
  '@article{Bui2026MST,
  title = {Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs},
  author = {Trung Bui Quoc and Minh Phan and Hoang Nguyen Thanh and Dung Pham Quang and Son Nguyen Van},
  journal = {OPSEARCH},
  year = {2026},
  doi = {10.1007/s12597-026-01275-y},
  url = {https://doi.org/10.1007/s12597-026-01275-y}
}',
  'operational_optimization',
  'supply_chain_optimization',
  '["minimum-spanning-tree", "branch-and-bound", "inner-node-costs", "exact-algorithms", "network-design"]'::jsonb,
  false,
  NULL,
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

DELETE FROM public.publication_authors WHERE publication_id = 'bui-2026-mstic-opsearch';

INSERT INTO public.publication_authors (
  publication_id,
  person_id,
  author_name,
  author_order,
  is_highlighted
)
VALUES
  ('bui-2026-mstic-opsearch', NULL, 'Trung Bui Quoc', 0, false),
  ('bui-2026-mstic-opsearch', NULL, 'Minh Phan', 1, false),
  ('bui-2026-mstic-opsearch', 'nguyen-thanh-hoang', 'Hoang Nguyen Thanh', 2, true),
  ('bui-2026-mstic-opsearch', NULL, 'Dung Pham Quang', 3, false),
  ('bui-2026-mstic-opsearch', NULL, 'Son Nguyen Van', 4, false)
ON CONFLICT (publication_id, author_order) DO UPDATE SET
  person_id = EXCLUDED.person_id,
  author_name = EXCLUDED.author_name,
  is_highlighted = EXCLUDED.is_highlighted;

-- Update site overview metrics in lab_overview
UPDATE public.lab_overview
SET value = '{"total_publications":54,"journal_articles":43,"q1_journals":20,"active_projects":6,"phd_msc_scholarships":6,"valedictorians":3,"student_researchers":11,"international_partner_countries":7}'
WHERE key = 'metrics';
