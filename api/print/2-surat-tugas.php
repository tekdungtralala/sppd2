<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	foreach ( $data as $d ) {
		echo "Status = " . $d->status;
		echo "<br/>";
		echo "Nomor Surat Tugas = " . $d->reference_number;
		echo "<br/>";
		echo "Lama Jalan = " . $d->total_day;
		echo "<br/>";
		echo "Kota = " . $d->objective;
		echo "<br/>";
		echo "Angkutan = ". $d->transportation_type;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo $o->reference_number . "  -  " . $o->name . "  -  " . $o->officer_id ."<br/>";
		}

		echo "<br/>";
	}
?>

