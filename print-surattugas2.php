

<?php

include 'api/connect.php';
	
require('tcpdf/tcpdf.php');

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

	//Page header
	public function Header() {
		// Logo
		//$image_file = K_PATH_IMAGES.'logobppt.jpg';
		//$this->Image($image_file, 20, 26, 30, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		//$image_file = K_PATH_IMAGES.'logo.png';
		//$this->Image($image_file, 162, 26, 30, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// Set font
		$this->SetFont('helvetica', 'B', 20);
		// Title
		$this->Cell(0, 15, '', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		
	}

	// Page footer
	public function Footer() {
		// Position at 15 mm from bottom
		$this->SetY(-15);
		// Set font
		$this->SetFont('helvetica', 'I', 8);
		// Page number
		$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
	}
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
//$pdf->SetCreator(PDF_CREATOR);
//$pdf->SetAuthor('Rendi');
//$pdf->SetTitle('TCPDF Example 048');
//$pdf->SetSubject('TCPDF Tutorial');
//$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 048', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}

// ---------------------------------------------------------




// set font
//$pdf->SetFont('helvetica', 'B', 14);
$pdf->Header();
// add a page
$pdf->AddPage();

// set JPEG quality
//$pdf->setJPEGQuality(75);

// Image method signature:
// Image($file, $x='', $y='', $w=0, $h=0, $type='', $link='', $align='', $resize=false, $dpi=300, $palign='', $ismask=false, $imgmask=false, $border=0, $fitbox=false, $hidden=false, $fitonpage=false)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



// Example of Image from data stream ('PHP rules')
//$imgdata = base64_decode('iVBORw0KGgoAAAANSUhEUgAAABwAAAASCAMAAAB/2U7WAAAABlBMVEUAAAD///+l2Z/dAAAASUlEQVR4XqWQUQoAIAxC2/0vXZDrEX4IJTRkb7lobNUStXsB0jIXIAMSsQnWlsV+wULF4Avk9fLq2r8a5HSE35Q3eO2XP1A1wQkZSgETvDtKdQAAAABJRU5ErkJggg==');

// The '@' character is used to indicate that follows an image data stream and not an image file name
//$pdf->Image('@'.$imgdata);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// Image example with resizing
$image_file = K_PATH_IMAGES.'logobppt.jpg';
$pdf->Image($image_file, 20, 26, 30, '', 'JPG', '', 'T', false, 30, '', false, false, 0, false, false, false);
//$pdf->Image('logobppt.jpg', 15, 5, 20, 10, 'JPG', 'http://www.tcpdf.org', '', true, 100, '', false, false, 1, false, false, false);
$pdf->SetFont('helvetica', 'B', 12);
// set some text to print
$txt = <<<EOD
BADAN PENGKAJIAN DAN PENERAPAN TEKNOLOGI
EOD;

$txt2 = <<<EOD
BALAI TEKNOLOGI PENGOLAHAN AIR DAN LIMBAH
EOD;

$txt1 = <<<EOD
Gedung 820 - Geostech BPPT, Puspiptek Serpong 
Kota Tangerang Selatan, Provinsi Banten 15314 
Tel./Fax : 021-75791377 Ext. 4083
EOD;


// print a block of text using Write()
$pdf->Write(0, $txt, '', 0, 'C', true, 0, false, true, 0);
$pdf->Write(0, $txt, '', 0, 'C', true, 0, false, true, 0);
$pdf->SetFont('helvetica', 'B', 8);
$pdf->Write(0, $txt1, '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->SetFont('helvetica', 'B', 12);
$admin = '<u>SURAT TUGAS</u>';
$pdf->writeHTML($admin, '', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->SetFont('helvetica', '', 12);

// -----------------------------------------------------------------------------

	ob_start();

	$sql = "select * from sppd where id = " . $_GET['id'];
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	
	$html = "";
	$html.='<table style="width: 100px;">
				<tbody>
					<tr style="height: 5px;">
						<td style="width: 160px; height: 41px;"></td>
						<td style="height: 36px;"></td>
						<td style="width: 250px; height: 70px;"><strong>Nomor : '.$row['reference_number'] .'</strong></td>
					</tr>
				</tbody>
			</table>';



	$sql1 = "select * from sppd_officer  where sppd_id = " . $row['id'];
	$result1 = $conn->query($sql1);	

	$html2 = "";

	
		$html2.='<table border="1" style="width: 100px;">
		
		
	<tbody>
		<tr style="height: 10px;">
			<td style="width: 200px; height: 41px;">Dasar</td>
			<td>:</td>
			<td style="width: 430px; height: 70px;">'.$row['base'] .'</td>
		</tr>

		<tr style="height: 60px;">
			<td style="width: 200px; height: 36px;">Memberikan Tugas Kepada</td>
			<td style="height: 36px;">:</td>
			
			<td style="width: 430px; height: 70px;">';
				while($row1 = $result1->fetch_assoc()) {
					$html2.=  $row1['name'] . " - " . $row1['officer_id'] . '<br/>';
				}
			$html2.='</td>

		</tr>	
		
		<tr style="height: 60px;">
			<td style="width: 200px; height: 36px;">Tanggal</td>
			<td style="height: 36px;">:</td>
			<td style="width: 430px; height: 70px;">'.date('d F Y', strtotime($row['start_date'])).' - '.date('d F Y', strtotime($row['end_date'])).' ('.$row['total_day'] .') hari</td>
		</tr>
		<tr style="height: 60px;">
			<td style="width: 200px; height: 36px;">Tujuan</td>
			<td style="height: 36px;">:</td>
			<td style="width: 430px; height: 70px;">'.$row['objective'] .'</td>
		</tr>
		<tr style="height: 60px;">
			<td style="width: 200px; height: 36px;">Tugas</td>
			<td style="height: 36px;">:</td>
			<td style="width: 430px; height: 70px;">'.$row['task'] .'</td>
		</tr>
		<tr style="height: 42.6px;">
			<td style="width: 200px; height: 42.6px;">Keterangan</td>
			<td style="height: 42.6px;">:</td>
			<td style="width: 430pxpx; height: 42.6px;">'.$row['description'] .'</td>
		</tr>
	</tbody>
	
	</table>';
			
			'</br>';
			'</br>';
	

$pdf->writeHTML($html, true, false, false, false, '');
$pdf->writeHTML($html2, true, false, false, false, '');
// $pdf->writeHTML($tbl, true, false, false, false, '');
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
// set font
$pdf->SetFont('helvetica', '', 12);
$pdf->Write(0, 'Tangerang, '.date("d/m/Y"), '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, 'Balai Teknologi Pengolahan Air dan Limbah,', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, 'Kepala,', '', 0, 'R', true, 0, false, false, 0);

// $pdf->Cell(20,0.7,"Nomor Order       	 : ".date("d/m/Y"),10,10,'L');
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
// output the HTML content



//$pdf->writeHTML($admin, '', '', 0, 'R', true, 40, false, false, 0);
$pdf->Write(0, 'Ir. Setiyono, M.Si', '', 0, 'R', true, 0, false, false, 0);


//Close and output PDF document
$pdf->Output('surat_tugas.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+

?>