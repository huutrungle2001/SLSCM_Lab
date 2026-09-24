INSERT INTO public.institutions (id, name, short_name, country, city, website)
VALUES (
  'warwick',
  'University of Warwick',
  'University of Warwick',
  'United Kingdom',
  'Coventry',
  'https://warwick.ac.uk'
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  short_name = EXCLUDED.short_name,
  country = EXCLUDED.country,
  city = EXCLUDED.city,
  website = EXCLUDED.website;

UPDATE public.people
SET
  affiliation_id = 'warwick',
  affiliation = 'University of Warwick',
  current_status = 'MSc student at the University of Warwick'
WHERE id = 'trung-le-huu';
