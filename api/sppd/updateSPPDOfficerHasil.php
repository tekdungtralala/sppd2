<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update sppd set" 
			. " report_title='" . $person['report_title'] . "', " 
			. " report_content='" . $person['report_content'] . "', " 
			. " report_created_date='" . $person['report_created_date'] . "' " 
			. " where id="  . $person['id'];
		$conn->query($sql);
	}
?>