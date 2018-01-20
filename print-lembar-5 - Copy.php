<?php
include 'api/connect.php';

$sql1 = "select * from sppd where id = " . $_GET['id'];
$result1 = $conn->query($sql1);
$row1 = $result1->fetch_assoc();

echo "Judul ". $row1['report_title']. "<br/>";
echo "Tanggal Mulai ". $row1['start_date']. "<br/>";
echo "Tanggal Selesai ". $row1['end_date']. "<br/>";
echo "ISI ". $row1['report_content']. "<br/>";
echo "Tanggal Laporan dibuat ". $row1['report_created_date']. "<br/><br/>";


$sql1 = "select * from sppd_officer where sppd_id = " . $_GET['id'];
$result1 = $conn->query($sql1);
while($row1 = $result1->fetch_assoc()) {
	echo $row1['name'] . "<br/>";
	return;
}

?>