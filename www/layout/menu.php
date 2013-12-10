<ul class="sf-menu" id="nav">
	<li><a href="index.php">Home</a></li>
	<li><a href="downloads.php">Downloads</a></li>
	<li><a href="serverinfo.php">Server Information</a></li>

	<li><a href="support.php">Community</a>
		<ul> <!-- (sub)dropdown COMMUNITY -->
			<!-- <li><a href="gallery.php">Gallery</a></li> -->
			<li><a href="support.php">Support</a></li>
			<li><a href="houses.php">Houses</a></li>
			<li><a href="deaths.php">Deaths</a></li>
			<li><a href="killers.php">Killers</a></li>
			<li><a href="spells.php">Spells</a></li>
		</ul>
	</li>
	<!-- <li><a href="forum.php">Forum</a></li> -->
	
	<li><a href="shop.php">Donations</a>
		<ul> <!-- (sub)dropdown SHOP -->
			<li><a href="buypoints.php">Donate</a></li>
			<li><a href="shop.php">Redeem Points</a></li>
		</ul>
	</li>
	<li><a href="guilds.php">Guilds</a>
	<?php if ($config['guildwar_enabled'] === false) { ?>
		<ul>
			<li><a href="guilds.php">Guild List</a></li>
		<!--	<li><a href="guildwar.php">Guild Wars</a></li> -->
		</ul>
	<?php } ?></li>
	
</ul>