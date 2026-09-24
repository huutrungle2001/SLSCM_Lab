INSERT INTO public.people (
  id,
  name,
  name_en,
  title,
  role_badge,
  category,
  affiliation,
  affiliation_id,
  email,
  office,
  bio,
  avatar,
  status,
  display_order
)
VALUES (
  'nguyen-thanh-hoang',
  'MSc. Nguyen Thanh Hoang',
  'MSc. Nguyen Thanh Hoang',
  '',
  'FACULTY MEMBER',
  'faculty',
  '',
  'neu',
  'hoangnt@neu.edu.vn',
  'Room 1613, Building A1',
  'MSc. Nguyen Thanh Hoang is a member of the SLSCM research group at the Faculty of Data Science and Artificial Intelligence, College of Technology, National Economics University. He earned his master''s degree from Hanoi University of Science and Technology in 2021 and coaches informatics Olympiad teams for national and international competitions. His research focuses on mathematics in computer science, data structures and algorithms, combinatorial optimization, and operations research.',
  '/assets/images/people/nguyen_thanh_hoang.jpg',
  'active',
  5
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  name_en = EXCLUDED.name_en,
  title = EXCLUDED.title,
  role_badge = EXCLUDED.role_badge,
  category = EXCLUDED.category,
  affiliation = EXCLUDED.affiliation,
  affiliation_id = EXCLUDED.affiliation_id,
  email = EXCLUDED.email,
  office = EXCLUDED.office,
  bio = EXCLUDED.bio,
  avatar = EXCLUDED.avatar,
  status = EXCLUDED.status,
  display_order = EXCLUDED.display_order;

INSERT INTO public.person_research_interests (person_id, interest, order_index)
VALUES
  ('nguyen-thanh-hoang', 'Mathematics in Computer Science', 0),
  ('nguyen-thanh-hoang', 'Data Structures & Algorithms', 1),
  ('nguyen-thanh-hoang', 'Combinatorial Optimization', 2),
  ('nguyen-thanh-hoang', 'Operations Research', 3)
ON CONFLICT (person_id, interest) DO UPDATE SET
  order_index = EXCLUDED.order_index;
