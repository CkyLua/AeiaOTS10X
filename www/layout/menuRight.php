<!-- Right menu -->
<div class="span3">
	<br>
	<?php 
	include 'layout/widgets/highscore.php';
	if ($config['TFSVersion'] === 'TFS_03') include 'layout/widgets/houses.php';
	include 'layout/widgets/topplayers.php';
	?>
</div>