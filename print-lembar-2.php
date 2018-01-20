

<?php

include 'api/connect.php';
	
require('tcpdf/tcpdf.php');

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

	//Page header
	public function Header() {
		// Logo
		$image_file = K_PATH_IMAGES.'logobppt.jpg';
		$this->Image($image_file, 15, 10, 20, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// $image_file = K_PATH_IMAGES.'logo.png';
		// $this->Image($image_file, 162, 26, 30, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// Set font
		$this->SetFont('helvetica', 'B', 10);
		// Title
		$this->Cell(0, 15, '', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		
	}

	// Page footer
	
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);


// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
//$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
//$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}


// set font
//$pdf->SetFont('helvetica', 'B', 14);
$pdf->Header();
// add a page
$pdf->AddPage();

$pdf->SetFont('helvetica', '', 8);
// set some text to print
$txt = <<<EOD
BADAN PENGKAJIAN DAN PENERAPAN TEKNOLOGI
BALAI TEKNOLOGI PENGOLAHAN AIR DAN LIMBAH - TPSA
EOD;


//$txt1 = <<<EOD
//Gedung 820 - Geostech BPPT, Puspiptek Serpong 
//Kota Tangerang Selatan, Provinsi Banten 15314 
//Tel./Fax : 021-75791377 Ext. 4083
//EOD;


// print a block of text using Write()
$pdf->Write(0, $txt, '', 0, 'L', true, 0, false, false, 0);
$pdf->SetFont('helvetica', 'B', 8);
//$pdf->Write(0, $txt1, '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->SetFont('helvetica', 'B', 10);
$admin = '<u>SURAT PERJALANAN DINAS (SPD)</u>';
$pdf->writeHTML($admin, '', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
//SET FONT TABLE
$pdf->SetFont('helvetica', '', 8);

// -----------------------------------------------------------------------------

	ob_start();

	$sql = "select * from sppd_officer where id = " . $_GET['id'];
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();

	$sql1 = "select * from sppd where id = " . $row['sppd_id'];
	$result1 = $conn->query($sql1);
	$row1 = $result1->fetch_assoc();

	$html2 = "";
	$html2.='<table>
	<tr>
		<th width="20"></th>
		<th width="200"></th>
		<th width="200"><strong>Nomor : '.$row['reference_number'].'</strong></th>
		
	</tr>
		</table>';
		
		$html = "";
		
		$html.='<table border="1" cellpadding="1">
		
	
	<tr>
		<th width="30"> 1.</th>
		<th width="300"> Pejabat Pembuat Komitmen</th>
		<th width="300"> '.$row['committed_officer'].'</th>
	</tr>
	<tr>
		<th width="30"> 2.</th>
		<th width="300"> Nama/NIP Pegawai yang diperintahkan</th>
		<th width="300"> '.$row['name'].' /NIP. '.$row['officer_id'].'</th>
	</tr>
	<tr>
		<th width="30"> 3.</th>
		<th width="300"> a.Pangkat/Golongan</th>
		<th width="300"> '.$row['office_class_name'].'</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> b.Jabatan</th>
		<th width="300"> '.$row['office_position_name'].'</th>
	</tr>
	<tr>
		<th width="30"> 5.</th>
		<th width="300"> Maksud dan Tujuan</th>
		<th width="300"> '.$row1['task'].'</th>
	</tr>
	<tr>
		<th width="30"> 5.</th>
		<th width="300"> Alat angkutan yang dipergunakan</th>
		<th width="300"> '.$row1['transportation_type'].'</th>
	</tr>
	<tr>
		<th width="30"> 6.</th>
		<th width="300"> a.Tempat Berangkat</th>
		<th width="300"> Puspiptek - Tangerang</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> b.Tempat Tujuan</th>
		<th width="300"> '.$row1['objective'].'</th>
	</tr>
	<tr>
		<th width="30"> 7.</th>
		<th width="300"> a.Lama Perjalanan Dinas</th>
		<th width="300"> '.$row1['total_day'].'</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> b.Tanggal Berangkat</th>
		<th width="300"> '.date('d F Y', strtotime($row1['start_date'])).'</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> c.Tanggal Kembali</th>
		<th width="300"> '.date('d F Y', strtotime($row1['end_date'])).'</th>
	</tr>
	<tr>
		<th width="30"> 8.</th>
		<th width="300"> Pembebanan Anggaran</th>
		<th width="300"></th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> a.Instansi</th>
		<th width="300"> a. Balai Teknologi Pengolahan Air dan Limbah</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> b.Fungsi</th>
		<th width="300"> b. 04</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> c.Program</th>
		<th width="300"> c. 081.01.06</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> d.Kegiatan</th>
		<th width="300"> d. 3470</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> e.Output</th>
		<th width="300"> e. '.$row1['column_e'].'</th>
	</tr>
	<tr>
		<th width="30"></th>
		<th width="300"> f.Mata Anggaran</th>
		<th width="300"> f. '.$row1['column_f'].'</th>
	</tr>

	</table>';


		$html3 = "";
		$html3.= '<br/>';
		$html3.='<table style="width: 630px;">
		<tbody>
		<tr style="height: 20px;">
			<td style="width: 116px; height: 20px;">Berangkat dari</td>
			<td style="width: 243.6px; height: 20px;">: Puspiptek Tangerang</td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 227px; height: 20px;">Dikeluarkan di : Tangerang</td>
			<td style="width: 158px; height: 20px;"></td>
		</tr>
			<tr style="height: 20px;">
			<td style="width: 116px; height: 20px;">Pada tanggal</td>
			<td style="width: 243.6px; height: 20px;">: '.date('d F Y', strtotime($row1['start_date'])).'</td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 227px; height: 20px;">Pada tanggal: '.date('d F Y', strtotime($row1['start_date'])).'</td>
			<td style="width: 158px; height: 20px;"></td>
		</tr>
			<tr style="height: 20px;">
			<td style="width: 116px; height: 20px;">Mengetahui</td>
			<td style="width: 243.6px; height: 20px;">: Pejabat Pembuat Komitmen</td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 385px; height: 20px;" colspan="2">Balai Teknologi Pengolahan Air dan Limbah</td>
		</tr>
			<tr style="height: 20px;">
			<td style="width: 116px; height: 20px;"></td>
			<td style="width: 243.6px; height: 20px;"></td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 385px; height: 20px;" colspan="2">Pejabat Pembuat Komitmen</td>
		</tr>
			<tr style="height: 100px;">
			<td style="width: 116px; height: 41.2px;"></td>
			<td style="width: 243.6px; height: 41.2px;"></td>
			<td style="width: 1px; height: 41.2px;"></td>
			<td style="width: 227px; height: 41.2px;"></td>
			<td style="width: 158px; height: 41.2px;"></td>
		</tr>
		<tr style="height: 20px;">
			<td style="width: 158px; height: 20px;">Drs.Djoko Prasetyo</td>
			<td style="width: 243.6px; height: 20px;"></td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 227px; height: 20px;">Drs.Djoko Prasetyo</td>
			<td style="width: 158px; height: 20px;"></td>
		</tr>
		<tr style="height: 20px;">
			<td style="width: 158px; height: 20px;">NIP.196601261993031001</td>
			<td style="width: 243.6px; height: 20px;"></td>
			<td style="width: 1px; height: 20px;"></td>
			<td style="width: 227px; height: 20px;">NIP.196601261993031001</td>
			<td style="width: 158px; height: 20px;"></td>
		</tr>
		</tbody>
		</table>';
	

		$html4 = "";
		$html4.= '<br/>';
		$html4.='<table border="1" height="66" style="width: 630px;">
			<tbody>
			<tr>
				<td style="width: 120px;">Tiba di</td>
				<td style="width: 195px;">: '.$row1['objective'].'</td>
				<td style="width: 115px;">Berangkat dari</td>
				<td style="width: 200px;">: '.$row1['objective'].'</td>
			</tr>
			<tr>
				<td style="width: 120px;">Pada tanggal</td>
				<td style="width: 195px;">: '.date('d F Y', strtotime($row1['start_date'])).'</td>
				<td style="width: 115px;">Pada tanggal</td>
				<td style="width: 200px;">: '.date('d F Y', strtotime($row1['end_date'])).'</td>
			</tr>
			<tr>
				<td style="width: 315px;" colspan="2">Mengetahui<br /><br /><br /><br /><br /></td>
				<td style="width: 315px;" colspan="2">Mengetahui<br /><br /><br /><br /><br /></td>
			</tr>
			<tr>
				<td style="width: 315px;" colspan="2">Tiba kembali di : Puspiptek Tangerang<br />
					Pada tanggal : '.$row1['start_date'].'<br />
					Pejabat Pembuat Komitmen<br /><br /><br />Drs.Djoko Prasetyo<br />NIP.196601261993031001<br /></td>
				<td style="width: 315px;" colspan="2">Telah diperiksa, dengan keterangan bahwa perjalanan tersebut diatas benar dilakukan atas perintahnya dan semata-mata untuk kepentingan jabatan dalam waktu yg sesingkat-singkatnya.<br />Pejabat Pembuat Komitmen<br /><br /><br />Drs.Djoko Prasetyo<br />NIP.196601261993031001<br /></td>
			</tr>
			<tr>
			<td style="width: 630px;" colspan="4">PERHATIAN :<br />PPK yang menerbitkan SPD, pegawai yang melakukan perjalanan dinas, para pejabat yang mengesahkan tanggal berangkat/tiba, serta bendahara pengeluaran bertanggung jawab berdasarkan peraturan-peraturan Keuangan Negara apabila negara menderita rugi akibat kesalahan, kelalaian, dan kealpaannya.</td>
			</tr>
			</tbody>
			</table>';

$pdf->writeHTML($html2, true, false, false, false, '');
$pdf->writeHTML($html, true, false, false, false, '');
$pdf->writeHTML($html3, true, false, false, false, '');
$pdf->writeHTML($html4, true, false, false, false, '');


// set font
//$pdf->SetFont('helvetica', '', 12);
//$pdf->Write(0, 'Serpong, '.date("d/m/Y"), '', 0, 'R', true, 0, false, false, 0);
//$pdf->Write(0, 'Kepala BTPAL,', '', 0, 'R', true, 0, false, false, 0);

// $pdf->Cell(20,0.7,"Nomor Order       	 : ".date("d/m/Y"),10,10,'L');
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
// output the HTML content



//$pdf->writeHTML($admin, '', '', 0, 'R', true, 40, false, false, 0);
//$pdf->Write(0, 'Ir. Setiyono, M.Si', '', 0, 'R', true, 0, false, false, 0);


//Close and output PDF document
$pdf->Output('surat_spd.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+

?>