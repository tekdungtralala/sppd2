<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "update sppd_officer set" 
			. " daily_cost='" . $person['daily_cost'] . "', " 
			. " lodging_cost='" . $person['lodging_cost'] . "', " 
			. " total_daily_cost='" . $person['total_daily_cost'] . "', " 
			. " total_lodging_cost='" . $person['total_lodging_cost'] . "', " 
			. " treasurer_officer='" . $person['treasurer_officer'] . "', " 
			. " treasurer_officer_id='" . $person['treasurer_officer_id'] . "'" 
			. " where id="  . $person['id'];
		$conn->query($sql);
	}
?>