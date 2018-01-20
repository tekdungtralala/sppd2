<?php
//============================================================+
// File name   : example_048.php
// Begin       : 2009-03-20
// Last Update : 2013-05-14
//
// Description : Example 048 for TCPDF class
//               HTML tables and table headers
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: HTML tables and table headers
 * @author Nicola Asuni
 * @since 2009-03-20
 */

// Include the main TCPDF library (search for installation path).
//require_once('tcpdf_include.php');

include '../connect.php';
	
require('tcpdf/tcpdf.php');

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

	//Page header
	public function Header() {
		// Logo
		//$image_file = K_PATH_IMAGES.'logobppt.jpg';
		//$this->Image($image_file, 15, 10, 20, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// $image_file = K_PATH_IMAGES.'logo.png';
		// $this->Image($image_file, 162, 26, 30, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// Set font
		$this->SetFont('helvetica', 'B', 10);
		// Title
		$this->Cell(0, 15, '', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		
	}

	// Page footer
	
}
//define ('PDF_PAGE_ORIENTATION', 'L'); // orientasi halaman. P=portrait, L=landscape
//define ('PDF_UNIT', 'mm'); // ukuran satuan dari halaman
//define ('PDF_PAGE_FORMAT', 'A4'); // ukuran kertas dari halaman
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

//$pdf->SetFont('helvetica', '', 8);
// set some text to print
$txt = <<<EOD
Balai Teknologi Pengolahan Air dan Limbah
Badan Pengkajian dan Penerapan Teknologi
EOD;


//$txt1 = <<<EOD
//Gedung 820 - Geostech BPPT, Puspiptek Serpong 
//Kota Tangerang Selatan, Provinsi Banten 15314 
//Tel./Fax : 021-75791377 Ext. 4083
//EOD;


// print a block of text using Write()
//$pdf->Write(0, $txt, '', 0, 'L', true, 0, false, false, 0);
//$pdf->SetFont('Times New Roman', 'B', 8);
//$pdf->Write(0, $txt1, '', 0, 'C', true, 0, false, false, 0);

$pdf->SetFont('helvetica', 'B', 18);
$admin = '<u>BUKU KAS UMUM</u>';
$pdf->writeHTML($admin, '', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
//SET FONT TABLE
$pdf->SetFont('helvetica', '', 8);

// -----------------------------------------------------------------------------

session_start();
	   
	   $data = $_SESSION["data"];
	   
	   $html2 = "";
		
		$html2.='<table cellpadding="1">
		
	
	<tr>
		<th width="150"> Tahun Anggaran</th>
		<th width="300"> : (dari database)</th>
		
	</tr>
	<tr>
		<th width="150"> Kementerian/Lembaga</th>
		<th width="300"> : (081) BADAN PENGKAJIAN DAN PENERAPAN TEKNOLOGI</th>
		
	</tr>
	
	<tr>
		<th width="150"> Unit Organisasi</th>
		<th width="300"> : (01) BADAN PENGKAJIAN DAN PENERAPAN TEKNOLOGI</th>
		
	</tr>
	<tr>
		<th width="150"> Provinsi/Kabupaten/Kota</th>
		<th width="300"> : (29.04) KAB.TANGERANG</th>
		
	</tr>
	<tr>
		<th width="150"> Satuan Kerja</th>
		<th width="350"> : (6311034) BALAI TEKNOLOGI PENGOLAHAN AIR DAN LIMBAH</th>
	</tr>
	<tr>
		<th width="150"> Dokumen</th>
		<th width="300"> : (01) DIPA</th>
	</tr>
	<tr>
		<th width="150"> Nomor / Tanggal Dokumen</th>
		<th width="300"> : {dari database}</th>
	</tr>
	<tr>
		<th width="150"> Revisi ke</th>
		<th width="300"> : {dari database}</th>
	</tr>
	<tr>
		<th width="150"> KPPN</th>
		<th width="300"> : (127) Tangerang</th>
	</tr>
	

	</table>';

		$tbl="";

		$tbl .= "Periode : ".date('d M Y', strtotime($_SESSION["startDate"])). " s/d " .date('d M Y', strtotime($_SESSION["endDate"])) ."<br/>";
		$tbl .= "<br/>";
		$tbl .= '
		<table border="1" cellpadding="1">
		<thead>
		  <tr style="background-color: #9400D3; text-align: center; height: 27.2px;">
		  	<th><strong><span style="color: #ffffff;">No</span></strong></th>
		  	<th><strong><span style="color: #ffffff;">Tanggal BKK</span></strong></th>
		  	<th><strong><span style="color: #ffffff;">BKK</span></strong></th>
		  	<th><strong><span style="color: #ffffff;">Uraian</span></strong></th>
		  	<th><strong><span style="color: #ffffff;">Kredit/Uang Harian</span></strong></th>
			<!-- <th><strong><span style="color: #ffffff;">No. Surat Tugas</span></strong></th> -->
			<!-- <th><strong><span style="color: #ffffff;">Jumlah</span></strong></th> -->
			
		</tr>
		</thead>';

	
	$total = 0;
	$no = 0;
	foreach ($data as $d) {
		$no++;
		$tbl .= "<tr>";
		$tbl .= "<td> ". $no ."</td>";
		

		$tbl .= "<td>diambil dari tanggal transaksi bukti kas</td>";
		
		
		$tbl .= "<td>";
		foreach ($d->officers as $o) {
			
			$tbl .= $o->kas_reference_number."<br/>";
			
			
		}
			$tbl .= "</td>";
		
		$tbl .= "<td>";
		foreach ($d->officers as $o) {
			
			$tbl .= $o->kas_description."<br/>";
		}
			$tbl .= "</td>";	
			
		$tbl .= "<td>uang harian</td>";
		
		$tbl .= "</tr>";

	}
			
			$tbl .= "<tr><td></td><td></td><td></td>";
				$tbl .= "<td colspan='5'>JUMLAH TOTAL</td>";
				$tbl .= "<td style='width: 118.6px; height: 17px; text-align: left;'>Rp. jumlah kredit/uangharian</td>";
			
			$tbl .= "</tr>";

			$tbl.='</table>';
			'</br>';


			$html="";
			$html .= '
			<table style="height: 39px; width: 658.6px;">
				<thead>
					<tr>
						<td>Mengetahui, <br /> Kepala Balai Teknologi Pengolahan Air dan Limbah</td>
						<td></td>
						<td>Bendahara Pengeluaran</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>Ir. Setiyono, M.Si <br /> NIP. 196709011994031003</td>
						<td></td>
						<td>Nurlela, SE., M.Ak <br /> NIP. 197810032009102001</td>
					</tr>
				</thead>';
			$html.='</table>';

$pdf->writeHTML($html2, true, false, false, false, '');
$pdf->writeHTML($tbl, true, false, false, false, '');
//$pdf->writeHTML($tbl2, true, false, false, false, '');
$pdf->SetFont('helvetica', '', 9);
$pdf->Write(0, 'Tangerang, '.date("d/m/Y"), '', 0, 'R', true, 0, false, false, 0);
//$pdf->Write(0, 'Kepala Seksi KPPN Tangerang I', '', 0, 'R', true, 0, false, false, 0);
$pdf->Write(0, '', '', 0, 'R', true, 0, false, false, 0);
$pdf->writeHTML($html, true, false, false, false, '');


//Close and output PDF document
$pdf->Output('laporansurattugas.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
