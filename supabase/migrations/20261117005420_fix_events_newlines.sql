-- Fix literal \n escape sequences in events content and summary
UPDATE public.events
SET
  content_en = replace(replace(content_en, E'\r\n', E'\n'), E'\\n', E'\n'),
  content_vi = replace(replace(content_vi, E'\r\n', E'\n'), E'\\n', E'\n'),
  summary = replace(replace(summary, E'\r\n', E'\n'), E'\\n', E'\n'),
  summary_en = replace(replace(summary_en, E'\r\n', E'\n'), E'\\n', E'\n'),
  summary_vi = replace(replace(summary_vi, E'\r\n', E'\n'), E'\\n', E'\n')
WHERE id IN ('brief-rivf-2026-vinuni', 'brief-soict-2026-vpi');
