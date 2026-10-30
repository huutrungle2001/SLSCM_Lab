-- Add Social Post for TRC Paper Acceptance
UPDATE public.social_posts SET display_order = display_order + 1 WHERE id != 'post-trc-pdstsp-lockers-2026';

INSERT INTO public.social_posts (
  id, type, title, paper_title, authors, journal, link, action_label, abstract, display_order
) VALUES (
  'post-trc-pdstsp-lockers-2026',
  'publication_news',
  'Paper Accepted in Transportation Research Part C (TRC)',
  'The parallel drone scheduling traveling salesman problem with lockers',
  '["Minh Anh Nguyen (SMU)", "Thu Trang Hoa (SMU)"]'::jsonb,
  'Transportation Research Part C: Emerging Technologies',
  'https://www.facebook.com/share/p/1EagNq9HKE/',
  'View Facebook Post',
  'SLSCM Lab warmly congratulates researchers Minh Anh Nguyen (Singapore Management University - SMU) and Thu Trang Hoa (SMU) on their accepted paper in Transportation Research Part C: Emerging Technologies (SCIE Q1) on the Parallel Drone Scheduling Traveling Salesman Problem with Lockers.',
  0
)
ON CONFLICT (id) DO UPDATE SET
  type = EXCLUDED.type,
  title = EXCLUDED.title,
  paper_title = EXCLUDED.paper_title,
  authors = EXCLUDED.authors,
  journal = EXCLUDED.journal,
  link = EXCLUDED.link,
  action_label = EXCLUDED.action_label,
  abstract = EXCLUDED.abstract,
  display_order = EXCLUDED.display_order;
