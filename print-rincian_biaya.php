

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
define ('PDF_PAGE_ORIENTATION', 'L'); // orientasi halaman. P=portrait, L=landscape
define ('PDF_UNIT', 'mm'); // ukuran satuan dari halaman
define ('PDF_PAGE_FORMAT', 'A4'); // ukuran kertas dari halaman
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
Balai Teknologi Pengolahan Air dan Limbah
BPP Teknologi
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
$admin = '<u>RINCIAN BIAYA PERJALANAN DINAS</u>';
$pdf->writeHTML($admin, '', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
//SET FONT TABLE
$pdf->SetFont('helvetica', '', 10);

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
		
	<tbody>
		<tr>
			<td style="width: 30.4px; text-align: center;"><strong>No</strong></td>
			<td style="width: 320px; text-align: center;"><strong>Perincian Biaya</strong></td>
			<td style="width: 151px; text-align: center;"><strong>Jumlah</strong></td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">1.</td>
			<td style="width: 320px;">Nama yang berangkat : '. $row['name'].'</td>
			<td style="width: 151px;">&nbsp;</td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">2.</td>
			<td style="width: 320px;">NIP. '. $row['officer_id'].'</td>
			<td style="width: 151px;">&nbsp;</td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">3.</td>
			<td style="width: 320px;">Golongan : '. $row['office_class_name'].'</td>
			<td style="width: 151px;">&nbsp;</td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">4.</td>
			<td style="width: 320px;">Uang Harian : 1 x '. $row1['total_day'].' x Rp. '.number_format($row['daily_cost'], 2, ',', '.').'</td>
			<td style="width: 151px;"> Rp. '.number_format($row['total_daily_cost'], 2, ',', '.').'</td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">5.</td>
			<td style="width: 320px;">Biaya Penginapan : 1 x '. ($row1['total_day'] -1 ).' x Rp. '.number_format($row['lodging_cost'], 2, ',', '.').'</td>
			<td style="width: 151px;"> Rp. '.number_format($row['total_lodging_cost'], 2, ',', '.').'</td>
			
		</tr>
		<tr>
			<td style="width: 30.4px;">6.</td>
			<td style="width: 320px;">Transport Tangerang - '.$row1['objective'].' : Rp. '.number_format($row['transportation_cost'], 2, ',', '.').'</td>
			<td style="width: 151px;"> Rp. '.number_format($row['transportation_cost'], 2, ',', '.').'</td>
			
		</tr>
		<tr>
			<td style="width: 350.4px;" colspan="2">JUMLAH</td>
			<td style="width: 151px;"> Rp. '.number_format($row['total_cost'], 2, ',', '.').'</td>
			
		</tr>
		<tr>
		<td style="width: 501.4px;" colspan="4">Terbilang : '. $row['total_cost_rp'].'</td>
		</tr>
</tbody>

	</table>';

	

		$html3 = "";
		$html3.= '<br/>';
		$html3.='<table style="width: 630px;">
		<tbody>
		<tr style="height: 16px;">
			<td style="width: 200px; text-align: left; height: 16px;">&nbsp;</td>
			<td style="width: 32px; text-align: left; height: 16px;">&nbsp;</td>
			<td style="width: 220px; text-align: left; height: 16px;">&nbsp;</td>
			<td style="width: 152px; text-align: left; height: 16px;">Tangerang, '.date("d/m/Y").'</td>
		</tr>
		<tr style="height: 11px;">
			<td style="width: 200px; height: 11px;">Telah di bayar sejumlah</td>
			<td style="width: 32px; height: 11px;">&nbsp;</td>
			<td style="width: 285px; height: 11px;">Telah menerima jumlah uang sebesar</td>
			<td style="width: 152px; height: 11px;">&nbsp;</td>
		</tr>
		<tr style="height: 5px;">
			<td style="width: 200px; height: 5px;">Rp. '.number_format($row['total_cost'], 2, ',', '.').'&nbsp;</td>
			<td style="width: 32px; height: 5px;">&nbsp;</td>
			<td style="width: 285px; height: 5px;">Rp. '.number_format($row['total_cost'], 2, ',', '.').'&nbsp;</td>
			<td style="width: 152px; height: 5px;">&nbsp;</td>
		</tr>
		<tr style="height: 13px;">
			<td style="width: 200px; height: 13px;">&nbsp;</td>
			<td style="width: 32px; height: 13px;">&nbsp;</td>
			<td style="width: 285px; height: 13px;">&nbsp;</td>
			<td style="width: 152px; height: 13px;">&nbsp;</td>
		</tr>
		<tr style="height: 7px;">
			<td style="width: 200px; height: 7px;">&nbsp;Bendahara</td>
			<td style="width: 32px; height: 7px;">&nbsp;</td>
			<td style="width: 285px; height: 7px;">&nbsp;Yang Menerima</td>
			<td style="width: 152px; height: 7px;">&nbsp;</td>
		</tr>
		<tr style="height: 14px;">
			<td style="width: 200px; height: 14px;">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		</td>
			<td style="width: 32px; height: 14px;">&nbsp;</td>
			<td style="width: 285px; height: 14px;">&nbsp;</td>
			<td style="width: 152px; height: 14px;">&nbsp;</td>
		</tr>
		<tr style="height: 1.60001px;">
			<td style="width: 200px; height: 1.60001px;">&nbsp;Nurlela, SE.,M.Ak</td>
			<td style="width: 32px; height: 1.60001px;">&nbsp;</td>
			<td style="width: 285px; height: 1.60001px;">'. $row['name'].'</td>
			<td style="width: 152px; height: 1.60001px;">&nbsp;</td>
		</tr>
		<tr style="height: 1.60001px;">
			<td style="width: 200px; height: 1.60001px;">NIP. 197810032009102001</td>
			<td style="width: 32px; height: 1.60001px;">&nbsp;</td>
			<td style="width: 285px; height: 1.60001px;">NIP.'. $row['officer_id'].'</td>
			<td style="width: 152px; height: 1.60001px;">&nbsp;</td>
		</tr>
		</tbody>
		</table>';
		'</br>';
		'</br>';
		'</br>';
		'</br>';
		'</br>';

		$html4 = "";
		$html4.= '<br/>';
		$html4.='<table style="width: 630px;">
			<tbody>
			<tr>
				<td style="width: 609px; text-align: center;" colspan="3" height="30"><strong></strong></td>
			</tr>
			<tr>
				<td style="width: 609px; text-align: center;" colspan="3" height="30"><strong></strong></td>
			</tr>
			<tr>
				<td style="width: 609px; text-align: center;" colspan="3" height="30"><strong>PERHITUNGAN SPPD RAMPUNG</strong></td>
			</tr>
			<tr>
				<td style="width: 225.2px;">Ditetapkan sejumlah</td>
				<td style="width: 180.8px;">: Rp. '.number_format($row['total_cost'], 2, ',', '.').'</td>
				<td style="width: 203px;">&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 225.2px;">Yang telah dibayar semula</td>
				<td style="width: 180.8px;">: <span style="text-decoration: underline;">Rp. '.number_format($row['total_cost'], 2, ',', '.').'</span></td>
				<td style="width: 203px;">&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 225.2px;">Sisa kurang / lebih</td>
				<td style="width: 180.8px;">: Rp. -</td>
				<td style="width: 203px;">&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 225.2px;">&nbsp;</td>
				<td style="width: 180.8px;">&nbsp;</td>
				<td style="width: 203px;">&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 225.2px;">&nbsp;</td>
				<td style="width: 180.8px;">&nbsp;</td>
				<td style="width: 203px;">Pejabat Pembuat Komitmen,</td>
			</tr>
			<tr>
				<td style="width: 225.2px;">&nbsp;</td>
				<td style="width: 180.8px;">&nbsp;</td>
				<td style="width: 203px;">
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>Drs. Djoko Prasetyo</p>
			<p>NIP. 196601261993031001</p>
			</td>
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
$pdf->Output('rincian_biaya.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+

?>