<?php
	include '../connect.php';
	if ('PUT' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update dipa_code set" 
			. " active='0' " 
			. " where id=" . $person['id'];
		$conn->query($sql);
	}
?>