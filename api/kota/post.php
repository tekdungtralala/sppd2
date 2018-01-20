<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "insert into city values(NULL, " 
			. " '" . $person['name'] . "', " 
			. " '" . $person['province_id'] . "' " 
			. " )";
		$conn->query($sql);
		echo $conn->insert_id;
	}
?>