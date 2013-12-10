<div class="well">
	<div class="inner">
		<ul style="list-style: none;">
			<?php
			$status = true;
			if ($config['status']['status_check']) {
				@$sock = fsockopen ($config['status']['status_ip'], $config['status']['status_port'], $errno, $errstr, 1);
				if(!$sock) {
					echo "<span class='btn btn-danger' style='font-weight:bold;'>Server Offline!</span><br/>";
					$status = false;
				}
				else {
					$info = chr(6).chr(0).chr(255).chr(255).'info';
					fwrite($sock, $info);
					$data='';
					while (!feof($sock))$data .= fgets($sock, 1024);
					fclose($sock);
					echo "<span class='btn btn-success' style='font-weight:bold;'>Server Online!</span><br />";
				}
			}
			if ($status) {
				?>
				<li><a href="onlinelist.php">Players online: <?php echo user_count_online();?></a></li>
				<?php
			}
			?>
			<br>
			<li class="btn">Registered accounts: <?php echo user_count_accounts();?></li>
		</ul>
	</div>
</div>