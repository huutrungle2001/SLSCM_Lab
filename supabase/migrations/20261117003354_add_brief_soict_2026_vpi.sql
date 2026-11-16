-- Add Event Brief: Research Paper Accepted at SOICT 2026: Collaboration Between SLSCM Lab, Vietnam Petroleum Institute (VPI), and NEU Students
INSERT INTO public.events (
  id, title, title_vi, event_date, category, category_vi, badge,
  summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured
)
VALUES (
  'brief-soict-2026-vpi',
  'Research Paper Accepted at SOICT 2026: Collaboration Between SLSCM Lab, Vietnam Petroleum Institute (VPI), and NEU Students',
  'Công Trình Nghiên Cứu Được Chấp Nhận Công Bố Tại SOICT 2026: Hợp Tác Giữa SLSCM Lab, Viện Dầu Khí (VPI) và Sinh Viên NEU',
  '2026-10-21',
  'Research Collaboration',
  'Hợp tác Nghiên cứu & Dự án',
  'SOICT 2026 & VPI',
  'A collaborative research study between SLSCM Lab, domain specialists at the Vietnam Petroleum Institute (VPI), and NEU student researchers through VPI internships has been accepted for publication and presentation at SOICT 2026.',
  'A collaborative research study between SLSCM Lab, domain specialists at the Vietnam Petroleum Institute (VPI), and NEU student researchers through VPI internships has been accepted for publication and presentation at SOICT 2026.',
  'Một kết quả nghiên cứu trong khuôn khổ hợp tác giữa SLSCM Lab với các chuyên gia của Viện Dầu khí Việt Nam (VPI) và các bạn sinh viên NEU thông qua chương trình thực tập nghiên cứu tại VPI đã chính thức được chấp nhận công bố tại Hội thảo Quốc tế SOICT 2026.',
  'SLSCM Lab is delighted to announce that an applied research paper has been officially accepted for publication and presentation at the International Symposium on Information and Communication Technology (SOICT 2026).\n\nThis research is the direct outcome of successful collaborative efforts between SLSCM Lab, industry domain experts from the Vietnam Petroleum Institute (VPI), and talented undergraduate researchers from the National Economics University (NEU) through dedicated research internship programs at VPI.\n\nLooking forward, SLSCM Lab and VPI will continue to deepen this strategic partnership by implementing joint projects and research initiatives on supply chain optimization, logistics network design, inventory management, and mathematical programming to tackle critical real-world industry challenges faced by the energy and petroleum sectors.',
  'Lab Quản trị Logistics và Chuỗi cung ứng thông minh (SLSCM Lab, Trường Công nghệ – Đại học Kinh tế Quốc dân) trân trọng thông báo: 1 kết quả nghiên cứu đã chính thức được chấp nhận công bố tại Hội thảo Quốc tế về Công nghệ Thông tin và Truyền thông (SOICT 2026).\n\nCông trình là kết quả từ sự hợp tác chặt chẽ giữa các nhà nghiên cứu của SLSCM Lab, các chuyên gia giàu kinh nghiệm của Viện Dầu khí Việt Nam (VPI) cùng các bạn sinh viên NEU thông qua các chương trình thực tập nghiên cứu thực tế tại VPI.\n\nKỳ vọng trong thời gian tới, SLSCM Lab và Viện Dầu khí (VPI) sẽ tiếp tục mở rộng hợp tác, triển khai các dự án nghiên cứu ứng dụng tiếp theo về tối ưu hóa chuỗi cung ứng, thiết kế mạng lưới phân phối, quản lý vận hành kho bãi và logistics thông minh nhằm giải quyết triệt để các bài toán thực tiễn phức tạp của ngành năng lượng và dầu khí.',
  'https://www.facebook.com/share/p/1Fr3HmET2p/',
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

DELETE FROM public.event_tags WHERE event_id = 'brief-soict-2026-vpi';

INSERT INTO public.event_tags (event_id, tag)
VALUES
  ('brief-soict-2026-vpi', 'SOICT 2026'),
  ('brief-soict-2026-vpi', 'VPI'),
  ('brief-soict-2026-vpi', 'Internship'),
  ('brief-soict-2026-vpi', 'Supply Chain'),
  ('brief-soict-2026-vpi', 'Network Design'),
  ('brief-soict-2026-vpi', 'Warehouse Management')
ON CONFLICT (event_id, tag) DO NOTHING;
