<?php
	include '../connect.php';
	if ('PUT' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update officer set" 
			. " name='". $person['name'] . "', " 
			. " phone_number='". $person['phone_number'] . "', " 
			. " officer_id='". $person['officer_id'] . "', " 
			. " office_class_id='". $person['office_class_id'] . "', " 
			. " office_position_id='". $person['office_position_id'] . "' " 
			. " where id=" . $person['id'];
		$conn->query($sql);
	}
?>