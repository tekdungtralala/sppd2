<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	$total = 0;
	foreach ( $data as $d ) {
		echo "Tanggal Pelaksanaan = " . $d->start_date . " - " . $d->end_date;
		
		echo "Kota = " . $d->objective;
		echo "<br/>";
		echo "profinsi = " . $d->provinceName;
		echo "<br/>";
		echo "lama jalan = " . $d->total_day;
		echo "<br/>";
		echo "angkutan = " . $d->transportation_type;
		echo "<br/>";
		echo "<br/>";
	}
?>

