<?php
include '../connect.php';
$sql = "SELECT so.* FROM sppd_officer so, sppd s where so.sppd_id = s.id and s.state = '6'";
$result = $conn->query($sql);
$rows = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
         $rows[] = $row;
    }
}
print json_encode($rows);
?>