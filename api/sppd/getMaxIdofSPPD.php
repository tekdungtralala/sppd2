<?php
include '../connect.php';
$sql = "select max(id) as max from sppd";
$result = $conn->query($sql);
$rows = array();
$row = $result->fetch_assoc();
echo $row['max'] + 1;
?>