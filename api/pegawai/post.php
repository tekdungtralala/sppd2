<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "insert into officer values(NULL, " 
			. " '" . $person['name'] . "', " 
			. " '" . $person['officer_id'] . "', " 
			. " '" . $person['phone_number'] . "', " 
			. " '" . $person['office_class_id'] . "', " 
			. " '" . $person['office_position_id'] . "' " 
			. " )";
		$conn->query($sql);
	}
?>