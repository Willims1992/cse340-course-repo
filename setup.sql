-- ========================================
-- RESET (clean setup)
--========================================
-- ========================================
-- Organization Table
-- ========================================

DROP TABLE IF EXISTS service_project_categories CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS service_projects CASCADE;
DROP TABLE IF EXISTS organizations CASCADE;

CREATE TABLE organizations (
    organization_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert Organizations
-- ========================================
INSERT INTO organizations (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure.', 'info@brightfuturebuilders.org', 'logo1.png'),
('GreenHarvest Growers', 'Urban farming and sustainability education.', 'contact@greenharvest.org', 'logo2.png'),
('UnityServe Volunteers', 'Volunteer coordination group.', 'hello@unityserve.org', 'logo3.png');

-- ========================================
-- Service Projects Table
-- ========================================


-- ========================================
-- Insert Service Projects (15 projects)
-- ========================================
INSERT INTO service_projects (organization_id, title, description, location, project_date) VALUES
(1,'Food Drive','Distribute food','Benin','2026-06-01'),
(1,'Community Cleanup','Clean environment','Lagos','2026-06-05'),
(1,'School Supplies','Donate materials','Abuja','2026-06-10'),
(1,'Health Outreach','Medical checkup','Ibadan','2026-06-15'),
(1,'Tree Planting','Environmental care','Enugu','2026-06-20'),

(2,'Youth Training','Skill development','Benin','2026-07-01'),
(2,'Water Project','Clean water','Kaduna','2026-07-05'),
(2,'Clothing Drive','Donate clothes','Kano','2026-07-10'),
(2,'Tech Workshop','Programming','Lagos','2026-07-15'),
(2,'Elder Care','Help elderly','Oyo','2026-07-20'),

(3,'Orphanage Visit','Support children','Benin','2026-08-01'),
(3,'Scholarship Program','Fund education','Uyo','2026-08-05'),
(3,'Road Safety','Raise awareness','Abuja','2026-08-10'),
(3,'Sanitation Drive','Promote hygiene','PH','2026-08-15'),
(3,'Farmer Training','Teach farming','Jos','2026-08-20');

-- ========================================
-- Categories Table
-- ========================================
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ========================================
-- Insert Categories
-- ========================================
INSERT INTO categories (name) VALUES
('Education'),
('Healthcare'),
('Environmental'),
('Community Development');

-- ========================================
-- Junction Table (Many-to-Many)
-- ========================================
CREATE TABLE service_project_categories (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES service_projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- ========================================
-- Assign EACH project at least one category ✅
-- ========================================
INSERT INTO service_project_categories (project_id, category_id) VALUES
(1,4),(2,3),(3,1),(4,2),(5,3),
(6,1),(7,3),(8,4),(9,1),(10,2),
(11,4),(12,1),(13,4),(14,3),(15,3);

-- ========================================
-- VERIFY RESULTS
-- ========================================
SELECT * FROM organizations;