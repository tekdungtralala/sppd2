<?php
	include '../connect.php';
	if ('DELETE' === $_SERVER['REQUEST_METHOD']) {
		$sql = "DELETE FROM budget WHERE name = '" . $_GET['name'] . "' and sub_budget = '" . $_GET['sub_budget'] . "'";
		$conn->query($sql);
		echo $sql;
	}
?>