

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
$admin = '<u>LAPORAN HASIL DINAS </u>';
$pdf->writeHTML($admin, '', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
//SET FONT TABLE
$pdf->SetFont('helvetica', '', 11);

// -----------------------------------------------------------------------------

	ob_start();
	
	$sql1 = "select * from sppd_officer where sppd_id = " . $_GET['id'];
	$result = $conn->query($sql1);
	$row = $result->fetch_assoc();

	$sql1 = "select * from sppd where id = " . $_GET['id'];
	$result1 = $conn->query($sql1);
	$row1 = $result1->fetch_assoc();

	$html = "";
	$html.='<h4 style="text-align: center;">'. $row1['report_title'].'</h4>';
	
		$html.='<table>
		<table style="height: 33px; width: 400px;">
		<tbody>
		<tr>
		<td style="width: 100px;">Nomor ST</td>
		<td style="width: 300px;">: '. $row1['reference_number'].'</td>
		</tr>
		<tr>
		<td style="width: 100px;">Waktu</td>
		<td style="width: 300px;">: '.date('d F Y', strtotime($row1['start_date'])).' - '.date('d F Y', strtotime($row1['end_date'])).'</td>
		</tr>
		<tr>
		<td style="width: 100px;">Tempat Tujuan</td>
		<td style="width: 300px;">: '. $row1['objective'].'</td>
		</tr>
		</tbody>
		</table>';

	$html.='<p>Laporan :</p>';
	$html.='<p>'. $row1['report_content'].'</p>';

	$html.='<p>Tangerang Selatan, '.date('d F Y').'</p>';
	$html.='<p></p>';
	$html.='<p></p>';
	$html.='<p>'. $row['name'].'</p>';
	$html.='<p>NIP. '. $row['officer_id'].'</p>';

$pdf->writeHTML($html, true, false, false, false, '');

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
$pdf->Output('hasil-dinas.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+

?>