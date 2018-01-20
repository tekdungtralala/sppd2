<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update sppd_officer set" 
			. " kas_cost_center_code='" . $person['kas_cost_center_code'] . "', " 
			. " kas_description='" . $person['kas_description'] . "' " 
			. " where id="  . $person['id'];
		$conn->query($sql);
	}
?>