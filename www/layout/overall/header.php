<?php
	$time = microtime();
	$time = explode(' ', $time);
	$time = $time[1] + $time[0];
	$start = $time;
?>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  
  <head>
    <title>Aeia OTS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <link rel="stylesheet" href="layout/css/bootstrap.css">
    <link rel="stylesheet" href="layout/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="layout/css/style.css">
    <script src="layout/js/jquery.min.js"></script>
    <script src="layout/js/bootstrap.min.js"></script>	
	<meta name="description" content="Welcome to AieaOTS">
	<meta name="keywords" content="tibia,amiroslo,znote,aac,ot">
	<meta name="author" content="dominique120">
  <style type="text/css">
  #container, .zmenu {
    max-width: 1400px;
    margin: auto;
  }
  .bighr {
    height: 3px;
    padding: 0px; 
    margin: 0px;
  }
  hr {
    padding: 0px; 
    margin: 0px;
    margin-bottom: 5px;
  }
  /* /////////\/\\\\\\\\
   //  Znote FORUM  \\
   /////////\/\\\\\\\\ */
.adminTable {
  margin: 0px;
  padding: 0px;
  position: relative;
  display: block;
  top: -21px; /* EDIT THIS TO ADJUST BUTTON PRECITION */
}
.adminTable tr td {
  width: 210px;
}
.adminTable tr td form input {
  width: 130px;
  height: 35px;
}
.postButton {
  margin: 0px;
  padding: 0px;
  padding-right: 15px;
  position: relative;
  display: block;
  float: left;
  top: -18px; /* EDIT THIS TO ADJUST BUTTON PRECITION */
}

.editThread {
  margin: 0px;
  padding: 0px;
  position: relative;
  display: block;
  float: left;
  top: -18px; /* EDIT THIS TO ADJUST BUTTON PRECITION */
}
.editThread tr, .editThread tr td, .editThread tr td form, .editThread tr td form input {
  margin: 0px;
  padding: 0px;
  height: 20px;
}
.updateTable tr td input {
  width: 500px;
}

.forumReply {
  position: relative;
  display: block;
  top: 7px;
}
  /* 1400
  #container, .zmenu {
    max-width: 1200px;
    margin: auto;
  }

  */
  
  .wellTitle {
background-color:#e5e5e5;
width:96%;
}
  .wellNews {
}
  </style>
  </head>
  <body>
    <div id="container">
      <div class="navbar">
        <div class="navbar-inner">
          <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
              <div class="container-fluid zmenu">
                  <!--
              <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </a>

              -->
                
                <a href="index.php" class="brand"><?php echo $config['site_title'];?></a>
                <div>
                  <?php include 'layout/menuLinkTop.php'; ?>
                </div>
                <form class="navbar-search" action="characterprofile.php">
                  <input name="name" type="text" class="input-block-level search-query input-medium"
                  placeholder="Character search..." id="searchbox"> 
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
   
      <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <b>News!</b> Updated to 10.31               <!--add important news here -->
      </div>
      
      <div class="container-fluid">
        <div class="row-fluid">

          <?php include 'layout/menuLeft.php'; ?>

		  
          <!-- center -->
          <div class="span6">
            <br>
          <div class="wellNews">
		  <p></p>
		          
