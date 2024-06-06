<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Task Manager</h1>
        <div class="tasks">
            <?php include 'list_tasks.php'; ?>
        </div>
        <h2>Add New Task</h2>
        <form action="add_task.php" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>
            <button type="submit">Add Task</button>
        </form>
    </div>
</body>
</html>
