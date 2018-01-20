<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "insert into travel_expenses values(NULL, " 
			. " '" . $person['office_class_id'] . "', " 
			. " '" . $person['province_id'] . "', " 
			. " '" . $person['daily_cost'] . "', " 
			. " '" . $person['lodging_cost'] . "' " 
			. " )";
		$conn->query($sql);
		echo $sql;
	}
?>