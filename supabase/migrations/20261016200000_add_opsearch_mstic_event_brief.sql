-- Migration: Add news brief and social feed post for latest publication in OPSEARCH (2026)

INSERT INTO public.events (
  id,
  title,
  title_vi,
  event_date,
  category,
  category_vi,
  badge,
  summary,
  summary_en,
  summary_vi,
  content_en,
  content_vi,
  link,
  link_label,
  featured
)
VALUES (
  'brief-opsearch-mstic-2026',
  'SLSCM Faculty Publishes in Springer OPSEARCH on Exact Methods for Minimum Spanning Tree with Inner-Node Costs',
  'Giảng viên SLSCM Công bố Bài báo trên Tạp chí Quốc tế OPSEARCH (Springer) về Thuật toán Nhánh-Cận cho Bài toán Cây Khung Nhỏ nhất với Chi phí Nút Trong',
  '2026-09-05',
  'Scientific Breakthrough',
  'Công bố Khoa học',
  'Springer OPSEARCH',
  'MSc. Nguyen Thanh Hoang (SLSCM Lab / FDA - NEU) and collaborators have officially published an original research article in OPSEARCH (Springer), introducing novel edge-based and node-based branch-and-bound exact algorithms for the Minimum Spanning Tree with Inner-node Costs (MSTIC).',
  'MSc. Nguyen Thanh Hoang (SLSCM Lab / FDA - NEU) and collaborators have officially published an original research article in OPSEARCH (Springer), introducing novel edge-based and node-based branch-and-bound exact algorithms for the Minimum Spanning Tree with Inner-node Costs (MSTIC).',
  'ThS. Nguyễn Thành Hoàng (SLSCM Lab / Khoa KHDL&TTNT - NEU) cùng các cộng sự chính thức công bố công trình nghiên cứu trên tạp chí OPSEARCH (Springer), đề xuất hai thuật toán chính xác nhánh-cận dựa trên cạnh và dựa trên nút cho bài toán Cây khung nhỏ nhất có tính chi phí nút trong (MSTIC).',
  'We are pleased to announce that MSc. Nguyen Thanh Hoang, faculty member at the Faculty of Data Science and Artificial Intelligence (College of Technology, NEU) and researcher at SLSCM Lab, alongside collaborators Trung Bui Quoc, Minh Phan, Dung Pham Quang, and Son Nguyen Van, has published an original research article titled "Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs" in OPSEARCH (Springer).

The Minimum Spanning Tree with Inner-node Costs (MSTIC) is an NP-hard combinatorial optimization problem crucial to infrastructure planning and wireless sensor network design, where router and hub installations incur substantial fixed costs compared to transmission links. The paper establishes two new theoretical results on edge stability and optimal leaf connection to enhance pruning efficiency, developing Kruskal- and Prim-inspired branch-and-bound exact frameworks. Rigorous benchmark evaluations on 210 synthetic instances demonstrate that the proposed Prim-based algorithm achieves outstanding solution quality and exact optimality for small- to medium-scale infrastructure planning.',
  'SLSCM Lab trân trọng thông báo công trình nghiên cứu của ThS. Nguyễn Thành Hoàng (Giảng viên Khoa Khoa học Dữ liệu và Trí tuệ Nhân tạo, Trường Công nghệ, NEU) cùng các đồng tác giả Trung Bui Quoc, Minh Phan, Dung Pham Quang và Son Nguyen Van đã chính thức xuất bản trên tạp chí quốc tế OPSEARCH (Springer) với tựa đề "Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs".

Bài toán Cây khung nhỏ nhất có tính chi phí nút trong (MSTIC) là bài toán tối ưu tổ hợp NP-khó có tính ứng dụng thực tiễn cao trong thiết kế mạng viễn thông và mạng cảm biến không dây, nơi chi phí lắp đặt bộ định tuyến hay trạm trung chuyển (router/hub) lớn hơn đáng kể so với chi phí kéo dây cáp. Nghiên cứu chứng minh hai kết quả lý thuyết mới về tính ổn định của cạnh và liên kết lá tối ưu nhằm gia tăng hiệu quả cắt tỉa không gian tìm kiếm, từ đó xây dựng hai thuật toán nhánh-cận chính xác lấy cảm hứng từ thuật toán Kruskal và Prim. Thử nghiệm trên 210 bộ dữ liệu chuẩn khẳng định thuật toán đề xuất đạt nghiệm tối ưu nhanh chóng và vượt trội về độ tin cậy trong các bài toán quy hoạch hạ tầng mạng quy mô vừa và nhỏ.',
  'https://doi.org/10.1007/s12597-026-01275-y',
  'View OPSEARCH Publication',
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

DELETE FROM public.event_tags WHERE event_id = 'brief-opsearch-mstic-2026';

INSERT INTO public.event_tags (event_id, tag)
VALUES
  ('brief-opsearch-mstic-2026', 'OPSEARCH'),
  ('brief-opsearch-mstic-2026', 'Branch-and-Bound'),
  ('brief-opsearch-mstic-2026', 'Minimum Spanning Tree'),
  ('brief-opsearch-mstic-2026', 'Combinatorial Optimization'),
  ('brief-opsearch-mstic-2026', 'Springer'),
  ('brief-opsearch-mstic-2026', 'Exact Algorithms')
ON CONFLICT (event_id, tag) DO NOTHING;

-- Shift existing social posts order from 1 onwards
UPDATE public.social_posts
SET display_order = display_order + 1
WHERE display_order >= 1 AND id != 'post-opsearch-mstic-2026';

INSERT INTO public.social_posts (
  id,
  type,
  title,
  abstract,
  journal,
  paper_title,
  authors,
  organizer,
  collaboration,
  link,
  action_label,
  venue,
  display_order
)
VALUES (
  'post-opsearch-mstic-2026',
  'publication_news',
  'New OPSEARCH Publication on Minimum Spanning Tree with Inner-Node Costs',
  'Research by MSc. Nguyen Thanh Hoang (SLSCM Lab / FDA - NEU) and collaborators establishes new theoretical results on edge stability and optimal leaf connections, proposing Kruskal- and Prim-inspired branch-and-bound exact methods for the Minimum Spanning Tree with Inner-node Costs (MSTIC) problem.',
  'OPSEARCH (Springer)',
  'Edge-based and node-based branch-and-bound methods for minimum spanning tree with inner-node costs',
  '["Trung Bui Quoc", "Minh Phan", "Nguyen Thanh Hoang (NEU)", "Dung Pham Quang", "Son Nguyen Van"]'::jsonb,
  '',
  '',
  'https://doi.org/10.1007/s12597-026-01275-y',
  'Read OPSEARCH Paper',
  '',
  1
)
ON CONFLICT (id) DO UPDATE SET
  type = EXCLUDED.type,
  title = EXCLUDED.title,
  abstract = EXCLUDED.abstract,
  journal = EXCLUDED.journal,
  paper_title = EXCLUDED.paper_title,
  authors = EXCLUDED.authors,
  link = EXCLUDED.link,
  action_label = EXCLUDED.action_label,
  display_order = EXCLUDED.display_order;
