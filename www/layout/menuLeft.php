<!-- Left menu -->
<div class="span3">
	<br>
	<?php 
	if (user_logged_in() === true) {
		include 'layout/widgets/loggedin.php'; 
	} else {
		include 'layout/widgets/login.php'; 
	}
	if (user_logged_in() && is_admin($user_data)) include 'layout/widgets/Wadmin.php'; 
	include 'layout/widgets/serverinfo.php';
	?>
</div>