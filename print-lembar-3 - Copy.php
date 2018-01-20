<?php
include 'api/connect.php';

$sql = "select * from sppd_officer where id = " . $_GET['id'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$sql1 = "select * from sppd where id = " . $row['sppd_id'];
$result1 = $conn->query($sql1);
$row1 = $result1->fetch_assoc();

echo "surat perjalanan : ". $row['reference_number']. "<br/>";
echo "tanggal : ". $row1['start_date']. "<br/>";
echo "nama : ". $row['name']. "<br/>";
echo "nip : ". $row['officer_id']. "<br/>";
echo "golongan : ". $row['office_class_name']. "<br/>";
echo "todal hari : ". $row1['total_day']. "<br/>";
echo "uang harian : ". $row['daily_cost']. "<br/>";
echo "total uang harian : ". $row['total_daily_cost']. "<br/>";
echo "biaya penginapan : ". $row['lodging_cost']. "<br/>";
echo "total biaya penginapan : ". $row['total_daily_cost']. "<br/>";
echo "transport : ". $row['transportation_cost']. "<br/>";
echo "jumlah : ". $row['total_cost']. "<br/>";
echo "terbilang : ". $row['total_cost_rp']. "<br/>";
echo "nama bendahara : ". $row['treasurer_officer']. "<br/>";
echo "nip bendahara : ". $row['treasurer_officer_id']. "<br/>";
echo "nama pejabat pembuat komitmen : ". $row['committed_officer']. "<br/>";
echo "nip pejabat : ". $row['committed_officer_id']. "<br/>";
?>