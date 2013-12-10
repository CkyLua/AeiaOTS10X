<div class="well">
	<h4>Top 5 players</h4>
	<hr class="bighr">
	<?php

	$cache = new Cache('engine/cache/topPlayer');
	if ($cache->hasExpired()) {
		$players = mysql_select_multi("SELECT `name`, `level`, `experience` FROM `players` ORDER BY `experience` DESC LIMIT 5;");
		
		$cache->setContent($players);
		$cache->save();
	} else {
		$players = $cache->load();
	}

	$count = 1;
	foreach($players as $player) {
		echo "$count - <a href='characterprofile.php?name=". $player['name']. "'>". $player['name']. "</a> (". $player['level'] .").<br>";
		$count++;
	}
	?>
	<br>
</div>