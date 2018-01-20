<?php
	include '../connect.php';
	session_start();
	echo "Start Date = ". $_SESSION["startDate"] ."<br/>";
	echo "End   Date = ". $_SESSION["endDate"] ."<br/>";
	$data = $_SESSION["data"];

	$total = 0;
	foreach ( $data as $d ) {
		echo "Nomor Surat Tugas = " . $d->reference_number;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo "__No SPD = " . $o->reference_number;
			echo "<br/>";			
		}
		echo "Kegiatan Anggaran = " . $d->column_e;
		echo "<br/>";
		echo "Mata Anggaran = " . $d->column_f;
		echo "<br/>";
		foreach ( $d->officers as $o ) {
			echo "__Kode Pusat = " . $o->kas_cost_center_code;
			echo "<br/>";			
		}
		foreach ( $d->officers as $o ) {
			echo "__Uraian = " . $o->kas_description;
			echo "<br/>";			
		}
		foreach ( $d->officers as $o ) {
			echo "__Jumlah = " . $o->total;
			echo "<br/>";			
		}
		echo "Total = " . $d->totalRp;
		echo "<br/>";
		echo "<br/>";
	}
	echo "Total Keuangan per Bulan = " . $_SESSION["totalRp"];
?>

