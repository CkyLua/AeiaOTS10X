<?php require_once 'engine/init.php';
protect_page();
include 'layout/overall/header.php'; 
STS::checkIfSTSEnable($config['STS_ENABLE']);
?>
<link rel="stylesheet" href="supportTicketCss.css" type="text/css">
<?php
$categorySupport = getValue($_POST['categorySupport']);
$supportText = getValue($_POST['supportText']);

if ($categorySupport !== false && $supportText !== false) {
	$errors = false;
	if (strlen($supportText) > $config['TICKET_SYSTEM_CONTENT_LENGTH']) {
		echo "<div class='alert-message error'>
			    <div class='box-icon'></div>
			        Content text is to long, maximum ".$config['TICKET_SYSTEM_CONTENT_LENGTH']." letters!
			</div>";
		$errors = true;
	}
	$insertDate = date('l jS \of F Y h:i:s A');
	if (!$errors) {
		$accountNameSupport = $user_data['name'];
		echo "<div class='alert-message success'>
			    <div class='box-icon'></div>
			        Support ticket has been created!
			</div>";
		mysql_query("INSERT INTO `supportTickets` (category, contentText, accountName, status, created) VALUES ('$categorySupport', '$supportText', '$accountNameSupport', 'Waiting', '$insertDate')");
	}
}



if (isset($_GET['tickedId'])) {
	$commentText = getValue($_POST['commentText']);
	$ticketdIdUrl = $_GET['tickedId'];

	$acc = $user_data['name'];
	STS::checkOwnerOfCase($ticketdIdUrl,$acc);

	$getIn = mysql_select_multi("SELECT * FROM `supportTickets` WHERE `id`='$ticketdIdUrl'");
	$getInto = mysql_select_multi("SELECT * FROM `supportTickets_comments` WHERE `ticketId`='$ticketdIdUrl'");

	if ($commentText !== false) {
		$errors = false;
		if (strlen($commentText) > $config['TICKET_SYSTEM_COMMENT_LENGTH']) {
			$errors = true;
			echo "<div class='alert-message error'>
			    <div class='box-icon'></div>
			        Comment message is to long, max ".$config['TICKET_SYSTEM_COMMENT_LENGTH']." letters!
			</div>";
		}
		if (!$errors) {
			echo "<div class='alert-message success'>
			    <div class='box-icon'></div>
			        Your comment has been inserted to database, and this page will refresh in 3 seconds!
			</div>";
			echo '<meta http-equiv="refresh" content="3">';
			mysql_query("INSERT INTO `supportTickets_comments` (ticketId, comment, from_user, date_post) VALUES ('$ticketdIdUrl','$commentText','testFrom','testDate')");
	}	}


	?> 

	<style type="text/css">
		.contentBoxSupportTicket {
			display:none;
		}
	</style>

	<div class="contentBoxSupportTicketFetch"> <!-- Content box -->
		<h2>Ticket Info</h2>
		<?php foreach ($getIn as $getOut) { ?>
		Ticket status: <?php  
		echo $getOut['status'];
				?>
		<div class="supportTicketCases">
			Category: <?php echo $getOut['category']; ?><br> 
			Created: <?php echo $getOut['created']; ?><br> 
			Description: <?php echo $getOut['contentText']; ?><br> 
		</div>
		<?php } ?>

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
		<a href="supportTicket.php">Back..</a>
	</div> <!-- Content box end -->
	
	<div class="contentBoxSupportTicketFetch"> <!-- Content box -->
		<form method="POST" action="">
			<label>Comment</label>
			<input type="text" name="commentText"> -- Comment should not be longer than 140 letters!
			<?php 
			$ticketdIdUrl = $_GET['tickedId'];
			$checkStatusFast = mysql_select_multi("SELECT * FROM `supportTickets` WHERE `id`='$ticketdIdUrl'");
			foreach ($checkStatusFast as $v) {
			if ($v['status'] == "Closed") { ?>
			<input type="submit" value="Comment!" disabled>
			<?php } else { ?>
			<input type="submit" value="Comment!">
			<?php } }?>
		</form>
	</div>
	<?php

}

?>
<?php
// GET
$url = $_GET['id'];
if ( $url == "newTicket") { ?>
<style type="text/css">
		.contentBoxSupportTicket {
			display:none;
		}
	</style>
<h2><b>Create a new ticket:</h2></b>
<div class="contentBoxSupportTicketNew">
	<div class="supportTicketCases">
		<form method="POST" action="">
			<label>Choose an category</label>
			<select name="categorySupport">
			  <option value="In-Game Problem">In-Game Problem</option>
			  <option value="Donation Problem">Donation Problem</option>
			  <option value="Reporting a bugg">Reporting a bugg</option>
			  <option value="Other..">Other..</option>
			</select>
				<label>Please explain what you need help with below:</label>
				<textarea rows="5" cols="75" name="supportText">
					<?php echo $supportText; ?>
				</textarea>
				<input type="submit" value="Send!">
		</form>
	</div>
		<a href="supportTicket.php">Close this form</a>
</div>
<?php }

?>

<div class="contentBoxSupportTicket">
<h2><b>Your Support Tickets:</h2></b>
	<?php 
		$accountNameGet = $user_data['name'];
		$supportTicketsLoop = mysql_select_multi("SELECT * FROM `supportTickets` WHERE `accountName`='$accountNameGet' ORDER BY ID DESC");
		if ($supportTicketsLoop !== false) {
		if (is_array($supportTicketsLoop)) {
			foreach ($supportTicketsLoop as $sup) {
	?>
	<div class="supportTicketCases">
		<a href="?tickedId=<?php echo $sup['id'] ?>">Support ticket created regarding category <b><?php echo $sup['category']; ?> </b></a> --- Status: <?php echo $sup['status'] ?>
	</div>
<?php } } }?>
	<a href="?id=newTicket">Create a new ticket</a>
</div>


<?php include 'layout/overall/footer.php'; ?>