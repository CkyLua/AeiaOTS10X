<?php
/*
Should not be used unless you gonna error check the page.
// error_reporting(E_ALL);
// ini_set('display_errors', true);
*/
class STS {
	public static function checkIfSTSEnable($c) {
		if ($c === false) {
			die("STS System is not enabled");
		} else return true;
	}

	public function checkOwnerOfCase($url,$acc) {
		$query = mysql_query("SELECT * FROM `supportTickets` WHERE `id`='$url' AND `accountName`='$acc' ");
		$result = mysql_num_rows($query);
		if ($result === 0) {
			die("You don't have access to this page.");
		} else return true;
	}
}

?>