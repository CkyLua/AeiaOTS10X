<div class="well">
	<h3>Login / Register</h3>
	<hr class="bighr">
	<div class="inner">
		<form action="login.php" method="post">
		<ul id="login" style="list-style: none;">
			<li>
				Userame: <br>
				<input type="text" name="username">
			</li>
			<li>
				Password: <br>
				<input type="password" name="password">
			</li>
				<input class="btn btn-primary" type="submit" value="Log in"> <a  class="btn btn-info" href="register.php">Register</a>
			</li>
			<br>
			<font size="1">- Lost <a href="recovery.php?mode=username">username</a> or <a href="recovery.php?mode=password">password</a>?</font>
			<?php
				/* Form file */
				Token::create();
			?>
		</ul>
		</form>
	</div>
</div>