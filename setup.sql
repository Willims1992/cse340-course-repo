-- ========================================
-- RESET (important for clean setup)
-- ========================================
DROP TABLE IF EXISTS service_projects;
DROP TABLE IF EXISTS organizations;

-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organizations (
    organization_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organizations (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Service Projects Table
-- ========================================
DROP TABLE IF EXISTS ServiceProjects;

CREATE TABLE ServiceProjects (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organizations(organization_id)
);


-- Organization 1 Projects
INSERT INTO ServiceProjects (organization_id, title, description, location, project_date) VALUES
(1, 'Beach Cleanup', 'Cleaning plastic waste from the beach.', 'Lagos Beach', '2026-06-10'),
(1, 'Tree Planting', 'Planting trees to combat deforestation.', 'Abuja Park', '2026-06-15'),
(1, 'Food Drive', 'Distributing food to the homeless.', 'Ikeja', '2026-06-20'),
(1, 'School Renovation', 'Renovating classrooms in public schools.', 'Surulere', '2026-07-01'),
(1, 'Health Awareness Campaign', 'Educating community on healthy living.', 'Yaba', '2026-07-05');

-- Organization 2 Projects
INSERT INTO ServiceProjects (organization_id, title, description, location, project_date) VALUES
(2, 'Blood Donation Drive', 'Encouraging blood donation.', 'Uyo General Hospital', '2026-06-12'),
(2, 'Orphanage Visit', 'Providing supplies to orphanage homes.', 'Calabar', '2026-06-18'),
(2, 'Free Medical Checkup', 'Offering free health screening.', 'Port Harcourt', '2026-06-25'),
(2, 'Youth Empowerment Seminar', 'Teaching skills to youths.', 'Enugu', '2026-07-02'),
(2, 'Clothing Donation', 'Donating clothes to disadvantaged people.', 'Owerri', '2026-07-08');

-- Organization 3 Projects
INSERT INTO ServiceProjects (organization_id, title, description, location, project_date) VALUES
(3, 'Road Cleanup', 'Clearing debris from major roads.', 'Benin City', '2026-06-11'),
(3, 'Community Sports Day', 'Organizing sports events.', 'Ibadan', '2026-06-17'),
(3, 'Literacy Program', 'Teaching basic reading skills.', 'Kaduna', '2026-06-23'),
(3, 'Women Empowerment Workshop', 'Skills training for women.', 'Jos', '2026-07-03'),
(3, 'Water Sanitation Project', 'Improving clean water access.', 'Kano', '2026-07-09');

-- ========================================
-- Insert Service Projects
-- ========================================
INSERT INTO service_projects (organization_id, title, description, location, date)
VALUES
(1, 'Food Drive', 'Collect and distribute food', 'Benin City', '2026-06-01'),
(1, 'Community Cleanup', 'Clean environment', 'Lagos', '2026-06-05'),
(1, 'School Supplies Donation', 'Donate materials', 'Abuja', '2026-06-10'),
(1, 'Health Outreach', 'Free medical checkup', 'Ibadan', '2026-06-15'),
(1, 'Tree Planting', 'Environmental care', 'Enugu', '2026-06-20'),

(2, 'Youth Training', 'Skill development', 'Benin City', '2026-07-01'),
(2, 'Water Project', 'Provide clean water', 'Kaduna', '2026-07-05'),
(2, 'Clothing Drive', 'Give clothes', 'Kano', '2026-07-10'),
(2, 'Tech Workshop', 'Programming basics', 'Lagos', '2026-07-15'),
(2, 'Elder Care', 'Visit elderly', 'Oyo', '2026-07-20'),

(3, 'Orphanage Visit', 'Support children', 'Benin City', '2026-08-01'),
(3, 'Scholarship Program', 'Fund education', 'Uyo', '2026-08-05'),
(3, 'Road Safety Campaign', 'Raise awareness', 'Abuja', '2026-08-10'),
(3, 'Sanitation Drive', 'Promote hygiene', 'Port Harcourt', '2026-08-15'),
(3, 'Farmer Training', 'Teach agriculture', 'Jos', '2026-08-20');

-- ========================================
-- Verify
-- ========================================
SELECT * FROM service_projects;

