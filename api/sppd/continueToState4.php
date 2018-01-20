<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$sql = "update sppd set" 
			. " state=4, " 
			. " date_service_cost_approve='".$_GET['date']."'"
			. " where id=" . $_GET['id'];
		$conn->query($sql);
	}
?>