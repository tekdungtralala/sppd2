<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		if ( $person['id'] ) {
			$sppdID = $person['id'];
			$sql4 = "UPDATE sppd SET "
				. " reference_number = '" . $person['reference_number'] . "'"
				. ",start_date = '" . $person['start_date'] . "'"
				. ",end_date = '" . $person['end_date'] . "'"
				. ",total_day = '" . $person['total_day'] . "'"
				. ",base = '" . $person['base'] . "'"
				. ",objective = '" . $person['objective'] . "'"
				. ",task = '" . $person['task'] . "'"
				. ",description = '" . $person['description'] . "'"
				. ",chief_name = '" . $person['chief_name'] . "'"
				. " WHERE id = ". $sppdID;
			$conn->query($sql4);
			$sql3 = "DELETE FROM sppd_officer WHERE sppd_id = ". $sppdID;
			$conn->query($sql3);
		} else {
			$sql = "insert into sppd (id, state, reference_number, start_date, end_date, total_day, base, objective, task, description, chief_name) values("
				. " NULL, "
				. " 1, "
				. " '" . $person['reference_number'] . "', " 
				. " '" . $person['start_date'] . "', " 
				. " '" . $person['end_date'] . "', " 
				. " '" . $person['total_day'] . "', " 
				. " '" . $person['base'] . "', " 
				. " '" . $person['objective'] . "', " 
				. " '" . $person['task'] . "', " 
				. " '" . $person['description'] . "', " 
				. " '" . $person['chief_name'] . "' " 
				. " );";
			$conn->query($sql);
			$sppdID = $conn->insert_id;
		}
		$sql1 = "select max(id) as max from sppd_officer";
		$result1 = $conn->query($sql1);
		$row1 = $result1->fetch_assoc();
		$maxId = $row1['max'] + 1;
		foreach ($person['officers'] as $o) {
			$sqlO = "insert into sppd_officer (id, kas_reference_number, kas_year, reference_number, sppd_id, committed_officer, committed_officer_id, name, officer_id, office_class_name, office_position_name) values(null, "
				. " '" . $maxId . "/BKK/BTPAL/BPPT/I/2018', " 
				. " '2017', "
				. " '" . $maxId . "/SPD/BTPAL/I/2018', " 
				. $sppdID . ", " 
				. " '" . $person['committed_officer'] . "',"
				. " '" . $person['committed_officer_id'] . "',"
				. " '" . $o->name . "',"
				. " '" . $o->officer_id . "',"
				. " '" . $o->officeClass->name . "',"
				. " '" . $o->officePosition->name . "');";
			$conn->query($sqlO);
			$maxId = $maxId + 1;
		}
	}
?>