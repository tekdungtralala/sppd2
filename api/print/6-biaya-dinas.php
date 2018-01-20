<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	$total = 0;
	foreach ( $data as $d ) {
		echo "Nomor surat tugas = " . $d->reference_number;
		echo "<br/>";
		echo "Judul Laporan = " . $d->task;
		echo "<br/>";
		echo "Kota = " . $d->objective;
		echo "<br/>";
		$t = 0;
		foreach ( $d->officers as $o ) {
			echo $o->reference_number . "  -  " . $o->name . "  -  " . $o->officer_id . " - " . $o->total_cost . "<br/>";
			$t = $t + $o->total_cost_default;
		}
		echo "Total = " . $t;
		echo "<br/>";
		$total = $total + $t;

		echo "<br/>";
	}

	echo "TOTAL = Rp " . number_format ($total, 2, ',', '.');
?>

