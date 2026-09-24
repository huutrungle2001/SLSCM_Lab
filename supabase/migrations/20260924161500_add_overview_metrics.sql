-- Required homepage metrics now live in Supabase with the rest of the site content.
INSERT INTO public.lab_overview (key, value)
VALUES (
  'metrics',
  '{"total_publications":53,"journal_articles":42,"q1_journals":20,"active_projects":6,"phd_msc_scholarships":6,"valedictorians":2,"student_researchers":11,"international_partner_countries":7}'
)
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;
