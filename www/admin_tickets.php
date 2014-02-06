<?php require_once 'engine/init.php'; include 'layout/overall/header.php'; 
protect_page();
admin_only($user_data);
STS::checkIfSTSEnable($config['STS_ENABLE']);
?>
<link rel="stylesheet" href="supportTicketCss.css" type="text/css">
<style type="text/css">
	.supportTicketCasesAdmin img {
		float:right;
	}
</style>
<?php
$adminComment = getValue($_POST['adminComment']);
if ($adminComment !== false) {
	$errors = false;
	$getTicketIdFromUrl = $_GET['caseId'];
	$fromAdmin = $config['ADMIN_SUPPORT_TICKET_NAME'];
	$timeCreated = date('l jS \of F Y h:i:s A');
	if (strlen($adminComment) > $config['TICKET_SYSTEM_COMMENT_LENGTH']) {
		echo "<div class='alert-message error'>
			    <div class='box-icon'></div>
			        Comment message is to long, max ".$config['TICKET_SYSTEM_COMMENT_LENGTH']." letters!
			</div>";
			$errors = true;
	}
	if (!$errors) {
		echo "<div class='alert-message success'>
			    <div class='box-icon'></div>
			        Your comment has been inserted to database, and this page will refresh in 3 seconds!
			</div>";
		echo '<meta http-equiv="refresh" content="3">';
		mysql_query("INSERT INTO `supportTickets_comments` (ticketId,comment,from_user,date_post) VALUES ('$getTicketIdFromUrl','$adminComment','$fromAdmin','$timeCreated') ");
		mysql_query("UPDATE `supportTickets` SET `status`='Answered' WHERE `id`='$getTicketIdFromUrl'  ");

	}
}
if (isset($_GET['caseId'])) {
	?>
		<style type="text/css">
			.contentBoxSupportTicketFetchAdmin {
				display:none;
			}
		</style>
	<?php
	$urlCaseId = $_GET['caseId'];
	$getInfoAboutCase = mysql_select_multi("SELECT * FROM `supportTickets` WHERE `id`='$urlCaseId'");
	$getInto = mysql_select_multi("SELECT * FROM `supportTickets_comments` WHERE `ticketId`='$urlCaseId'");
	foreach ($getInfoAboutCase as $fetchCase) { ?>
		<div class="contentBoxSupportTicketFetchAdminCase">
			Ticket status: <?php echo $fetchCase['status']; ?>
			<div class="supportTicketCases">
				Category: <?php echo $fetchCase['category']; ?><br> 
				Created: <?php echo $fetchCase['created']; ?><br> 
				Description: <?php echo $fetchCase['contentText']; ?><br> 
			</div>
					<!-- Comments Field -->
		<h2>Comments:</h2>
		<?php 

		if (empty($getInto)) {
			echo "<div class='alert-message error'>
			    <div class='box-icon'></div>
			        No comments yet!
			</div>";
		} else {
		foreach ($getInto as $getOuto) { ?>
		<div class="supportTicketCases">
			From <?php echo $getOuto['from_user']; ?>: <?php echo $getOuto['comment']; ?>
		</div>
		<?php } }?>
			<a href="admin_tickets.php">Back..</a>
		</div>

			<div class="contentBoxSupportTicketFetch"> <!-- Content box -->
		<form method="POST" action="">
			<label>Comment</label>
			<input type="text" name="adminComment"> -- Comment should not be longer than 140 letters!
			<input type="submit" value="Comment!">
		</form>
	</div>

	<?php }
}

?>


	<div class="contentBoxSupportTicketFetchAdmin"> <!-- Content box -->
		<img src='supportTicketImg/errorWait.png' width='16' height='16'> = Still need answer
		<img src='supportTicketImg/accept.png' width='16' height='16'> = Answered
		<img src='supportTicketImg/lock.png' width='16' height='16'> = Closed<br>

		Order by:<select name="mydropdown" class="styled" onChange="document.location = this.value" value="GO">
	        <option value="admin_tickets.php">Select order by</option>
	        <option value="admin_tickets.php">All</option>
	        <option value="?orderBy=Answered">Answered</option>
	        <option value="?orderBy=Waiting">Need Answer</option>
	        <option value="?orderBy=Closed">Closed</option>
		</select>

		<?php 
		$getOrderId = $_GET['orderBy'];
		if (isset($getOrderId)) {
			$getAdminSupport = mysql_select_multi("SELECT * FROM `supportTickets` WHERE `status`='$getOrderId'");
		} else {
			$getAdminSupport = mysql_select_multi("SELECT * FROM `supportTickets`");
		}

		foreach ($getAdminSupport as $gAdmn) { ?>
			<div class="supportTicketCases">
				<a href="?caseId=<?php echo $gAdmn['id']; ?>">Case by account <?php echo $gAdmn['accountName']; ?></a> arrived <?php echo $gAdmn['created']; ?>
				<?php 
					if ($gAdmn['status'] == "Waiting") {
						echo "<img src='supportTicketImg/errorWait.png' width='16' height='16'>";
					} elseif ($gAdmn['status'] == "Answered") {
						echo "<img src='supportTicketImg/accept.png' width='16' height='16'>";
					} elseif ($gAdmn['status'] == "Closed") {
						echo "<img src='supportTicketImg/lock.png' width='16' height='16'>";
					}
				?>
			</div>
		<?php } ?>
	</div> <!-- Content box end -->
 <?php include 'layout/overall/footer.php'; ?>