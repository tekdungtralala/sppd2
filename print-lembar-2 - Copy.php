<?php
include 'api/connect.php';

$sql = "select * from sppd_officer where id = " . $_GET['id'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$sql1 = "select * from sppd where id = " . $row['sppd_id'];
$result1 = $conn->query($sql1);
$row1 = $result1->fetch_assoc();

echo "surat perjalanan : ". $row['reference_number']. "<br/>";
echo "pejabat pembuat komitmen : ". $row['committed_officer']. "<br/>";
echo "nip pejabat : ". $row['committed_officer_id']. "<br/>";
echo "nama pegawai : ". $row['name']. "<br/>";
echo "nip pegawai : ". $row['officer_id']. "<br/>";
echo "golongan pegawai : ". $row['office_class_name']. "<br/>";
echo "jabatan pegawai : ". $row['office_position_name']. "<br/>";

echo "maksud dan tujuan : ". $row1['task']. "<br/>";
echo "alat angkutan yang digunakan : ". $row1['transportation_type']. "<br/>";
echo "tempat tujuan : ". $row1['objective']. "<br/>";
echo "lama perjalanan dinas : ". $row1['total_day']. "<br/>";
echo "tanggal berangkat : ". $row1['start_date']. "<br/>";
echo "tanggal kembali : ". $row1['end_date']. "<br/>";
echo "output : ". $row1['column_e']. "<br/>";
echo "mata anggaran : ". $row1['column_f']. "<br/>";
?>