<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update sppd set" 
			. " transportation_type='" . $person['transportation_type'] . "', " 
			. " column_e='" . $person['column_e'] . "', " 
			. " column_f='" . $person['column_f'] . "' " 
			. " where id="  . $person['id'];
		$conn->query($sql);
	}
?>