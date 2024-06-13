import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Tasks = () => {
  const [tasks, setTasks] = useState([]);
  const [task, setTask] = useState('');

  useEffect(() => {
    const fetchTasks = async () => {
      const token = localStorage.getItem('token');
      const response = await axios.get('/api/tasks', {
        headers: { Authorization: `Bearer ${token}` },
      });
      setTasks(response.data.tasks);
    };
    fetchTasks();
  }, []);

  const addTask = async (e) => {
    e.preventDefault();
    const token = localStorage.getItem('token');
    const response = await axios.post('/api/tasks', { task }, {
      headers: { Authorization: `Bearer ${token}` },
    });
    setTasks([...tasks, response.data.task]);
    setTask('');
  };

  return (
    <div>
      <h2>Tasks</h2>
      <form onSubmit={addTask}>
        <label>
          Task:
          <input type="text" value={task} onChange={(e) => setTask(e.target.value)} />
        </label>
        <button type="submit">Add Task</button>
      </form>
      <ul>
        {tasks.map((t) => (
          <li key={t.id}>{t.task}</li>
        ))}
      </ul>
    </div>
  );
};

export default Tasks;
