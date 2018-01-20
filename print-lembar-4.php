

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
$pdf->SetFont('helvetica', 'B', 12);
$admin = '<u>BUKTI KAS / BANK PENGELUARAN</u>';
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

	$tahun=getdate();

	$html2 = "";
	$html2.='<table style="height: 59px; width: 626px;">
		<tbody>
		<tr>
			<td style="width: 443.4px; text-align: right;">No. BKU</td>
			<td style="width: 180.6px;">: '. $row['kas_reference_number'].'</td>
		</tr>
		<tr>
			<td style="width: 443.4px; text-align: right;">Tahun</td>
			<td style="width: 180.6px; text-align: left;">: '.$tahun['year'].'</td>
		</tr>
		</tbody>
		</table>';
		

	$html = "";
	$html.='<table>
		<tbody>
		<tr style="height: 18px;">
			<td style="width: 148.8px; height: 18px;">Dibayarkan kepada</td>
			<td style="width: 148.8px; height: 18px;">: '. $row['name'].'&nbsp;</td>
			<td style="width: 150.4px; height: 18px;">&nbsp;</td>
			<td style="width: 150.4px; height: 18px;">&nbsp;</td>
		</tr>
		<tr style="height: 7px;">
			<td style="width: 148.8px; height: 7px;">Uang Sebesar</td>
			<td style="width: 400px; height: 7px;">: '. $row['total_cost_rp'].'</td>
			<td style="width: 50.4px; height: 7px;">&nbsp;</td>
			<td style="width: 150.4px; height: 7px;">&nbsp;</td>
		</tr>
		</tbody>
	</table>';


		$html3 = "";
		$html3.= '<br/>';
		$html3.='<table style="width: 630px;" border="1" cellpadding="1">
			<tbody>
			<tr style="height: 13px;">
			<td style="width: 299.2px; height: 13px; text-align: center;">Uraian</td>
			<td style="width: 80.8px; height: 13px; text-align: center;">
			<p>Komponen/</p>
			<p>Ouput/MAK</p>
			</td>
			<td style="width: 88.8px; height: 13px; text-align: center;">
			<p>Kode Pusat Biaya</p>
			</td>
			<td style="width: 136px; height: 13px; text-align: center;">Jumlah</td>
			</tr>
			<tr style="height: 17px;">
				<td style="width: 299.2px; height: 17px;">'. $row['kas_description'].'</td>
				<td style="width: 80.8px; height: 17px;">'. $row1['column_e'].'</td>
				<td style="width: 88.8px; height: 17px;">'. $row['kas_cost_center_code'].'</td>
				<td style="width: 136px; height: 17px;"> Rp. '.number_format($row['total_cost'], 2, ',', '.').'</td>
			</tr>
			<tr style="height: 39.2px;">
			<td style="width: 468.8px; height: 39.2px; text-align: right;" colspan="3">Jumlah </td>
			<td style="width: 136px; height: 39.2px;"> Rp. '.number_format($row['total_cost'], 2, ',', '.').'</td>
			</tr>
			</tbody>
		</table>';
		'</br>';
		

		$html4 = "";
		$html4.= '<br/>';
		$html4.='<table style="width: 630px;">
			<tbody>
			<tr>
				<td style="width: 203.2px;">Setuju di biayai</td>
				<td style="width: 203.2px;">Lunas di bayar oleh,</td>
				<td style="width: 203.2px;">Tangerang, '.date("d/m/Y").'</td>
			</tr>
			<tr>
				<td style="width: 203.2px;">Pejabat Pembuat Komitmen</td>
				<td style="width: 203.2px;">Bendahara</td>
				<td style="width: 203.2px;">Yang menerima pembayaran</td>
			</tr>
			<tr>
				<td style="width: 203.2px;">
				<p>&nbsp;</p>
				<p>Drs.Djoko Prasetyo</p>
			</td>
			<td style="width: 203.2px;">
				<p>&nbsp;</p>
				<p>Nurlela, SE.,M,Ak</p>
			</td>
			<td style="width: 203.2px;">
				<p>&nbsp;</p>
				<p>'. $row['name'].'</p>
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