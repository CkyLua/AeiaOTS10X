<?php
$accountNameGet = $user_data['name'];
$getSupportTicketsUnread = mysql_query("SELECT * FROM `supportTickets` WHERE `status`='Answered' AND `accountName`='$accountNameGet'");
$result = mysql_num_rows($getSupportTicketsUnread);
?>
<div class="well">
	<h2>Welcome, <?php echo $user_data['name']; ?>.</h2>
	<div class="inner">
		<ul>
			<li>
				<a href='myaccount.php'>My Account</a>
			</li>
			<li>
				<a href='createcharacter.php'>Create Character</a>
			</li>
			<li>
				<a href='changepassword.php'>Change Password</a>
			</li>
			<li>
				<a href='settings.php'>Settings</a>
			</li>
			<li>
				<?php if ($config['STS_ENABLE'] === true) { ?>
				<a href='supportTicket.php'>Support Tickets: [<?php echo $result; ?>] new</a>
				<?php }  ?>
			</li>
			<li>
				<a href='logout.php'>Logout</a>
			</li>
		</ul>
	</div>
</div>