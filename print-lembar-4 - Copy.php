<?php
include 'api/connect.php';

$sql = "select * from sppd_officer where id = " . $_GET['id'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$sql1 = "select * from sppd where id = " . $row['sppd_id'];
$result1 = $conn->query($sql1);
$row1 = $result1->fetch_assoc();

echo "no bku : ". $row['kas_reference_number']. "<br/>";
echo "tahun : ". $row['kas_year']. "<br/>";
echo "kepada : ". $row['name']. "<br/>";
echo "uang sebesar : ". $row['total_cost_rp']. "<br/>";
echo "uraian : ". $row['kas_description']. "<br/>";
echo "kode : ". $row['kas_cost_center_code']. "<br/>";
echo "jumlah : ". $row['total_cost']. "<br/>";
echo "pejabat pembuat komitmen : ". $row['committed_officer']. "<br/>";
echo "bendahara : ". $row['treasurer_officer']. "<br/>";
echo "tanggal : ". $row1['start_date']. "<br/>";

?>