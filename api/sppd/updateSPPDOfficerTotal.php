<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update sppd_officer set" 
			. " transportation_cost='" . $person['transportation_cost'] . "', " 
			. " total_cost='" . $person['total_cost'] . "', " 
			. " total_cost_rp='" . $person['total_cost_rp'] . "' " 
			. " where id="  . $person['id'];
		$conn->query($sql);
	}
?>