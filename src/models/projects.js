import db from './db.js';

const getAllProjects = async () => {
  const result = await db.query(`
    SELECT project_id, organization_id, title, description, location, project_date
    FROM service_projects;
  `);


  //  THIS LINE SHOWS ROW COUNT
  console.log("Projects row count:", result.rowCount);


  return result.rows;
};

export { getAllProjects };
