<?php
require_once 'db_connection.php';

$sql = "SELECT * FROM tasks ORDER BY created_at DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo '<div class="task">';
        echo "<h3>{$row['title']}</h3>";
        echo "<p>{$row['description']}</p>";
        echo '</div>';
    }
} else {
    echo "<p>No tasks found.</p>";
}

$conn->close();
?>
