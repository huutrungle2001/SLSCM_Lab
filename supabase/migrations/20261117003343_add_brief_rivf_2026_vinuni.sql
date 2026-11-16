-- Add Event Brief: SLSCM Lab Research Accepted for Presentation at IEEE RIVF 2026 at VinUniversity
INSERT INTO public.events (
  id, title, title_vi, event_date, category, category_vi, badge,
  summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured
)
VALUES (
  'brief-rivf-2026-vinuni',
  'SLSCM Lab Research Accepted for Presentation at IEEE RIVF 2026 at VinUniversity',
  'Nghiên Cứu của SLSCM Lab Được Chấp Nhận Báo Cáo tại Hội Thảo Quốc Tế IEEE RIVF 2026 tại VinUni',
  '2026-10-27',
  'Scientific Breakthrough',
  'Công bố & Báo cáo Khoa học',
  'RIVF 2026',
  'SLSCM Lab is pleased to announce that an original research study from the lab has been officially accepted for presentation at the 20th IEEE RIVF International Conference on Computing and Communication Technologies (RIVF 2026), hosted at VinUniversity.',
  'SLSCM Lab is pleased to announce that an original research study from the lab has been officially accepted for presentation at the 20th IEEE RIVF International Conference on Computing and Communication Technologies (RIVF 2026), hosted at VinUniversity.',
  'Lab Quản trị Logistics và Chuỗi cung ứng thông minh (SLSCM Lab) trân trọng thông báo một công trình nghiên cứu của Lab đã chính thức được chấp nhận trình bày tại Hội thảo Khoa học Quốc tế IEEE RIVF 2026 lần thứ 20, được đăng cai tổ chức tại Trường Đại học VinUni.',
  'SLSCM Lab (School of Technology, National Economics University - NEU) is proud to announce that our research has been officially accepted for oral presentation at the 20th IEEE International Conference on Computing and Communication Technologies (RIVF 2026), hosted at VinUniversity (VinUni), Hanoi, Vietnam.\n\nRIVF is a prestigious, long-standing IEEE-sponsored international conference that brings together leading researchers, academicians, and practitioners from Vietnam and across the globe to share breakthrough advances in computing, algorithms, optimization, communications, and intelligent systems.\n\nThis acceptance reflects SLSCM Lab''s sustained dedication to advancing cutting-edge research methodologies and bridging the gap between mathematical optimization, intelligent algorithms, and real-world computational challenges.',
  'Lab Quản trị Logistics và Chuỗi cung ứng thông minh (SLSCM Lab, Trường Công nghệ – Đại học Kinh tế Quốc dân - NEU) trân trọng thông báo: Một kết quả nghiên cứu của Lab đã chính thức được chấp nhận trình bày tại Hội thảo Khoa học Quốc tế về Công nghệ Tính toán và Truyền thông lần thứ 20 (IEEE RIVF 2026), được đăng cai tổ chức tại Trường Đại học VinUni (VinUniversity), Hà Nội.\n\nRIVF là hội thảo khoa học quốc tế uy tín do IEEE bảo trợ kỹ thuật, quy tụ các nhà khoa học, chuyên gia và học giả hàng đầu trong nước và quốc tế nhằm chia sẻ những tiến bộ đột phá trong các lĩnh vực khoa học máy tính, tối ưu hóa toán học, giải thuật và hệ thống thông minh.\n\nThành tích này tiếp tục khẳng định định hướng nghiên cứu chuyên sâu, nỗ lực học thuật bền bỉ của các giảng viên, nhà nghiên cứu và sinh viên SLSCM Lab trên con đường hội nhập học thuật quốc tế.',
  'https://www.facebook.com/share/p/1514NW4E6bm/',
  'View Facebook Announcement',
  true
)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  title_vi = EXCLUDED.title_vi,
  event_date = EXCLUDED.event_date,
  category = EXCLUDED.category,
  category_vi = EXCLUDED.category_vi,
  badge = EXCLUDED.badge,
  summary = EXCLUDED.summary,
  summary_en = EXCLUDED.summary_en,
  summary_vi = EXCLUDED.summary_vi,
  content_en = EXCLUDED.content_en,
  content_vi = EXCLUDED.content_vi,
  link = EXCLUDED.link,
  link_label = EXCLUDED.link_label,
  featured = EXCLUDED.featured;

DELETE FROM public.event_tags WHERE event_id = 'brief-rivf-2026-vinuni';

INSERT INTO public.event_tags (event_id, tag)
VALUES
  ('brief-rivf-2026-vinuni', 'RIVF 2026'),
  ('brief-rivf-2026-vinuni', 'VinUni'),
  ('brief-rivf-2026-vinuni', 'IEEE'),
  ('brief-rivf-2026-vinuni', 'Conference Presentation'),
  ('brief-rivf-2026-vinuni', 'SLSCM')
ON CONFLICT (event_id, tag) DO NOTHING;
