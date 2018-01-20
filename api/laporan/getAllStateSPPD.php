<?php
include '../connect.php';

$startDate = !empty($_GET['startDate']) ? $_GET['startDate'] : '';
$endDate = !empty($_GET['endDate']) ? $_GET['endDate'] : '';
if ($startDate && $endDate)
	$sql = "select * from sppd where ((start_date BETWEEN '".$_GET['startDate']."' AND '".$_GET['endDate']."') or (end_date BETWEEN '".$_GET['startDate']."' AND '".$_GET['endDate']."'))";
else
	$sql = "select * from sppd ";

$result = $conn->query($sql);
$rows = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
         $rows[] = $row;
    }
}
print json_encode($rows);
?>