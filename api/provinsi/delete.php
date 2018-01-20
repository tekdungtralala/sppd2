<?php
	include '../connect.php';
	if ('DELETE' === $_SERVER['REQUEST_METHOD']) {
		$sql = "DELETE FROM province WHERE id=" . $_GET['id'];
		$conn->query($sql);
	}
?>