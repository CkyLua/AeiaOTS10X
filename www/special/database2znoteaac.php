<?php
require '../config.php';
require '../engine/database/connect.php';
require '../engine/function/general.php';
require '../engine/function/users.php';
?>

<h1>Old database to Znote AAC compatibility converter:</h1>
<p>Converting accounts and characters to work with Znote AAC:</p>
<?php
	// some variables
	$updated_acc = 0;
	// $updated_acc += 1;
	$updated_char = 0;
	// $updated_char += 1;
	$updated_pass = 0;
	
	// install functions
	function fetch_all_accounts() {
			$count = user_count_accounts();
			$query = mysql_query("SELECT `id` FROM `accounts`");
			
			for ($i = 0; $i < $count; $i++) {
				$row = mysql_fetch_row($query) or die(mysql_error());
				$array[] = $row[0];
			}
			
			if (isset($array)) {return $array; } else {return false;}
	}
	
	function user_count_znote_accounts() {
		return mysql_result(mysql_query("SELECT COUNT(`account_id`) from `znote_accounts`;"), 0);
	}
	
	function user_character_is_compatible($pid) {
		return mysql_result(mysql_query("SELECT COUNT(`player_id`) from `znote_players` WHERE `player_id` = '$pid';"), 0);
	}
	
	function fetch_znote_accounts() {
			$count = user_count_znote_accounts();
			$query = mysql_query("SELECT `account_id` FROM `znote_accounts`");
			for ($i = 0; $i < $count; $i++) {
				$row = mysql_fetch_row($query) or die(mysql_error());
				$array[] = $row[0];
			}
			
			if (isset($array)) {return $array; } else {return false;}
	}
	// end install functions
	
	// count all accounts, znote accounts, find out which accounts needs to be converted.
	$all_account = fetch_all_accounts();
	$znote_account = fetch_znote_accounts();
	if (isset($all_account)) {
		// <
		if ($znote_account != false) { // If existing znote compatible account exists:
			foreach ($all_account as $all) { // Loop through every element in znote_account array
				if (!in_array($all, $znote_account)) {
					$old_accounts[] = $all;
				}
			}
		} else {
			foreach ($all_account as $all) {
				$old_accounts[] = $all;
			}
		}
		// >
	}
	// end ^
	
	// Send count status
	if (isset($all_account) && $all_account !== false) {
		echo '<br>';
		echo 'Total accounts detected: '. count($all_account) .'.';
		
		if (isset($znote_account)) {
			echo '<br>';
			echo 'Znote compatible accounts detected: '. count($znote_account) .'.';
			
			if (isset($old_accounts)) {
				echo '<br>';
				echo 'Old accounts detected: '. count($old_accounts) .'.';
			}
		} else {
			echo '<br>';
			echo 'Znote compatible accounts detected: 0.';
		}
		echo '<br>';
		echo '<br>';
	} else {
		echo '<br>';
		echo 'Total accounts detected: 0.';
	}
	// end count status
	
	// validate accounts
	if (isset($old_accounts) && $old_accounts !== false) {
		$time = time();
		foreach ($old_accounts as $old) {
		
			// Make acc data compatible:
			mysql_query("INSERT INTO `znote_accounts` (`account_id`, `ip`, `created`) VALUES ('$old', '0', '$time')") or die(mysql_error());
			$updated_acc += 1;
			
			// Fetch unsalted password
			if ($config['TFSVersion'] == 'TFS_03' && $config['salt'] === true) {
				$password = user_data($old, 'password', 'salt');
				$p_pass = str_replace($password['salt'],"",$password['password']);
			}
			if ($config['TFSVersion'] == 'TFS_02' || $config['salt'] === false) {
				$password = user_data($old, 'password');
				$p_pass = $password['password'];
			}
			
			// Verify lenght of password is less than 28 characters (most likely a plain password)
			if (strlen($p_pass) < 28 && $old > 1) {
				// encrypt it with sha1
				if ($config['TFSVersion'] == 'TFS_02' || $config['salt'] === false) $p_pass = sha1($p_pass);
				if ($config['TFSVersion'] == 'TFS_03' && $config['salt'] === true) $p_pass = sha1($password['salt'].$p_pass);
				
				// Update their password so they are sha1 encrypted
				mysql_query("UPDATE `accounts` SET `password`='$p_pass' WHERE `id`='$old';") or die(mysql_error());
				$updated_pass += 1;
			}
			
		}
	}
	
	// validate players
	if ($all_account !== false) {
		$time = time();
		foreach ($all_account as $all) {
			
			$chars = user_character_list_player_id($all);
			if ($chars !== false) {
				// since char list is not false, we found a character list
				
				// Lets loop through the character list
				foreach ($chars as $c) {
					// Is character not compatible yet?
					if (user_character_is_compatible($c) == 0) {
						// Then lets make it compatible:
						
						mysql_query("INSERT INTO `znote_players` (`player_id`, `created`, `hide_char`, `comment`) VALUES ('$c', '$time', '0', '')") or die(mysql_error());
						$updated_char += 1;
						
					}
				}
			}
		}
	}
	
	echo "<br><b><font color=\"green\">SUCCESS</font></b><br><br>";
	echo 'Updated accounts: '. $updated_acc .'<br>';
	echo 'Updated characters: : '. $updated_char .'<br>';
	echo 'Detected:'. $updated_pass .' accounts with plain passwords. These passwords has been given sha1 encryption.<br>';
	echo '<br>All accounts and characters are compatible with Znote AAC<br>';
?>