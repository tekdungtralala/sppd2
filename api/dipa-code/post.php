<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$json = file_get_contents('php://input');
		$person = (array) json_decode($json);
		$sql = "insert into dipa_code values(NULL, " 
			. " '" . $person['fiscal_year'] . "', "
			. " '" . $person['institution'] . "', "
			. " '" . $person['organizational_unit'] . "', "
			. " '" . $person['city'] . "', "
			. " '" . $person['work_unit'] . "', "
			. " '" . $person['document'] . "', "
			. " '" . $person['code_number'] . "', "
			. " '" . $person['date'] . "', "
			. " '" . $person['kppn'] . "', "
			. " " . ($person['parent_id'] ? $person['parent_id'] : ("NULL")) . ", "
			. " " . $person['revisi'] . ", " 
			. " '" . $person['active'] . "' " 
			. " )";
		echo $sql;
		$conn->query($sql);
		echo $conn->insert_id;
	}
?>