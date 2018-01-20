<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	foreach ( $data as $d ) {
		echo "Nomor surat tugas = " . $d->reference_number;
		echo "<br/>";
		echo "Kegiatan Output = " . $d->column_e;
		echo "<br/>";
		echo "Mata Anggaran = " . $d->column_f;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo "___No. SPD = " . $o->reference_number;
			echo "<br/>";
			echo "___Kode Pusat= " . $o->kas_cost_center_code;
			echo "<br/>";
			echo "___Uraian= " . $o->kas_description;
			echo "<br/>";
		}

		echo "<br/>";
	}
?>

