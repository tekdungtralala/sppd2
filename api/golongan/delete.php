<?php
	include '../connect.php';
	if ('DELETE' === $_SERVER['REQUEST_METHOD']) {
		$sql = "DELETE FROM office_class WHERE id=" . $_GET['id'];
		$conn->query($sql);
	}
?>