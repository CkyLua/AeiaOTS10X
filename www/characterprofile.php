<?php require_once 'engine/init.php'; include 'layout/overall/header.php'; 
if ($config['log_ip']) {
	znote_visitor_insert_detailed_data(4);
}
if (isset($_GET['name']) === true && empty($_GET['name']) === false) {
	$name = $_GET['name'];
	
	if (user_character_exist($name)) {
		$user_id = user_character_id($name);
		if ($config['TFSVersion'] == 'TFS_10') {
			$profile_data = user_character_data($user_id, 'name', 'level', 'vocation', 'lastlogin');
			$profile_data['online'] = user_is_online_10($user_id);
		} else $profile_data = user_character_data($user_id, 'name', 'level', 'vocation', 'lastlogin', 'online');
		$profile_znote_data = user_znote_character_data($user_id, 'created', 'hide_char', 'comment');
		
		$guild_exist = false;
		if (get_character_guild_rank($user_id) > 0) {
			$guild_exist = true;
			$guild = get_player_guild_data($user_id);
			$guild_name = get_guild_name($guild['guild_id']);
		}
		?>
		
		<?php
			$vocation = isPromoted($user_id) == 1 ? 4 : 0;
			$extra = 0;
			switch(getPromotedLevel($user_id))
			{
				case 0: $extra = 0;
					break;
				case 1: $extra = 4;
					break;
				case 2: $extra = 8;
					break;	
			}		
		?>		


		<!-- PROFILE MARKUP HERE-->
			<?php ?>
			<h1><font class="profile_font" name="profile_font_header">Profile: <?php echo $profile_data['name']; ?></font></h1>
			<ul class="unstyled">
				<li><font class="profile_font" name="profile_font_level">Level: <?php echo $profile_data['level']; ?></font></li>
				<li><font class="profile_font" name="profile_font_vocation">Vocation: <?php echo vocation_id_to_name($profile_data['vocation']+$extra); ?></font></li>
				<?php 
				if ($guild_exist) {
				?>
				<li><font class="profile_font" name="profile_font_vocation"><b><?php echo $guild['rank_name']; ?></b> of <a href="guilds.php?name=<?php echo $guild_name; ?>"><?php echo $guild_name; ?></a></font></li>
				<?php
				}
				?>
				<li><font class="profile_font" name="profile_font_lastlogin">Last Login: <?php
					if ($profile_data['lastlogin'] != 0) {
						echo getClock($profile_data['lastlogin'], true, false);
					} else {
						echo 'Never.';
					}
					
				?></font></li>
				<li><font class="profile_font" name="profile_font_status">Status:</font> <?php 
						if ($config['TFSVersion'] == 'TFS_10') {
							if ($profile_data['online']) {
								echo '<font class="profile_font" name="profile_font_online" color="green"><b>ONLINE</b></font>';
							} else {
								echo '<font class="profile_font" name="profile_font_online" color="red"><b>OFFLINE</b></font>';
							}
						} else {
							if ($profile_data['online'] == 1) {
								echo '<font class="profile_font" name="profile_font_online" color="green"><b>ONLINE</b></font>';
							} else {
								echo '<font class="profile_font" name="profile_font_online" color="red"><b>OFFLINE</b></font>';
							}
						}
					?></li>
				<li><font class="profile_font" name="profile_font_created">Created: <?php echo getClock($profile_znote_data['created'], true); ?></font></li>
				<li><font class="profile_font" name="profile_font_comment">Comment:</font> <br><textarea name="profile_comment_textarea" cols="70" rows="10" readonly="readonly" class="span12"><?php echo $profile_znote_data['comment']; ?></textarea></li>
				<!-- DEATH LIST -->
				<li>
					<b>Death List:</b><br>
					<?php
					if ($config['TFSVersion'] == 'TFS_02' || $config['TFSVersion'] == 'TFS_10') {
						$array = user_fetch_deathlist($user_id);
						if ($array) {
							//data_dump($array, false, "Data:");
							?>
							<ul>
								<?php
								// Design and present the list
								foreach ($array as $value) {
									echo '<li>';
									// $value[0]
									$value['time'] = getClock($value['time'], true);								
									if ($value['is_player'] == 1) {
										$value['killed_by'] = 'player: <a href="characterprofile.php?name='. $value['killed_by'] .'">'. $value['killed_by'] .'</a>';
									} else {
										$value['killed_by'] = 'monster: '. $value['killed_by'] .'.';
									}
									
									echo '['. $value['time'] .'] Killed at level '. $value['level'] .' by '. $value['killed_by'];
									echo '</li>';
								}
							?>
							</ul>
							<?php
							} else {
								echo '<b><font color="green">This player has never died.</font></b>';
							}
							//Done.
						} else if ($config['TFSVersion'] == 'TFS_03') {
							$array = user_fetch_deathlist03($user_id);
							if ($array) {
							?>
							<ul>
								<?php
								// Design and present the list
								foreach ($array as $value) {
									echo '<li>';
									$value[3] = user_get_killer_id(user_get_kid($value['id']));
									if ($value[3] !== false && $value[3] >= 1) {
										$namedata = user_character_data((int)$value[3], 'name');
										if ($namedata !== false) {
											$value[3] = $namedata['name'];
											$value[3] = 'player: <a href="characterprofile.php?name='. $value[3] .'">'. $value[3] .'</a>';
										} else {
											$value[3] = 'deleted player.';
										}
									} else {
										$value[3] = user_get_killer_m_name(user_get_kid($value['id']));
										if ($value[3] === false) $value[3] = 'deleted player.';
									}
									echo '['. getClock($value['date'], true) .'] Killed at level '. $value['level'] .' by '. $value[3];
									echo '</li>';
								}
							?>
							</ul>
							<?php
							} else {
								echo '<b><font color="green">This player has never died.</font></b>';
							}
						}
						?>
				</li>
				
				<!-- END DEATH LIST -->
				
				<!-- CHARACTER LIST -->
				<?php
				if (user_character_hide($profile_data['name']) != 1 && user_character_list_count(user_character_account_id($name)) > 1) {
				?>
					<li>
						<b>Other visible characters on this account:</b><br>
						<?php
						$characters = user_character_list(user_character_account_id($profile_data['name']));
						// characters: [0] = name, [1] = level, [2] = vocation, [3] = town_id, [4] = lastlogin, [5] = online
						if ($characters && count($characters) > 1) {
							?>
							<table id="characterprofileTable" class="table table-striped table-hover">
								<tr class="yellow">
									<th>
										Name:
									</th>
									<th>
										Level:
									</th>
									<th>
										Vocation:
									</th>
									<th>
										Last login:
									</th>
									<th>
										Status:
									</th>
								</tr>
								<?php
								// Design and present the list
								foreach ($characters as $char) {
									if ($char['name'] != $profile_data['name']) {
										if (hide_char_to_name(user_character_hide($char['name'])) != 'hidden') {
											echo '<tr>';
											echo '<td><a href="characterprofile.php?name='. $char['name'] .'">'. $char['name'] .'</a></td>';
											echo '<td>'. $char['level'] .'</td>';
											echo '<td>'. $char['vocation'] .'</td>';
											echo '<td>'. $char['lastlogin'] .'</td>';
											echo '<td>'. $char['online'] .'</td>';
											echo '</tr>';
										}
									}
								}
							?>
							</table>
							<?php
							} else {
								echo '<b><font color="green">This player has never died.</font></b>';
							}
								//Done.
							?>
					</li>
				<?php
				}
				?>
				<!-- END CHARACTER LIST -->
				<li><font class="profile_font" name="profile_font_share_url">Address: <a href="<?php 
					if ($config['htwrite']) echo "http://".$_SERVER['HTTP_HOST']."/". $profile_data['name'];
					else echo "http://".$_SERVER['HTTP_HOST']."/characterprofile.php?name=". $profile_data['name'];
					
				?>"><?php
					if ($config['htwrite']) echo "http://".$_SERVER['HTTP_HOST']."/". $profile_data['name'];
					else echo "http://".$_SERVER['HTTP_HOST']."/characterprofile.php?name=". $profile_data['name'];
				?></a></font></li>
			</ul>
		<!-- END PROFILE MARKUP HERE-->
		
		<?php
	} else {
		echo htmlentities(strip_tags($name, ENT_QUOTES)).' does not exist.';
	}
} else {
	header('Location: index.php');
}

include 'layout/overall/footer.php'; ?>