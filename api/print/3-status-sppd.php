<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	foreach ( $data as $d ) {
		echo "Status = " . $d->status;
		echo "<br/>";
		echo "Tanggal Pelaksanaan = " . $d->start_date . " - " . $d->end_date;
		echo "<br/>";
		echo "Nomor surat tugas = " . $d->reference_number;
		echo "<br/>";
		echo "Judul Laporan = " . $d->task;
		echo "<br/>";
		echo "Kota = " . $d->objective;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo $o->name . "  -  " . $o->officer_id ."<br/>";
		}

		echo "<br/>";
	}
?>

