<?php
	// Available options: TFS_02, TFS_03
	// TFS 0.2 = TFS_02
	// TFS 0.3 = TFS_03 (If ur using 0.3.6, set $config['salt'] to false)!
	// TFS 0.4 = TFS_03
	// TFS 1.0 = TFS_10 (Under developement)
	$config['TFSVersion'] = 'TFS_10';
	
	$config['site_title'] = 'Aeia OTS';
	$config['site_title_context'] = 'Ready for a new adventure?';
	
	// ------------------------ \\
	// MYSQL CONNECTION DETAILS \\
	// ------------------------ \\
	
	// phpmyadmin username for OT server: (DONT USE "root" if ur hosting to public.).
	$config['sqlUser'] = 'faith';//'otserv';
	
	// phpmyadmin password for OT server:
	$config['sqlPassword'] = 'faith';//'zThA96eAH9u2V8Ty';
	
	// The database name to connect to. (This is usually same as username).
	$config['sqlDatabase'] = 'faith';//'otserv';
	
	// Hostname is usually localhost or 127.0.0.1.
	$config['sqlHost'] = '127.0.0.1';
	
	/* CLOCK FUNCTION
		- getClock() = returns current time in numbers.
		- getClock(time(), true) = returns current time in formatted date
		- getClock(false, true) = same as above
		- getClock(false, true, false) = get current time, don't adjust timezone 
		- echo getClock($profile_data['lastlogin'], true); = from characterprofile,
		explains when user was last logged in. */
	function getClock($time = false, $format = false, $adjust = true) {
		if (!$time) $time = time();
		// Date string representation
		$date = "d F Y (H:i)"; // 15 July 2013 (13:50)
		if ($adjust) $adjust = (-5 * 3600); // Adjust to fit your timezone.
		else $adjust = 0;
		if ($format) return date($date, $time+$adjust);
		else return $time+$adjust;
	}

	// ------------------- \\
	// CUSTOM SERVER STUFF \\
	// ------------------- \\
	
	// Vocation ids and names.
	$config['vocations'] = array(
		0 => 'No vocation',
		1 => 'Sorcerer',
		2 => 'Druid',
		3 => 'Paladin',
		4 => 'Knight',
		5 => 'Master Sorcerer',
		6 => 'Elder Druid',
		7 => 'Royal Paladin',
		8 => 'Elite Knight',
		9 => 'Witcher',
		10 => 'Priest',
		11 => 'Master Archer',
		12 => 'Gladiator',
	);
	
 $config['voc_str'] = array(
        '5' => 'Master Sorcerers',
        '6' => 'Elder Druids',
        '7' => 'Royal Paladins',
        '8' => 'Elite Knights',
        '1;5' => 'Sorcerers',
        '2;6' => 'Druids',
        '3;7' => 'Paladins',
        '4;8' => 'Knights',
    ); 
	
	// Town ids and names: (In RME map editor, open map, click CTRL + T to view towns, their names and their IDs. 
	// townID => 'townName' etc: ['3'=>'Thais']
	$config['towns'] = array(
		1 => 'Enigma City',
		6 => 'VIP Houses',
		8 => 'West City',
		9 => 'Tarmina Town',
		10 => 'Eternia',
		11 => 'Ice City',
		12 => 'Silver Town',
		13 => 'Golden Houses',
		14 => 'Desert Town',
		99 => 'Wild Town',        				   //town does not exist, its just for the site
		98 => 'Silent Town',    				  //town does not exist, its just for the site
		97 => 'House Island',  				     //town does not exist, its just for the site
		96 => 'Forgotten Island', 		        //town does not exist, its just for the site
		95 => 'Topaz Island', 			       //town does not exist, its just for the site
		94 => 'Golden Island',                //town does not exist, its just for the site
		93 => 'House Lane', 	             //town does not exist, its just for the site
	);

	// - TFS 1.0 ONLY -- HOUSE AUCTION SYSTEM!
	$config['houseConfig'] = array(
		'HouseListDefaultTown' => 1, // Default town id to display when visting house list page page.
		'minimumBidSQM' => 200, // minimum bid cost on auction (per SQM)
		'auctionPeriod' => 24 * 60 * 60, // 24 hours auction time.
		);
	
	// Leave on black square in map and player should get teleported to their selected town.
	// If chars get buggy set this position to a beginner location to force players there.
	$config['default_pos'] = array(
		'x' => 1000,
		'y' => 998,
		'z' => 7,
	);
	
	$config['war_status'] = array(
		0 => 'Pending..',
		1 => 'Accepted',
		2 => 'Rejected',
		3 => 'Cancelled',
		4 => '???',
		5 => 'Ended',
	);
	
	/* -- SUB PAGES -- 
		Some custom layouts/templates have custom pages, they can use
		this sub page functionality for that.
	*/
	$config['allowSubPages'] = true;
	
	// ---------------- \\
	// Create Character \\
	// ---------------- \\
	
	// Max characters on each account:
	$config['max_characters'] = 10;
	
	// Available character vocation users can create.
	$config['available_vocations'] = array(1, 2, 3, 4);
	
	// Available towns (specify town ids, etc: (0, 1, 2); to display 3 town options (town id 0, 1 and 2).
	$config['available_towns'] = array(1,);
	
	$config['level'] = 8;
	$config['health'] = 185;
	$config['mana'] = 40;
	$config['cap'] = 435;
	$config['soul'] = 100;
	
	$config['maleOutfitId'] = 128;
	$config['femaleOutfitId'] = 138;
	
	// No vocation info (if user select vocation id 0, we force thees configurations on him
	$config['nvlevel'] = 1;
	$config['nvHealth'] = 150;
	$config['nvMana'] = 5;
	$config['nvCap'] = 400;
	$config['nvSoul'] = 100;
	
	$config['nvForceTown'] = 0; // Force a town to no vocation even though he selected something else? 0 = no, 1 = yes.
	$config['nvTown'] = 0; // Town id to force no vocations to get to, if nvForceTown is 1.
	
	// Minimum allowed character name letters. Etc 4 letters: "K�re".
	$config['minL'] = 4;
	// Maximum allowed character name letters. Etc 20 letters: "Bobk�reolesofiesberg"
	$config['maxL'] = 20;
	
	// Maximum allowed character name words. Etc 2 words = "Bob K�re", 3 words: "Bob Arne K�re" as max char name words.
	$config['maxW'] = 4;
	
	// -------------- \\
	// WEBSITE STUFF  \\
	// -------------- \\

	// ONLY FOR TFS 0.2 (TFS 0.3/4 users don't need to care about this, as its fully loaded from db)
	$config['house'] = array(
			'house_file' => 'C:\test\Mystic Spirit_0.2.5\data\world\forgotten-house.xml',
			'price_sqm' => '500', // price per house sqm
		);

	$config['status'] = array(
		'status_check' => false, //enable or disable status checker
		'status_ip' => '127.0.0.1',
		'status_port' => "7171",
		);

	$config['validate_IP'] = true; // Only allow legal IP addresses to register and create character.
	$config['salt'] = false; // Some noob 0.3.6 servers don't support salt.
	
	// Restricted names
	$config['invalidNameTags'] = array("god", "gm", "cm", "gamemaster", "hoster", "admin", "admim", "adm", "owner", "staff");
	
	// Level requirement to create guild? (Just set it to 1 to allow all levels).
	$config['create_guild_level'] = 50;
	
	// Change Gender can be purchased in shop, or perhaps you want to allow everyone to change gender for free?
	$config['free_sex_change'] = false;
	
	// Do you need to have premium account to create a guild?
	$config['guild_require_premium'] = false;
	
	$config['guildwar_enabled'] = false;
	
	// Use htaccess rewrite? (basically this makes website.com/username work instead of website.com/characterprofile.php?name=username
	// Linux users needs to enable mod_rewrite php extention to make it work properly, so set it to false if your lost and using Linux.
	$config['htwrite'] = true;
	
	// What client version and server port are you using on this OT?
	// Used for the Downloads page.
	$config['client'] = 860; // 954 = tibia 9.54
	
	 // Download link to client. Recommended:
	 // Select download link from remere map editor website!
	 // See list of clients: http://remeresmapeditor.com/marklar.php?clients
	$config['client_download'] = 'http://remeresmapeditor.com/rmedl.php?file=tibia'. $config['client'] .'.exe';
	
	$config['port'] = 7171; // Port number to connect to your OT.
	
	// How often do you want highscores to update?
	$config['cache_lifespan'] = 1;//60 * 15; // 15 minutes.
	
	// WARNING! Account names written here will have admin access to web page!
	$config['page_admin_access'] = array(
		'dominique120',
		//'znote'
	);
	
	// Built-in FORUM
	// Enable forum, enable guildboards, level to create threads/post in them
	// How long do they have to wait to create thread or post?
	// How to design/display hidden/closed/sticky threads.
	$config['forum'] = array(
		'enabled' => false,
		'guildboard' => false,
		'level' => 5,
		'cooldownPost' => 1,//60,
		'cooldownCreate' => 1,//180,
		'hidden' => '<font color="orange">[H]</font>',
		'closed' => '<font color="red">[C]</font>',
		'sticky' => '<font color="green">[S]</font>',
	);

	// Guilds and guild war pages will do lots of queries on bigger databases.
	// So its recommended to require login to view them, but you can disable this
	// If you don't have any problems with load.
	$config['require_login'] = array(
		'guilds' => true,
		'guildwars' => false,
	);
	
	// IMPORTANT! Write a character name(that exist) that will represent website bans!
	// Or remember to create character "God Website" character exist.
	// If you don't do this, bann from admin panel won't work properly.
	$config['website_char'] = 'Dominique';
	
	//----------------\\
	// ADVANCED STUFF \\
	//----------------\\
	
	// Don't touch this unless you know what you are doing. (modifying this(key value) also requires modifications in OT files /XML/commands.xml).
	$config['ingame_positions'] = array(
		1 => 'Player',
		2 => 'Tutor',
		3 => 'Senior Tutor',
		4 => 'Gamemaster',
		5 => 'Community Manager',
		6 => 'God',
	);
	
	// Enable OS advanced feautures? false = no, true = yes
	$config['os_enabled'] = false;
	
	// What kind of computer are you hosting this website on?
	// Available options: LINUX or WINDOWS
	$config['os'] = 'WINDOWS';
	
	// Measure how much players are lagging in-game. (Not completed). 
	$config['ping'] = false;
	
	// BAN STUFF - Don't touch this unless you know what you are doing.
	// You can order the lines the way you want, from top to bot, in which order you
	// wish for them to be displayed in admin panel. Just make sure key[#] represent your describtion.
	$config['ban_type'] = array(
		4 => 'NOTATION_ACCOUNT',
		2 => 'NAMELOCK_PLAYER',
		3 => 'BAN_ACCOUNT',
		5 => 'DELETE_ACCOUNT',
		1 => 'BAN_IPADDRESS',
	);
	
	// BAN STUFF - Don't touch this unless you know what you are doing.
	// You can order the lines the way you want, from top to bot, in which order you
	// wish for them to be displayed in admin panel. Just make sure key[#] represent your describtion.
	$config['ban_action'] = array(
		0 => 'Notation',
		1 => 'Name Report',
		2 => 'Banishment',
		3 => 'Name Report + Banishment',
		4 => 'Banishment + Final Warning',
		5 => 'NR + Ban + FW',
		6 => 'Statement Report',
	);
	
	// Ban reasons, for changes beside default values to work with client,
	// you also need to edit sources (tools.cpp line 1096)
	$config['ban_reason'] = array(
		0 => 'Offensive Name',
		1 => 'Invalid Name Format',
		2 => 'Unsuitable Name',
		3 => 'Name Inciting Rule Violation',
		4 => 'Offensive Statement',
		5 => 'Spamming',
		6 => 'Illegal Advertising',
		7 => 'Off-Topic Public Statement',
		8 => 'Non-English Public Statement',
		9 => 'Inciting Rule Violation',
		10 => 'Bug Abuse',
		11 => 'Game Weakness Abuse',
		12 => 'Using Unofficial Software to Play',
		13 => 'Hacking',
		14 => 'Multi-Clienting',
		15 => 'Account Trading or Sharing',
		16 => 'Threatening Gamemaster',
		17 => 'Pretending to Have Influence on Rule Enforcement',
		18 => 'False Report to Gamemaster',
		19 => 'Destructive Behaviour',
		20 => 'Excessive Unjustified Player Killing',
		21 => 'Spoiling Auction',
	);
	
	// BAN STUFF
	// Ban time duration selection in admin panel
	// seconds => describtion
	$config['ban_time'] = array(
		3600 => '1 hour',
		21600 => '6 hours',
		43200 => '12 hours',
		86400 => '1 day',
		259200 => '3 days',
		604800 => '1 week',
		1209600 => '2 weeks',
		2592000 => '1 month',
	);
	
	
		// --------------- \\
		// SECURITY STUFF  \\
		// --------------- \\
	$config['use_token'] = false;
	$config['use_captcha'] = false;
	
	/*	Store visitor data
		Store visitor data in the database, logging every IP visitng site, 
		and how many times they have visited the site. And sometimes what
		they do on the site.
		
		This helps to prevent POST SPAM (like register 1000 accounts in a few seconds)
		and other things which can stress and slow down the server.
		
		The only downside is that database can get pretty fed up with much IP data
		if table never gets flushed once in a while. So I highly recommend you
		to configure flush_ip_logs if IPs are logged.
	*/
	
	$config['log_ip'] = true;
	
	// Flush IP logs each configured seconds, 60 * 15 = 15 minutes.
	// Set to false to entirely disable ip log flush. 
	// It is important to flush for optimal performance.
	$config['flush_ip_logs'] = 59 * 27;
	
	/*	IP SECURTY REQUIRE: $config['log_ip'] = true;
		Configure how tight this security shall be.
		Etc: You can max click on anything/refresh page
		[max activity] 15 times, within time period 10
		seconds. During time_period, you can also only
		register 1 account and 1 character.
	*/
	$config['ip_security'] = array(
		'time_period' => 10, // In seconds
		'max_activity' => 10, // page clicks/visits
		'max_post' => 6, // register, create, highscore, character search such actions
		'max_account' => 1, // register
		'max_character' => 1, // create char
		'max_forum_post' => 1, // Create threads and post in forum
	);
	
	//////////////
	/// PAYPAL ///
	//////////////

	// Write your paypal address here, and what currency you want to recieve money in.
	$config['paypal'] = array(
		'enabled' => true,
		'email' => 'Change_Paypal_mail_in_config.php', // Example: paypal@mail.com
		'currency' => 'USD',
		'points_per_currency' => 10, // 1 currency = ? points? [ONLY used to calculate bonuses]
		'success' => "http://".$_SERVER['HTTP_HOST']."/success.php",
		'failed' => "http://".$_SERVER['HTTP_HOST']."/failed.php",
		'ipn' => "http://".$_SERVER['HTTP_HOST']."/ipn.php",
		'showBonus' => true,
	);

	// Configure the "buy now" buttons prices, first write price, then how many points you get.
	// Giving some bonus points for higher donations will tempt users to donate more.
	$config['paypal_prices'] = array(
	//	price => points,
		5 => 50, 
		10 => 100,
		15 => 175, 
		30 => 375,
		50 => 650, 
	);
	
	//////////////////
	/// PAYGOL SMS ///
	//////////////////
	// !!! Paygol takes 60%~ of the money, and send aprox 40% to your paypal.
	// You can configure paygol to send each month, then they will send money to you 1 month after recieving 50+ eur.
	$config['paygol'] = array(
		'enabled' => true,
		'serviceID' => 40339,// Service ID from paygol.com
		'currency' => 'USD',
		'price' => 5,
		'points' => 25, // Remember to write same details in paygol.com!
		'name' => '25 points',
		'returnURL' => "http://".$_SERVER['HTTP_HOST']."/success.php",
		'cancelURL' => "http://".$_SERVER['HTTP_HOST']."/failed.php",
		'ipnURL' => "http://".$_SERVER['HTTP_HOST']."/paygol_ipn.php",
	);
	
	////////////
	/// SHOP ///
	////////////
	// If useDB is set to true, player can shop in-game as well using Znote LUA shop system plugin.
	$config['shop'] = array(
		'enabled' => true,
		'enableShopConfirmation' => false, // Verify that user wants to buy with popup
		'useDB' => false, // Fetch offers from database, or the below config array
		'showImage' => true,
		'imageServer' => 'items.znote.eu',
		'imageType' => 'gif',
	);

	//////////
	/// Let players sell characters.
	/////////
	$config['shop_auction'] = array(
			'characterAuction' => false, // Enable/disable this system
			'requiredLevel' => 50, // Minimum level of sold character
			'leastValue' => 10, // Lowest donation points a char can be sold for.
			'leastTime' => 24, // In hours. False to disable.
			// leastTime = Lowest duration of time an auctioned player has to be 
			// sellable before auctioneer can claim character back.
		);
	
	// If useDB is false, this array list will be used for shop offers.
	$config['shop_offers'] = array(
		
		
		// offer 3
		1 => array(
			'type' => 2,
			'itemid' => 12466, // Item to display on page
			'count' => 10,
			'describtion' => "VIP.",
			'points' => 25,
		),
		
		2 => array(
			'type' => 2,
			'itemid' => 12466, // Item to display on page
			'count' => 30,
			'describtion' => "VIP.",
			'points' => 50,
		),
		
		3 => array(
			'type' => 1,
			'itemid' => 7722,
			'count' => 1,
			'describtion' => "Magic paper! A quick read of this will take you back home, anytime and anywhere!",
			'points' => 100,
		),
		
		4 => array(
			'type' => 1,
			'itemid' => 2306,
			'count' => 1,
			'describtion' => "Aeian mana rune.(Infinite)",
			'points' => 100,
		),
		
		5 => array(
			'type' => 1,
			'itemid' => 2300,
			'count' => 1,
			'describtion' => "Aeian healing rune.(Infinite)",
			'points' => 100,
		),
	
		6 => array(
			'type' => 1,
			'itemid' => 12647,
			'count' => 1,
			'describtion' => "Aeian ring, 50% resistance to everything.",
			'points' => 100,
		),
		
		7 => array(
			'type' => 1,
			'itemid' => 12645,
			'count' => 1,
			'describtion' => "Aeian helmet, Arm:21, +20 levels in every skill.",
			'points' => 50,
		),
		
		8 => array(
			'type' => 1,
			'itemid' => 12642,
			'count' => 1,
			'describtion' => "Aeian chest plate, Arm:78.",
			'points' => 50,
		),
		
		9 => array(
			'type' => 1,
			'itemid' => 12643,
			'count' => 1,
			'describtion' => "Aeian leg piece, Arm:47, Def:49.",
			'points' => 50,
		),
		
		10 => array(
			'type' => 1,
			'itemid' => 12660,
			'count' => 1,
			'describtion' => "Aeian boots, Arm:22, speed + 300.",
			'points' => 50,
		),
		
		11 => array(
			'type' => 1,
			'itemid' => 12644,
			'count' => 1,
			'describtion' => "Aeian Shield, Def:76, extra hitpoints, extra mana and extra speed.",
			'points' => 50,
		),
		
		12 => array(
			'type' => 1,
			'itemid' => 12649,
			'count' => 1,
			'describtion' => "Aeian Sword, Atk:112, Def:83+10.",
			'points' => 50,
		),
		
		13 => array(
			'type' => 1,
			'itemid' => 7414,
			'count' => 1,
			'describtion' => "Aeian Hammer, Atk:121, Def:74.",
			'points' => 50,
		),
		
		14 => array(
			'type' => 1,
			'itemid' => 7454,
			'count' => 1,
			'describtion' => "Aeian Axe, Atk:117, Def:79.",
			'points' => 50,
		),
		
		15 => array(
			'type' => 1,
			'itemid' => 12648,
			'count' => 1,
			'describtion' => "Aeian wand, very high damage and long distance.",
			'points' => 50,
		),
		
		16 => array(
			'type' => 1,
			'itemid' => 11243,
			'count' => 1,
			'describtion' => "Aeian backpack, gives extra capacity and has 70 slots.",
			'points' => 50,
		),
			
		17 => array(
			'type' => 1,
			'itemid' => 12431,
			'count' => 1,
			'describtion' => "Aeian mage coat. Arm: 42, gives lots of extra mana and regen.",
			'points' => 50,
		),
		
		18 => array(
			'type' => 1,
			'itemid' => 12430,
			'count' => 1,
			'describtion' => "Aeian star.",
			'points' => 50,
		),
		
		19 => array(
			'type' => 1,
			'itemid' => 8858,
			'count' => 1,
			'describtion' => "Aeian bow. Super high hit chance and lots of extra damage.",
			'points' => 25,
		),
			
		20 => array(
			'type' => 1,
			'itemid' => 5947,
			'count' => 1,
			'describtion' => "Aeian crossbow.",
			'points' => 25,
		),
		
		21 => array(
			'type' => 1,
			'itemid' => 7363,
			'count' => 1,
			'describtion' => "Aeian bolt.",
			'points' => 25,
		),
		
		22 => array(
			'type' => 1,
			'itemid' => 7365,
			'count' => 1,
			'describtion' => "Aeian arrow.",
			'points' => 25,
		),
		
		23 => array(
			'type' => 1,
			'itemid' => 12676,
			'count' => 1,
			'describtion' => "Hell's helmet. Arm:12, +7 magic levels.",
			'points' => 25,
		),
		
		24 => array(
			'type' => 1,
			'itemid' => 12673,
			'count' => 1,
			'describtion' => "Hell's plate, Arm:34.",
			'points' => 25,
		),
		
		25 => array(
			'type' => 1,
			'itemid' => 12674,
			'count' => 1,
			'describtion' => "Hell's legs. Arm:12, extra distance skill.",
			'points' => 25,
		),
		
		26 => array(
			'type' => 1,
			'itemid' => 12675,
			'count' => 1,
			'describtion' => "Hell's boots. Regens 50 mana per second and adds speed.",
			'points' => 25,
		),
		
		27 => array(
			'type' => 1,
			'itemid' => 12677,
			'count' => 1,
			'describtion' => "Hell's sword. Atck:77, Def:42.",
			'points' => 25,
		),
		
		28 => array(
			'type' => 1,
			'itemid' => 12672,
			'count' => 1,
			'describtion' => "Hell's shield.",
			'points' => 25,
		),
		
		29 => array(
			'type' => 1,
			'itemid' => 10137,
			'count' => 1,
			'describtion' => "Custom house token. Give this to Dominique and he'll customize your house, depending on what you want, you might need more than one. Simple things like change a wall are a favor I'll gladly do.",
			'points' => 50,
		),
		
		30 => array(
			'type' => 1,
			'itemid' => 10136,
			'count' => 1,
			'describtion' => "Rare item token. Because some people crave rare items, give it to Dominique",
			'points' => 25,
		),
		
		31 => array(
			'type' => 3,
			'itemid' => 12666,
			'count' => 3,
			'describtion' => "Change character gender.",
			'points' => 10,
		),
		
		32 => array(
			'type' => 3,
			'itemid' => 12666,
			'count' => 0,
			'describtion' => "Change character gender.",
			'points' => 20,
		),

		34 => array(
			'type' => 1, // 1 = item id offers, 2 = premium days [itemid ignored], 3 = sex change[itemid & count ignored], 4+ = custom.
			'itemid' => 2160, // item to get in-game
			'count' => 100, //if type is 2, this represents premium days
			'describtion' => "Crystal coin.", // Describtion shown on website
			'points' => 10, // How many points this offer costs
		),
		
	);
?>