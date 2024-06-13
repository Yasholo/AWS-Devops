const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

const addTask = async (userId, task) => {
  const { rows } = await pool.query('INSERT INTO tasks (user_id, task) VALUES ($1, $2) RETURNING *', [userId, task]);
  return rows[0];
};

const getTasks = async (userId) => {
  const { rows } = await pool.query('SELECT * FROM tasks WHERE user_id = $1', [userId]);
  return rows;
};

module.exports = { addTask, getTasks };
