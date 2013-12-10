<?php
require_once 'engine/init.php';
logged_in_redirect();
include 'layout/overall/header.php'; 

if (empty($_POST) === false) {
	// $_POST['']
	$required_fields = array('username', 'password', 'password_again', 'email', 'selected');
	foreach($_POST as $key=>$value) {
		if (empty($value) && in_array($key, $required_fields) === true) {
			$errors[] = 'You need to fill in all fields.';
			break 1;
		}
	}
	
	// check errors (= user exist, pass long enough
	if (empty($errors) === true) {
		/* Token used for cross site scripting security */
		if (!Token::isValid($_POST['token'])) {
			$errors[] = 'Token is invalid.';
		}

		if ($config['use_captcha']) {
			include_once 'captcha/securimage.php';
			$securimage = new Securimage();
			if ($securimage->check($_POST['captcha_code']) == false) {
			  $errors[] = 'Captcha image verification was submitted wrong.';
			}
		}
		
		if (user_exist($_POST['username']) === true) {
			$errors[] = 'Sorry, that username already exist.';
		}
		
		// Don't allow "default admin names in config.php" access to register.
		$isNoob = in_array(strtolower($_POST['username']), $config['page_admin_access']) ? true : false;
		if ($isNoob) {
			$errors[] = 'This account name is blocked for registration.';
		}
		if (strtolower($_POST['username']) === true) {
			$errors[] = 'Sorry, that username already exist.';
		}
		if (preg_match("/^[a-zA-Z0-9]+$/", $_POST['username']) == false) {
			$errors[] = 'Your account name can only contain characters a-z, A-Z and 0-9.';
		}
		// name restriction
		$resname = explode(" ", $_POST['username']);
		foreach($resname as $res) {
			if(in_array(strtolower($res), $config['invalidNameTags'])) {
				$errors[] = 'Your username contains a restricted word.';
			}
			else if(strlen($res) == 1) {
				$errors[] = 'Too short words in your name.';
			}
		}
		// end name restriction
		if (strlen($_POST['password']) < 6) {
			$errors[] = 'Your password must be at least 6 characters.';
		}
		if (strlen($_POST['password']) > 33) {
			$errors[] = 'Your password must be less than 33 characters.';
		}
		if ($_POST['password'] !== $_POST['password_again']) {
			$errors[] = 'Your passwords do not match.';
		}
		if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false) {
			$errors[] = 'A valid email address is required.';
		}
		if (user_email_exist($_POST['email']) === true) {
			$errors[] = 'That email address is already in use.';
		}
		if ($_POST['selected'] != 1) {
			$errors[] = 'You are only allowed to have an account if you accept the rules.';
		}
		if (validate_ip(getIP()) === false && $config['validate_IP'] === true) {
			$errors[] = 'Failed to recognize your IP address. (Not a valid IPv4 address).';
		}
	}
}

?>
<h1>Register Account</h1>
<?php
if (isset($_GET['success']) && empty($_GET['success'])) {
	echo 'Congratulations! Your account has been created. You may now login to create a character.';
} else {
	if (empty($_POST) === false && empty($errors) === true) {
		if ($config['log_ip']) {
			znote_visitor_insert_detailed_data(1);
		}
		//Register
		$register_data = array(
			'name'	=>	$_POST['username'],
			'password'	=>	$_POST['password'],
			'email'		=>	$_POST['email'],
			'ip'	=>	ip2long(getIP()),
			'created'	=>	time()
		);
		
		user_create_account($register_data);
		header('Location: register.php?success');
		exit();
		//End register
		
	} else if (empty($errors) === false){
		echo '<font color="red"><b>';
		echo output_errors($errors);
		echo '</b></font>';
	}
?>
	<form action="" method="post">
		<ul>
			<li>
				Account Name:<br>
				<input type="text" name="username">
			</li>
			<li>
				Password:<br>
				<input type="password" name="password">
			</li>
			<li>
				Password again:<br>
				<input type="password" name="password_again">
			</li>
			<li>
				Email:<br>
				<input type="text" name="email">
			</li>
			<?php
			if ($config['use_captcha']) {
				?>
				<li>
					<b>Write the image symbols in the text field to verify that you are a human:</b>
					<img id="captcha" src="captcha/securimage_show.php" alt="CAPTCHA Image" /><br>
					<input type="text" name="captcha_code" size="10" maxlength="6" />
					<a href="#" onclick="document.getElementById('captcha').src = 'captcha/securimage_show.php?' + Math.random(); return false">[ Different Image ]</a><br><br>
				</li>
				<?php
			}
			?>
			<li>
				<h2>Server Rules</h2>
				<p>-The golden rule: Have fun.</p>
				<p>-If you get pwn3d, don't hate the game.</p>
				<p>-Mondays is PVP days, be carefull.</p>
				<p>-Multiclienting is allowed, but dont abuse it.</p>
				<p>-Staff members will NEVER spwn you free items, or add levels.</p>
				<p>-If you need help, use the help channel or talk to a tutor or gamemaster, they are here to help.</p>
				<p>-If you dont use your house in a while(45 days) and someone wants it, your items will go to your depot and you will no longer own the house.</p>
				<p>-No <a href='http://en.wikipedia.org/wiki/Cheating' target="_blank">cheating</a> allowed.</p>
				<p>-Absolutely no <a href='http://en.wikipedia.org/wiki/Internet_bot' target="_blank">botting</a> allowed, it will get you banned.</p>
				<p>-The staff can delete, ban, do whatever they want with your account and your <br>
					submitted information. (Including exposing and logging your IP).</p>
				<p></p>
			</li>
			<li>
				Do you agree to follow the server rules?<br>
				<select name="selected">
				  <option value="1">Yes.</option>
				  <option value="2">No.</option>
				</select>
			</li>
			<?php
				/* Form file */
				Token::create();
			?>
			<li>
				<input type="submit" value="Create Account">
			</li>
		</ul>
	</form>
<?php 
}
include 'layout/overall/footer.php';
?>