-- ==============================================================================
-- SLSCM Lab — Authoritative SQLite Database Schema
-- Single Source of Truth (SSOT) for Content & Research Data
-- ==============================================================================

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------------------------
-- 1. INSTITUTIONS & COLLABORATING UNIVERSITIES
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS institutions (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    short_name TEXT,
    country TEXT,
    city TEXT,
    website TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------------------------
-- 2. RESEARCH PILLARS (Strategic Foundations)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS research_pillars (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    topics TEXT,          -- JSON array string: ["Topic 1", "Topic 2", ...]
    featured_venues TEXT, -- JSON array string: ["Venue 1", "Venue 2", ...]
    display_order INTEGER DEFAULT 0,
    status TEXT DEFAULT 'active'
);

-- ------------------------------------------------------------------------------
-- 3. PEOPLE (Faculty, Researchers, Alumni, Tech Leads)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS people (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    name_en TEXT,
    title TEXT,
    role_badge TEXT,
    category TEXT NOT NULL, -- 'faculty', 'web_tech_lead', 'student_researcher', 'alumni'
    affiliation TEXT,
    affiliation_id TEXT REFERENCES institutions(id),
    email TEXT,
    office TEXT,
    bio TEXT,
    avatar TEXT,
    major TEXT,
    current_status TEXT,
    status TEXT DEFAULT 'active',
    display_order INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS person_research_interests (
    person_id TEXT NOT NULL REFERENCES people(id) ON DELETE CASCADE,
    interest TEXT NOT NULL,
    order_index INTEGER DEFAULT 0,
    PRIMARY KEY (person_id, interest)
);

CREATE TABLE IF NOT EXISTS person_featured_publications (
    person_id TEXT NOT NULL REFERENCES people(id) ON DELETE CASCADE,
    publication_title TEXT NOT NULL,
    order_index INTEGER DEFAULT 0,
    PRIMARY KEY (person_id, publication_title)
);

-- ------------------------------------------------------------------------------
-- 4. PUBLICATIONS (Journals, Conferences, Book Chapters)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS publications (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL,
    venue TEXT NOT NULL,
    type TEXT NOT NULL,
    doi TEXT,
    link TEXT,
    abstract TEXT,
    abstract_source TEXT, -- DOI/publisher URL for a verified author-written abstract
    bibtex TEXT,
    research_pillar TEXT, -- legacy taxonomy: operational_optimization, ml_optimization, green_transportation
    primary_pillar_id TEXT REFERENCES research_pillars(id),
    keywords TEXT, -- JSON array of controlled research keyword IDs
    is_featured BOOLEAN DEFAULT 0,
    badge TEXT,
    status TEXT DEFAULT 'published',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS publication_authors (
    publication_id TEXT NOT NULL REFERENCES publications(id) ON DELETE CASCADE,
    person_id TEXT REFERENCES people(id),
    author_name TEXT NOT NULL,
    author_order INTEGER NOT NULL,
    is_highlighted BOOLEAN DEFAULT 0,
    PRIMARY KEY (publication_id, author_order)
);

-- ------------------------------------------------------------------------------
-- 5. RESEARCH PROJECTS & GRANTS
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS projects (
    id TEXT PRIMARY KEY,
    title_en TEXT NOT NULL,
    title_vi TEXT,
    category TEXT NOT NULL,
    category_en TEXT,
    sponsor TEXT,
    grant_code TEXT,
    period TEXT,
    status TEXT DEFAULT 'Active',
    research_domain TEXT,
    collaboration TEXT,
    description_en TEXT NOT NULL,
    description_vi TEXT,
    methodology TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS project_leads (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    person_id TEXT REFERENCES people(id),
    name TEXT NOT NULL,
    email TEXT,
    role TEXT,
    affiliation TEXT,
    order_index INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS project_publications (
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    publication_id TEXT NOT NULL REFERENCES publications(id) ON DELETE CASCADE,
    display_order INTEGER DEFAULT 0,
    PRIMARY KEY (project_id, publication_id)
);

CREATE TABLE IF NOT EXISTS project_outcomes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    outcome_en TEXT NOT NULL,
    outcome_vi TEXT,
    order_index INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS project_tags (
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    PRIMARY KEY (project_id, tag)
);

CREATE TABLE IF NOT EXISTS project_pillars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    pillar TEXT NOT NULL,
    description_en TEXT,
    description_vi TEXT
);

CREATE TABLE IF NOT EXISTS project_curriculum (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    module_en TEXT,
    module_vi TEXT NOT NULL,
    content_vi TEXT NOT NULL,
    order_index INTEGER DEFAULT 0
);

-- ------------------------------------------------------------------------------
-- 6. SEMINARS & ACADEMIC COLLOQUIA
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS seminars (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    title_vi TEXT,
    speaker TEXT NOT NULL,
    speaker_person_id TEXT REFERENCES people(id),
    speaker_role TEXT,
    affiliation TEXT NOT NULL,
    affiliation_id TEXT REFERENCES institutions(id),
    date TEXT NOT NULL,
    time TEXT,
    venue TEXT NOT NULL,
    venue_type TEXT NOT NULL, -- 'In-Person', 'Online', 'Hybrid'
    status TEXT DEFAULT 'Archived', -- 'Upcoming', 'Archived'
    category TEXT,
    track TEXT,
    abstract TEXT NOT NULL,
    abstract_en TEXT,
    related_paper_id TEXT,
    related_project_id TEXT,
    slides_available BOOLEAN DEFAULT 0,
    recording_available BOOLEAN DEFAULT 0,
    slides_url TEXT,
    recording_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS seminar_topics (
    seminar_id TEXT NOT NULL REFERENCES seminars(id) ON DELETE CASCADE,
    topic TEXT NOT NULL,
    PRIMARY KEY (seminar_id, topic)
);

-- ------------------------------------------------------------------------------
-- 7. EVENTS & NEWS BRIEFS
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS events (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    title_vi TEXT,
    event_date TEXT NOT NULL,
    category TEXT NOT NULL,
    category_vi TEXT,
    badge TEXT,
    summary TEXT NOT NULL,
    summary_en TEXT,
    summary_vi TEXT,
    content_en TEXT,
    content_vi TEXT,
    link TEXT,
    link_label TEXT,
    featured BOOLEAN DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS event_tags (
    event_id TEXT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
    tag TEXT NOT NULL,
    PRIMARY KEY (event_id, tag)
);

-- ------------------------------------------------------------------------------
-- 8. ACHIEVEMENTS & HALL OF FAME
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS achievements (
    id TEXT PRIMARY KEY,
    person_id TEXT REFERENCES people(id),
    name TEXT NOT NULL,
    name_en TEXT,
    avatar TEXT,
    achievement TEXT NOT NULL,
    achievement_en TEXT,
    destination_institution TEXT NOT NULL,
    institution_id TEXT REFERENCES institutions(id),
    country TEXT NOT NULL,
    year INTEGER NOT NULL,
    award_type TEXT,
    field TEXT,
    former_background_en TEXT,
    advisors TEXT,
    featured BOOLEAN DEFAULT 0,
    display_order INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------------------------
-- 9. GLOBAL ACADEMIC PARTNERS
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS global_academic_partners (
    id TEXT PRIMARY KEY,
    institution TEXT NOT NULL,
    institution_id TEXT REFERENCES institutions(id),
    country TEXT NOT NULL,
    key_collaborators TEXT DEFAULT '',
    research_focus TEXT DEFAULT '',
    order_index INTEGER DEFAULT 0
);

-- ------------------------------------------------------------------------------
-- 10. SOCIAL POSTS (Facebook Fanpage Feed)
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS social_posts (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,
    title TEXT NOT NULL,
    abstract TEXT,
    journal TEXT,
    paper_title TEXT,
    authors TEXT, -- JSON array
    organizer TEXT,
    collaboration TEXT,
    link TEXT,
    action_label TEXT,
    venue TEXT,
    display_order INTEGER DEFAULT 0
);

-- ------------------------------------------------------------------------------
-- 11. LAB OVERVIEW & METADATA
-- ------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS lab_overview (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);
