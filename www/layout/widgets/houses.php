<div class="well">
	<h3>Houses</h3>
	<hr class="bighr">
	<div class="inner">
		<form action="houses.php" method="post">
		
			Select town:<br>
			<select name="selected">
			<?php
			foreach ($config['towns'] as $id => $name) echo '<option value="'. $id .'">'. $name .'</option>';
			?>
			</select> 
			<?php
				/* Form file */
				Token::create();
			?>
			<input class="btn btn-info" type="submit" value="Fetch houses">
		</form>
	</div>
</div>