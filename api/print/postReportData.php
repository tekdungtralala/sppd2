<?php
	include '../connect.php';
	$startDate = $_GET['startDate'];
	$endDate = $_GET['endDate'];

	$json = file_get_contents('php://input');
	$data = (array) json_decode($json);
	session_start();
	$_SESSION["data"] = $data;
	$_SESSION["startDate"] = $startDate;
	$_SESSION["endDate"] = $endDate;
	$_SESSION["totalRp"] = $_GET['totalRp'];
?>