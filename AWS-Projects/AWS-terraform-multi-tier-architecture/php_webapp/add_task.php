<?php
require_once 'db_connection.php';

$title = $_POST['title'];
$description = $_POST['description'];

$sql = "INSERT INTO tasks (title, description) VALUES ('$title', '$description')";

if ($conn->query($sql) === TRUE) {
    header('Location: index.php');
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>
