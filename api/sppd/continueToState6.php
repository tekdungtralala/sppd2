<?php
	include '../connect.php';
	if ('POST' === $_SERVER['REQUEST_METHOD']) {
		$sql = "update sppd set" 
			. " state=6 " 
			. " where id=" . $_GET['id'];
		$conn->query($sql);
	}
?>