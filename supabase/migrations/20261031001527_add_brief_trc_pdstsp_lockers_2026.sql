-- Add Event Brief: New Paper on Parallel Drone Scheduling TSP with Lockers Accepted in Transportation Research Part C
INSERT INTO public.events (
  id, title, title_vi, event_date, category, category_vi, badge,
  summary, summary_en, summary_vi, content_en, content_vi, link, link_label, featured
)
VALUES (
  'brief-trc-pdstsp-lockers-2026',
  'New Paper on Parallel Drone Scheduling TSP with Lockers Accepted in Transportation Research Part C',
  'Chúc Mừng Bài Báo của Nguyễn Minh Anh và Hoa Thị Thu Trang được Chấp Nhận Đăng tại Tạp Chí Q1 Transportation Research Part C',
  '2026-10-30',
  'Scientific Breakthrough',
  'Công bố Khoa học',
  'TRC (SCIE Q1)',
  'SLSCM Lab warmly congratulates alumni researchers Minh Anh Nguyen (Singapore Management University - SMU) and Thu Trang Hoa (SMU) on the acceptance of their original research paper ''The parallel drone scheduling traveling salesman problem with lockers'' in Transportation Research Part C: Emerging Technologies (SCIE Q1).',
  'SLSCM Lab warmly congratulates alumni researchers Minh Anh Nguyen (Singapore Management University - SMU) and Thu Trang Hoa (SMU) on the acceptance of their original research paper ''The parallel drone scheduling traveling salesman problem with lockers'' in Transportation Research Part C: Emerging Technologies (SCIE Q1).',
  'SLSCM Lab trân trọng chúc mừng các nhà nghiên cứu và cựu thành viên Nguyễn Minh Anh (SMU) và Hoa Thị Thu Trang (SMU) với công trình ''The parallel drone scheduling traveling salesman problem with lockers'' chính thức được chấp nhận đăng tại tạp chí hàng đầu Transportation Research Part C: Emerging Technologies (SCIE Q1).',
  'We are delighted to celebrate another landmark scholarly achievement from SLSCM Lab alumni and collaborators. The research paper entitled ''The parallel drone scheduling traveling salesman problem with lockers'' (Manuscript No. TRC-25-02161R1), authored by Minh Anh Nguyen (Singapore Management University - SMU) and Thu Trang Hoa (SMU), has been officially accepted for publication in Transportation Research Part C: Emerging Technologies (Elsevier, SCIE, Q1, Top Journal in Transportation & Logistics Optimization).\n\nThe research addresses the Parallel Drone Scheduling Traveling Salesman Problem with Lockers (PDSTSP-L), advancing hybrid last-mile delivery paradigms by integrating automated parcel lockers into synchronized truck-drone routing operations. By allowing automated delivery lockers to serve as intermediate transfer hubs, package drop-off nodes, and drone battery swapping stations, the proposed mathematical models and algorithmic frameworks overcome the endurance and payload limitations of standard drone routing, significantly reducing delivery makespan and logistical operating costs in dense urban areas.\n\nThis milestone demonstrates the international impact, high academic rigor, and global research continuum fostered by SLSCM Lab, connecting talented Vietnamese scholars at top global institutions such as Singapore Management University (SMU).',
  'SLSCM Lab (Lab Quản trị Logistics và Chuỗi cung ứng thông minh, Trường Công nghệ - Đại học Kinh tế Quốc dân) trân trọng chúc mừng các nhà nghiên cứu và cựu thành viên lab Nguyễn Minh Anh (Singapore Management University - SMU) và Hoa Thị Thu Trang (SMU) với công trình nghiên cứu mang mã số TRC-25-02161R1: ''The parallel drone scheduling traveling salesman problem with lockers'' đã chính thức được chấp nhận đăng tại tạp chí khoa học quốc tế uy tín bậc nhất Transportation Research Part C: Emerging Technologies (Elsevier, SCIE Q1, Tạp chí đầu ngành về Tối ưu hóa Giao thông và Logistics).\n\nBài toán Định tuyến Drone song song kết hợp Tủ giao hàng thông minh (Parallel Drone Scheduling Traveling Salesman Problem with Lockers - PDSTSP-L) là bước đột phá mới trong tối ưu hóa giao hàng chặng cuối (last-mile delivery). Bằng việc tích hợp mạng lưới tủ gửi nhận thông minh (smart parcel lockers) làm các điểm dừng trung chuyển và trạm sạc pin linh hoạt song song với lộ trình xe tải và drone, nhóm nghiên cứu đã xây dựng các mô hình tối ưu toán học và giải thuật tiên tiến giúp giải quyết triệt để rào cản về dung lượng pin và bán kính hoạt động của drone, từ đó tối ưu hóa đáng kể tổng thời gian hoàn thành (makespan) và chi phí vận hành logistics đô thị.\n\nThành công này tiếp tục khẳng định chất lượng học thuật đỉnh cao và mạng lưới hợp tác nghiên cứu quốc tế bền chặt của SLSCM Lab cùng các nhà khoa học trẻ tại các viện trường danh tiếng toàn cầu như Singapore Management University (SMU).',
  'https://www.facebook.com/share/p/1EagNq9HKE/',
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

DELETE FROM public.event_tags WHERE event_id = 'brief-trc-pdstsp-lockers-2026';

INSERT INTO public.event_tags (event_id, tag)
VALUES
  ('brief-trc-pdstsp-lockers-2026', 'Transportation Research Part C'),
  ('brief-trc-pdstsp-lockers-2026', 'Drone Routing'),
  ('brief-trc-pdstsp-lockers-2026', 'PDSTSP'),
  ('brief-trc-pdstsp-lockers-2026', 'Smart Lockers'),
  ('brief-trc-pdstsp-lockers-2026', 'SMU'),
  ('brief-trc-pdstsp-lockers-2026', 'SCIE Q1'),
  ('brief-trc-pdstsp-lockers-2026', 'Last-Mile Logistics')
ON CONFLICT (event_id, tag) DO NOTHING;
