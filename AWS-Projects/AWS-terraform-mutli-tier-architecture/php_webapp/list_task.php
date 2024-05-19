<?php
require_once 'db_connection.php';

$sql = "SELECT * FROM tasks ORDER BY created_at DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<li>{$row['title']} - {$row['description']}</li>";
    }
} else {
    echo "No tasks found.";
}
$conn->close();
?>
