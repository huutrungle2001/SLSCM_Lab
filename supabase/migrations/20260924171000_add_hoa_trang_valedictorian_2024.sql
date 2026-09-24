UPDATE public.achievements
SET
  achievement = 'Valedictorian of College of Technology, Phenikaa University (2024); Appointed Research Engineer at Singapore Management University (SMU, Singapore, 2026).',
  achievement_en = 'Valedictorian of College of Technology, Phenikaa University (2024); Appointed Research Engineer at Singapore Management University (SMU, Singapore, 2026).',
  award_type = 'Research Engineer Placement & Valedictorian'
WHERE id = 'hof-hoa-thi-thu-trang';

UPDATE public.lab_overview
SET value = '{"total_publications":53,"journal_articles":42,"q1_journals":20,"active_projects":6,"phd_msc_scholarships":6,"valedictorians":3,"student_researchers":11,"international_partner_countries":7}'
WHERE key = 'metrics';
