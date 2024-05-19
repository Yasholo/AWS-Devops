<!DOCTYPE html>
<html>
<head>
    <title>Task Manager</title>
</head>
<body>
    <h1>Task Manager</h1>
    <ul>
        <?php include 'list_tasks.php'; ?>
    </ul>
    <h2>Add New Task</h2>
    <form action="add_task.php" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <br>
        <label for="description">Description:</label><br>
        <textarea id="description" name="description"></textarea>
        <br>
        <button type="submit">Add Task</button>
    </form>
</body>
</html>
