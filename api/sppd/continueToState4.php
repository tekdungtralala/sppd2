<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$sql = "update sppd set" 
			. " state=4, " 
			. " dipa_code_id=(select id from dipa_code where active = 1 ), " 
			. " date_service_cost_approve='".$_GET['date']."'"
			. " where id=" . $_GET['id'];
		$conn->query($sql);
	}
?>