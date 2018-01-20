<?php
include '../connect.php';
$sql = "select * from sppd where state = ".$_GET['state'];
$result = $conn->query($sql);
$rows = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
         $rows[] = $row;
    }
}
print json_encode($rows);
?>