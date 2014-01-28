<?php require_once 'engine/init.php'; include 'layout/overall/header.php'; ?>

<h1>Downloads</h1>
<p>In order to play, you need a compatible IP changer and a Tibia client or the custom client.</p>
<br>

<h2>How to connect and play with the custom client:</h2>
<ol>
	<li>
		<a href="<?php echo $config['client_download']; ?>">Download</a> and extract the installer.
	</li>
	<li>
		Double click on the shortcut that was placed on your desktop.
	</li>
</ol>

<br>

<h2>How to connect and play with a tibia client and an IP changer:</h2>
<ol>
	<li>
		<a href="<?php echo $config['client_download']; ?>">Download</a>, install and start the tibia client if you haven't already.
	</li>
	<li>
		<a href="http://static0.otland.net/ipchanger.exe">Download</a> and run the IP changer.
	</li>
	<li>
		In the IP changer, write this in the IP field: login.aeiaots.pw
	</li>
	<li>
		In the IP changer, write this in the Port field: <?php echo $config['port']; ?>
	</li>
	<li>
		Now you can successfully login on the tibia client and play. <br>
		If you do not have an account to login with, you need to register an account <a href="register.php">HERE</a>.
	</li>
</ol>

<?php 
include 'layout/overall/footer.php'; ?>