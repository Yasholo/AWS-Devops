const express = require('express');
const { addTask, getTasks } = require('../models/task');
const router = express.Router();
const jwt = require('jsonwebtoken');

const authenticate = (req, res, next) => {
  const token = req.headers.authorization.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'No token, authorization denied' });
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (e) {
    res.status(400).json({ message: 'Token is not valid' });
  }
};

router.post('/tasks', authenticate, async (req, res) => {
  const { task } = req.body;
  try {
    const newTask = await addTask(req.user.id, task);
    res.json({ task: newTask });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

router.get('/tasks', authenticate, async (req, res) => {
  try {
    const tasks = await getTasks(req.user.id);
    res.json({ tasks });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

module.exports = router;
