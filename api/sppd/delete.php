<?php
	include '../connect.php';
	if ('DELETE' === $_SERVER['REQUEST_METHOD']) {
		$sql = "update sppd set" 
			. " state=0 " 
			. " where id=" . $_GET['id'];
		$conn->query($sql);
	}
?>