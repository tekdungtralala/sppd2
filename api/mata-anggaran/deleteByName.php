<?php
	include '../connect.php';
	if ('DELETE' === $_SERVER['REQUEST_METHOD']) {
		$sql = "DELETE FROM budget WHERE name = '" . $_GET['name'] . "'";
		$conn->query($sql);
	}
?>