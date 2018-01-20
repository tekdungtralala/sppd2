<?php
	include '../connect.php';
	if ('PUT' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update budget set" 
			. " name='". $person['name'] . "' " 
			. " where name='" . $person['old_name'] ."'";
		$conn->query($sql);
		echo $sql;
	}
?>