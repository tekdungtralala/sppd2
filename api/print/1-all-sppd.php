<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	foreach ( $data as $d ) {
		echo "Tanggal Pelaksanaan = " . $d->start_date . " - " . $d->end_date;
		echo "<br/>";
		echo "Tujuan = " . $d->objective;
		echo "<br/>";
		echo "Judul Laporan = " . $d->report_title;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo $o->name . "  -  " . $o->officer_id ."<br/>";
		}
		echo "<br/>";
	}
?>

