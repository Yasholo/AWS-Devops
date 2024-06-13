const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { Pool } = require('pg');
const axios = require('axios');
const userRoutes = require('./routes/user');
const taskRoutes = require('./routes/task');

const app = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(cors());

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

app.use('/api', userRoutes);
app.use('/api', taskRoutes);

app.get('/api/metadata', async (req, res) => {
  try {
    const { data: instanceData } = await axios.get('http://169.254.169.254/latest/dynamic/instance-identity/document');
    const { instanceId, availabilityZone } = instanceData;
    res.json({ instanceId, availabilityZone });
  } catch (error) {
    res.status(500).send(error.message);
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
