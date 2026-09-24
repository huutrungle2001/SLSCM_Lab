-- Keep Supabase as the sole runtime content source for the public website.

INSERT INTO public.institutions (id, name, short_name, country, city, website)
VALUES (
  'vnu-uet',
  'VNU University of Engineering and Technology',
  'VNU-UET',
  'Vietnam',
  'Hanoi',
  'https://uet.vnu.edu.vn'
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  short_name = EXCLUDED.short_name,
  country = EXCLUDED.country,
  city = EXCLUDED.city,
  website = EXCLUDED.website;

UPDATE public.people
SET affiliation_id = 'hust', affiliation = 'Hanoi University of Science and Technology'
WHERE id = 'mai-thanh-tien';

UPDATE public.people
SET affiliation_id = 'vnu-uet', affiliation = 'VNU University of Engineering and Technology'
WHERE id = 'student-11-tuan-anh-tran';

UPDATE public.people
SET major = 'Artificial Intelligence'
WHERE id = 'student-10-phung-thi-thu-trang';

INSERT INTO public.publications (
  id, title, year, venue, type, doi, link, abstract, abstract_source,
  research_pillar, primary_pillar_id, keywords, is_featured, badge, status
)
VALUES
  (
    'topic-only-dinh-2025-inventory-routing-matheuristics',
    'Matheuristic Algorithms for the Inventory Routing Problem With Unsplit and Split Deliveries',
    2025,
    'Networks, 86(1), 57–70',
    'Journal',
    '10.1002/net.22276',
    'https://doi.org/10.1002/net.22276',
    'We introduce new matheuristic algorithms for the Inventory Routing Problem with unsplit and split deliveries for both Order-Up-to Level and Maximum Level replenishment policies. The first matheuristic is based on the Capacitated Concentrator Location problem. The second is a route-based approach using routes found in other schemes as input, including the ones found in the first matheuristic. We carry out extensive experiments on benchmark instances to understand their effectiveness. The results show that they are effective and require a relatively short computational time.',
    'https://onlinelibrary.wiley.com/doi/full/10.1002/net.22276',
    'operational_optimization',
    'supply_chain_optimization',
    '["inventory-routing", "vehicle-routing", "supply-chain-networks", "metaheuristics"]'::jsonb,
    false,
    'Topic research',
    'topic_only'
  ),
  (
    'topic-only-dinh-2023-inventory-routing-split-deliveries',
    'The inventory routing problem with split deliveries',
    2023,
    'Networks, 82(4), 400–413',
    'Journal',
    '10.1002/net.22175',
    'https://doi.org/10.1002/net.22175',
    'We study the benefit of introducing split deliveries in the inventory routing problem (IRP), both when the order-up-to level (OU) and the maximum level replenishment policies are applied. We first propose a mathematical formulation and solve it by implementing a branch-and-cut algorithm. Then, we carry out a worst-case analysis to show the cost increase we have in the worst case by using unsplit deliveries instead of split deliveries, both for the OU and the maximum-level replenishment policies. Extensive computational results on benchmark instances allow us to evaluate the benefit of introducing split deliveries. Finally, a sensitivity analysis on customer demands, initial inventory levels, maximum inventory levels and distance to the depot allows us to understand the instance features that make split deliveries effective in IRPs.',
    'https://onlinelibrary.wiley.com/doi/full/10.1002/net.22175',
    'operational_optimization',
    'supply_chain_optimization',
    '["inventory-routing", "vehicle-routing", "supply-chain-networks", "branch-and-cut", "exact-optimization"]'::jsonb,
    false,
    'Topic research',
    'topic_only'
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
  research_pillar = EXCLUDED.research_pillar,
  primary_pillar_id = EXCLUDED.primary_pillar_id,
  keywords = EXCLUDED.keywords,
  is_featured = EXCLUDED.is_featured,
  badge = EXCLUDED.badge,
  status = EXCLUDED.status;

INSERT INTO public.publication_authors
  (publication_id, person_id, author_name, author_order, is_highlighted)
VALUES
  ('topic-only-dinh-2025-inventory-routing-matheuristics', 'dinh-nho-minh', 'Nho Minh Dinh', 1, true),
  ('topic-only-dinh-2025-inventory-routing-matheuristics', NULL, 'Claudia Archetti', 2, false),
  ('topic-only-dinh-2025-inventory-routing-matheuristics', NULL, 'Luca Bertazzi', 3, false),
  ('topic-only-dinh-2023-inventory-routing-split-deliveries', 'dinh-nho-minh', 'Nho Minh Dinh', 1, true),
  ('topic-only-dinh-2023-inventory-routing-split-deliveries', NULL, 'Claudia Archetti', 2, false),
  ('topic-only-dinh-2023-inventory-routing-split-deliveries', NULL, 'Luca Bertazzi', 3, false)
ON CONFLICT (publication_id, author_order) DO UPDATE SET
  person_id = EXCLUDED.person_id,
  author_name = EXCLUDED.author_name,
  is_highlighted = EXCLUDED.is_highlighted;
